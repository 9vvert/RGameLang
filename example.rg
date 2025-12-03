Init:
	USE_TABLE(10);

	// 每一节的坐标
	var snake_x[20];
	var snake_y[20];	
	var snake_len = 1;

	var i,j;

	// 初始化画面
	for(i=0; i<20; i=i+1){
		for(j=0; j<15; j=j+1){
			DRAW_CELL(i, j, 0x55555555)
		}
	}

Update:
	
	


