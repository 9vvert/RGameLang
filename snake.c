#define LOOP_FINISH 0x80010000
#define GAME_STOP 0x80010004
#define RAND 0x80010008
#define KEY 0x8001000c

#define VIDEO_MEM 0x80020000

#define H_MAX 200
#define V_MAX 150
#define CELL_LEN 4

// 网格大小（不再计算，写成常量）
#define MAP_H 15 // vertical cells
#define MAP_W 20 // horizontal cells

// 颜色（随便选了一些）
#define COLOR_BG 0x33333333
#define COLOR_SNAKE 0x00FF00FF
#define COLOR_FOOD 0x00FFFFFF

// 蛇最大长度（整个地图 15*20 = 300）
#define SNAKE_MAX_LEN 20

// extern void print(char *msg);

void draw_cell(int x, int y, int color) {
  int v_pos = x * CELL_LEN;
  int h_pos = y * CELL_LEN;

  int *p;

  for (int i = v_pos; i < v_pos + CELL_LEN; i++) {
    for (int j = h_pos; j < h_pos + CELL_LEN; j++) {
      p = (int *)(VIDEO_MEM + (i * H_MAX + j) * 4);
      *p = color; // 写入颜色
    }
  }
}

void clear_screen() {
  for (int i = 0; i < MAP_H; i++) {
    for (int j = 0; j < MAP_W; j++) {
      draw_cell(i, j, COLOR_BG);
    }
  }
}

// 简单的方向定义
// dx, dy 分别是纵向、横向方向增量
#define DIR_UP 0
#define DIR_DOWN 1
#define DIR_LEFT 2
#define DIR_RIGHT 3

