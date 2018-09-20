(function ($) {
 "use strict";
    
	//---------------------------------------------
	//Nivo slider
	//---------------------------------------------
		$('#ensign-nivoslider').nivoSlider({
			effect: 'random',
			slices: 15,
			boxCols: 8,
			boxRows: 4,
			animSpeed: 500,
			pauseTime: 7000,
			startSlide: 0,
			directionNav: true,
			controlNavThumbs: false,
			pauseOnHover: false,
			controlNav: true,
			prevText: '<i class="zmdi zmdi-chevron-left"></i>',
			nextText: '<i class="zmdi zmdi-chevron-right"></i>'
		});

})(jQuery); 