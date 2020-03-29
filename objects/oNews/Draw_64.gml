if (false) { //!hide
	scrDrawSettings(fMessages,c_black,fa_top,fa_left,0.5);
	draw_rectangle(room_width-rect_x,0,room_width+1,room_height,false);
	draw_line_width_color(room_width-rect_x-1,60,room_width+1,60,2,c_ltgray,c_ltgray);
	draw_set_alpha(1);
	
	if (newsTemp[0] != "") 
		for (var i = 0; i < array_length_1d(newsTemp); i++) {
		//Copy tempArray to string array
		newsMain[i] = newsTemp[i];
		var col = c_white;
		var align = fa_left;
		var alignSublime = 1;
		var det = string_copy(newsMain[i],0,4);

		switch(det) {
			case "<ac>":
				align = fa_center;
				alignSublime = 2;
				newsMain[i] = string_replace(newsMain[i],"<ac>","");
			break;
			
			case "<ar>":
				align = fa_right;
				alignSublime = 64;
				newsMain[i] = string_replace(newsMain[i],"<ar>","");
			break;
			
			case "<cr>":
				col = c_maroon;
				newsMain[i] = string_replace(newsMain[i],"<cr>","");
			break;
			
			case "<cg>":
				col = $8EE566;
				newsMain[i] = string_replace(newsMain[i],"<cg>","");
			break;
			
			case "<cb>":
				col = $D77800;
				newsMain[i] = string_replace(newsMain[i],"<cb>","");
			break;
		}
		
		draw_set_halign(align);
		scrDrawShadow(room_width+6-rect_x/alignSublime,8+(i * 40),newsMain[i],col,c_black,1,0.7);
	}
}

//Draw user information
scrDrawSettings(fMessages,c_white,fa_left,fa_center,1);
scrDrawShadow(32,room_height + 80 - rect_x/4,"Ver: 0.1.1.0\ncreate by 'Tree Topols on Gamedev' (c) 2019",c_gray,c_black,1,0.7);