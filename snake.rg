Init:
	USE_TABLE(10);

	// 每一节的坐标
	// 以及prev/next指针
	var x_pos[20];
	var y_pos[20];	
	var prev[20];
	var next[20];
	
	var p;
	
	var snake_len = 1;
	var head_ptr = 0;

	x_pos[head_ptr] = 7;
	y_pos[head_ptr] = 10;
	
	prev[0] = 0;
	next[0] = 0;


	var head_x,head_y;
	var tail_x,tail_y;

	head_x = x_pos[head_ptr];
	head_y = x_pos[head_ptr];


	var i,j;

	// 初始化画面
	for( i=0; i<15; i=i+1){
		for( j=0; j<20; j=j+1){
			DRAW_CELL(i, j, 0x55555555);
		}
	}

	nan = nan;

	// 画出第一节蛇
	DRAW_CELL(head_x, head_y, 0x99999999);

	var direction = 4;		// 0, 1, 2, 3代表 wasd

	// 生成食物

	var food_x, food_y;
	food_x = RAND & 15;
	if (food_x >= 15){
		food_x = food_x - 7;	// 防越界修正
	}
	food_y = RAND & 31;
	if (food_y >= 20){
		food_y = food_y - 15;
	}


Update:
	if (KEY1 > 0) {
		direction = 0;
	}
	else {
		if (KEY2 > 0){
			direction = 1;
		}
		else{
			if (KEY3 > 0) {
				direction = 2;	
			}
			else {
				if(KEY4 > 0){
					direction = 3;
				}
			}
		}

	}

	

	
	
	
	
	
	
	


