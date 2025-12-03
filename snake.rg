Init:
	USE_TABLE(10);

	// 每一节的坐标
	// 以及prev/next指针
	var x_pos[20];
	var x_ptr[20];
	var y_pos[20];	
	var y_ptr[20];	
	var snake_len = 1;

	var head_x = 10, head_y = 7;
	var tail_x = 10, tail_y = 7;


	var i,j;

	// 初始化画面
	for(i=0; i<20; i=i+1){
		for(j=0; j<15; j=j+1){
			DRAW_CELL(i, j, 0x55555555)
		}
	}

Update:
	
	


