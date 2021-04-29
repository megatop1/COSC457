function showHamburger()
{
	var hamburger_container = document.getElementById("hamburger_container");

	if (hamburger_container.style.display === "block")
	{
		hamburger_container.style.display = "none";
	}
		else
	{
		hamburger_container.style.display = "block";
	}
}

function forceHideHamburger()
{
	var hamburger_container = document.getElementById("hamburger_container");
	if(window.innerWidth >= 941)
		{
			hamburger_container.style.display = "none";
		}
}

function makeBodyColumn()
{
	var block1 = document.getElementById("big_info_block01_JS");
	var block2 = document.getElementById("big_info_block02_JS");
	var body_container = document.getElementById("container");
	var text_blocks = document.getElementsByClassName("info_text_block");
	//var img_blocks = document.getElementsByClassName("info_image_block");
	
	if(window.innerWidth <= 1094)
	{
		block1.style.flexDirection = "column-reverse";
		block2.style.flexDirection = "column";
		body_container.style.width = "100%";
		for(var i = 0; i < text_blocks.length; i++)
			{
				text_blocks[i].style.width = "100%";
			}	
	}
	else
	{
		block1.style.flexDirection = "row";
		block2.style.flexDirection = "row";
		body_container.style.width = "1080px";
		for(var j = 0; j < text_blocks.length; j++)
			{
				
				text_blocks[j].style.width = "60%";
			}	
	}
}