#define LOOP_FINISH 0x80010000
#define GAME_STOP 0x80010004
#define RAND 0x80010008
#define KEY 0x8001000c

#define VIDEO_MEM 0x80020000

#define H_MAX 200
#define V_MAX 150
#define CELL_LEN 10

// extern void print(char *message);

void draw_cell(int x, int y, int color){
	int v_pos = x * CELL_LEN;
	int h_pos = y * CELL_LEN;

	int *p;

	for(int i = v_pos; i < v_pos + CELL_LEN; i++){
		for(int j=h_pos; j < h_pos + CELL_LEN; j++){
			p = (int *)(VIDEO_MEM + (i * H_MAX + j)*4 );
			*p = color;	// 写入颜色
		}
	}
}

void clear_screen(){
	for(int i=0; i< (V_MAX / CELL_LEN); i++){
		for(int j=0; j< (H_MAX / CELL_LEN); j++){
			draw_cell(i, j, 0x33333333);
		}
	}
}


int main(){
	int *loop_finish = (int *)0x80010000;
	int *game_stop = (int *)0x80010004;


	// print("Game Over");
	
	clear_screen();
	
	draw_cell(0, 0, 0x55555555);
	draw_cell(3, 7, 0x55555555);
	draw_cell(8, 8, 0x99999999);
	
	
	return 0;

}
