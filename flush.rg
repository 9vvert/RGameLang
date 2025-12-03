Init:
	USE_TABLE(10);

	var x = 0, y = 0;
	var i, j;

	// 初始化画面
	for(i=0; i<15; i=i+1){
		for(j=0; j<20; j=j+1){
			DRAW_CELL(i, j, 0x55555555);
		}
	}

Update:
	DRAW_CELL(x, y, 0x99999999);
	if x < 20 {
		x = x + 1;
	}
	else {
		x = 0;
		if y < 15 {
			y = y + 1;
		}
		else {
			y = 0;
		}
	}

	
	
	
	