int main() {
  int *loop_finish = (int *)LOOP_FINISH;
  int *game_stop = (int *)GAME_STOP;
  unsigned int *rand_reg = (unsigned int *)RAND;
  unsigned int *key_reg = (unsigned int *)KEY;

  unsigned rand;
  unsigned key;

  // 蛇身体坐标数组，index 0 是蛇头
  int snake_x[SNAKE_MAX_LEN];
  int snake_y[SNAKE_MAX_LEN];
  int snake_len;

  // 蛇当前移动方向
  int dir = DIR_RIGHT;

  // 食物位置
  int food_x = 5;
  int food_y = 10;
  int has_food = 1;

  // 初始化屏幕
  // clear_screen();

  // 初始化蛇：长度 3，水平向右
  // 把蛇大致放在中间
  int start_x = 7;
  int start_y = 5;
  snake_len = 3;

  snake_x[0] = start_x;
  snake_y[0] = start_y + 2; // 头
  snake_x[1] = start_x;
  snake_y[1] = start_y + 1;
  snake_x[2] = start_x;
  snake_y[2] = start_y;

  // 初始渲染蛇
  for (int i = 0; i < snake_len; i++) {
    draw_cell(snake_x[i], snake_y[i], COLOR_SNAKE);
  }

  // 初始食物
  draw_cell(food_x, food_y, COLOR_FOOD);

  while (!(*game_stop)) {
    // draw_cell(dx, dy, 0x99999999);
    //
    // if(dy < 19){
    // 	dy ++;
    // }
    // else{
    // 	dy = 0;
    // 	if(dx < 14){
    // 		dx ++;
    // 	}
    // 	else{
    // 		dx = 0;
    // 	}
    // }

    // 每帧逻辑

    // // 1. 读取按键，更新方向（简单防抖：只有有键按下才更新）

    key = *key_reg;

    // 注意：这里假定不能直接反向（避免立刻撞到自己）
    if (key & 0x1) { // 上
      if (dir != DIR_DOWN)
        dir = DIR_UP;
    } else if (key & 0x2) { // 下
      if (dir != DIR_UP)
        dir = DIR_DOWN;
    } else if (key & 0x4) { // 左
      if (dir != DIR_RIGHT)
        dir = DIR_LEFT;
    } else if (key & 0x8) { // 右
      if (dir != DIR_LEFT)
        dir = DIR_RIGHT;
    }

    // 2. 计算新头位置（带环绕），不使用求余/变量除法
    int head_x = snake_x[0];
    int head_y = snake_y[0];

    int new_x = head_x;
    int new_y = head_y;

    if (dir == DIR_UP) {
      new_x = head_x - 1;
      if (new_x < 0) {
        // 上越界则到最底一行 14
        new_x = MAP_H - 1; // 14
      }
    } else if (dir == DIR_DOWN) {
      new_x = head_x + 1;
      if (new_x >= MAP_H) {
        new_x = 0;
      }
    } else if (dir == DIR_LEFT) {
      new_y = head_y - 1;
      if (new_y < 0) {
        new_y = MAP_W - 1; // 19
      }
    } else if (dir == DIR_RIGHT) {
      new_y = head_y + 1;
      if (new_y >= MAP_W) {
        new_y = 0;
      }
    }

    // 3. 判断是否撞到自己（简单版本：如果新头位置与身体任意节重合则“结束”）
    int collide = 0;
    for (int i = 0; i < snake_len; i++) {
      if (snake_x[i] == new_x && snake_y[i] == new_y) {
        collide = 1;
        break;
      }
    }
    if (collide) {
      // 碰撞直接结束游戏
      *game_stop = 1;
    }

    // 如果游戏已经被置停，则不再更新后续逻辑
    if (*game_stop) {
      break;
    }

    // 4. 判断是否吃到食物
    int grow = 0;
    if (has_food && new_x == food_x && new_y == food_y) {
      grow = 1;
      has_food = 0;
    }

    // 5. 渲染逻辑：
    //    如果不成长：擦除尾部一格
    //    如果成长：尾部保留
    if (!grow) {
      // 尾部坐标（当前最后一个）
      int tail_x = snake_x[snake_len - 1];
      int tail_y = snake_y[snake_len - 1];
      // 擦除尾部
      draw_cell(tail_x, tail_y, COLOR_BG);
    }

    // 6. 更新蛇身体坐标数组
    // 从后往前移动
    if (!grow) {
      // 不成长时，长度不变，从后依次前移
      for (int i = snake_len - 1; i > 0; i--) {
        snake_x[i] = snake_x[i - 1];
        snake_y[i] = snake_y[i - 1];
      }
      snake_x[0] = new_x;
      snake_y[0] = new_y;
    } else {
      // 成长时，先整体后移一格，长度+1
      // 注意这时尾部不擦除，因此新尾部是原来的尾部复制出来的
      for (int i = snake_len; i > 0; i--) {
        snake_x[i] = snake_x[i - 1];
        snake_y[i] = snake_y[i - 1];
      }
      snake_x[0] = new_x;
      snake_y[0] = new_y;
      if (snake_len < SNAKE_MAX_LEN) {
        snake_len++;
      }
    }

    // 7. 画新的头部（新格）
    draw_cell(new_x, new_y, COLOR_SNAKE);

    // 8. 如果刚刚吃掉食物，则生成新的食物
    if (!has_food) {
      // 使用 RAND 寄存器生成一个新位置
      // 这里依然避免变量除法：我们可以从随机数中取低几位做“模”。
      unsigned int r = *rand_reg;

      // 对横向：20   ->  低 5 位 (0~31)，如果 >=20 就减去 12 或者减去 20 再判断
      int nx = (int)(r & 0x0F);        // 0~15
      int ny = (int)((r >> 8) & 0x1F); // 0~31

      if (nx >= MAP_H) {
        // MAP_H = 15, nx∈[15]时只能是15，减去 15 得 0
        nx = nx - MAP_H; // 保证落在 [0,14]
      }
      if (ny >= MAP_W) {
        // MAP_W = 20, 如果>=20 就减去 12，使其落在 [0,19] 范围可能性更大
        ny = ny - 12;
        if (ny >= MAP_W) {
          // 极少见情况，再减一次
          ny = ny - 12;
        }
      }

      // 简单保证不生成在蛇身上，如果生成在蛇身则简单顺着往右/往下偏移几格
      int conflict = 1;
      int try_count = 0;
      while (conflict && try_count < 50) {
        conflict = 0;
        for (int i = 0; i < snake_len; i++) {
          if (snake_x[i] == nx && snake_y[i] == ny) {
            conflict = 1;
            break;
          }
        }
        if (conflict) {
          // 往右移一格，越界则回到 0
          ny++;
          if (ny >= MAP_W)
            ny = 0;
          try_count++;
        }
      }

      food_x = nx;
      food_y = ny;
      has_food = 1;
      draw_cell(food_x, food_y, COLOR_FOOD);
    }

    // 9. 等待下一帧时钟
    while (!(*loop_finish)) {
      ;
    }
    *loop_finish = 0;
  }

  return 0;
}
