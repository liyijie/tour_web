// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require lazyload
//= require_tree .

// 程序主JS
// @author suntongwei
(function($, window, document, undefined) {

	var BasePath = window.BasePath = window.location.protocol + "//" + window.location.host + "/"
	var ResPath  = window.ResPath  = BasePath;

	var isDebug = window.isDebug = true;


	var Web = window.Web = {

		Top : {

			init : function(menuId) {
				$(menuId).addClass('active');
			}

		}

	};

	jQuery(document).ready(function($) {
		
		$("img").lazyload();



	});

})(jQuery, window, document, undefined);