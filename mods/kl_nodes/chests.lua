minetest.register_node("kl_nodes:chest", {
	description = "Chest",
	tiles = {"kl_nodes_chest_top.png",
		"kl_nodes_chest_top.png",
		"kl_nodes_chest_side.png",
		"kl_nodes_chest_side.png",
		"kl_nodes_chest_side.png",
		"kl_nodes_chest_front.png"
	},
	paramtype2 = "facedir",
	groups = {choppy=3},
	is_ground_content = false,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local chest_formspec = [[
		
		size[10,8.5]
		real_coordinates[true]
		
		style_type[list;spacing=0,0]
		style[close;border=false;bgimg=kl_background.png;bgimg_pressed=kl_btn_bg_pressed.png;bgimg_middle=5,5;textcolor=#353535]
		listcolors[#ffffff00;#ffffff80]
		background9[0,0;0,0;kl_background.png;true;5]
		
		list[current_player;main;0.5,4.5;9,2;9]
		list[current_player;main;0.5,7;9,1;0]
		list[current_name;main;0.5,1;9,3;]
		
		box[0.10,0.10;9.35,0.4;blue]
		button_exit[9.5,0.10;0.4,0.4;close;x]
		
		label[0.25,0.30;Chest]
		style_type[label;textcolor=#353535]
		label[0.5,4.25;Your inventory]
		label[0.5,0.75;Chest]
		
		${list_bg_chest}
		${list_bg_hotbar}
		${list_bg_inventory}
	]]
		meta:set_string("formspec", chest_formspec
			:gsub('${list_bg_chest}', get_list_bg(0.5,1,9,3))
			:gsub('${list_bg_hotbar}', get_list_bg(0.5,7,9,1))
			:gsub('${list_bg_inventory}', get_list_bg(0.5,4.5,9,2))
		)
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 9*3)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
})
