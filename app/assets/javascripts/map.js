/**
 * 百度地图API
 */

 (function($, window, document, undefined) {

 	var Map = window.Map = {

 			/**
 			 * 基础地图对象
 			 */
 			_map: undefined,

 			/**
 			 * 配置项
 			 */
 			_settings: undefined,

 			/**
 			 * 装配Map对象
 			 */
 			setup: function(settings) {
 				this._settings = settings;

 				// 初始化宽高
 				this._setViewWidthHeight();

				// 初始化地图
				var map = new BMap.Map(settings.target.attr("id"));
				this._map = map;

				// 是否开启鼠标滚轮缩放
				if(settings.scrollWheelZoom) {
					map.enableScrollWheelZoom(true);
				} else {
					map.disableScrollWheelZoom();
				}
			  // 是否启用放大缩小
			  if(settings.navigationControl) {
			  	map.addControl(new BMap.NavigationControl(settings.navigation));
			  }
			  // 是否启用实景地图
			  if(settings.panoramaControl) {
			  	map.addControl(new BMap.PanoramaControl());
			  }
			  // 是否初始化城市中心点
			  if(settings.city) {
			  	map.centerAndZoom(settings.city, settings.zoomLevel);
			  }

			  this.addPointOverlay(settings.points);

			  return this;
 			},

 			/**
 			 * 给地图增加点标记
 			 */
 			addPointOverlay: function(points) {
 				var settings = this._settings;
 				if(points === undefined || points.length < 1) {
	 				return;
	 			}
	 			// 获取地图边框
	 			var bounds = this._map.getBounds();
	 			var pointArray = [];
	 			for(var i = 0; i < points.length; i++) {
	 				// 创建一个地图Point
	 				var p = new BMap.Point(points[i].lon, points[i].lat);
	 				pointArray.push(p);
	 				var marker = new BMap.Marker(p);
	 				this._map.addOverlay(marker);
	 				var label = new BMap.Label(points[i].content, {
	 					offset: new BMap.Size(5, 2)
	 				});
	 				label.setStyle({
	 					background: "transparent",
	 					border: "0",
	 					color: "#ffffff"
	 				});
					marker.setLabel(label);
	 			}
	 			// 设置最佳视图
				window.setTimeout(function() {
					Map._map.setViewport(pointArray);
				}, 500);
	 			
 			},

 			animation: function(content) {
 				var overlays = this._map.getOverlays();
 				var target = undefined;
 				for (var i = 0; i < overlays.length - 1; i++) {
 					var overlay = overlays[i];
					if(overlay.getLabel().content == content) {
						target = overlay;
						overlay.setAnimation(BMAP_ANIMATION_BOUNCE);
						setTimeout(function() {
							if(target != undefined) {
								target.setAnimation(null);
							}
						}, 1500);
					}
				}

 			},

 			/**
 			 * 设置地图视图宽度和高度
 			 */
 			_setViewWidthHeight: function() {
 				var settings = this._settings,
							 $view = settings.target;
	 			$view.css("width", settings.width === "auto" ? "100%" : settings.width);
	 			if(settings.height === "auto") {
	 				$view.height($view.width());
	 			} else {
	 				$view.height(settings.height);
	 			}
	 		},


	 		panToCity: function(city) {
	 			window.setTimeout(function() {
	 				var bdary = new BMap.Boundary();
		 			// 获取行政区域
		 			bdary.get(city, function(rs) {      
						Map._map.clearOverlays();               
						var count = rs.boundaries.length;
						for(var i = 0; i < count; i++) {
							//建立多边形覆盖物
							var ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "#ff0000"}); 
							Map._map.addOverlay(ply);
							Map._map.setViewport(ply.getPath());
						} 
					});
	 			}, 500);
	 		}

 		};


 	jQuery.fn.map = function(options) {

 		// 地图配置
 		var settings = {

 			// DOM对象
 			target: $(this),
			
 			// 宽度，如果为auto则显示100%宽
			width: "auto",

			// 高度，如果为auto则和宽度成正比例
			height: "auto",

			// 初始化城市
			city: undefined,
			// 默认地图层级，默认为10级
			zoomLevel: 10,

			// 是否开启缩放平移控件
			navigationControl: true,
			// 缩放平移控件配置
			navigation: {
				// 缩放按钮位置
				anchor: BMAP_ANCHOR_TOP_LEFT,
				// 缩放控件type有四种类型:
				// BMAP_NAVIGATION_CONTROL_LARGE	标准的平移缩放控件（包括平移、缩放按钮和滑块）。
				// BMAP_NAVIGATION_CONTROL_SMALL	仅包含平移和缩放按钮。
				// BMAP_NAVIGATION_CONTROL_PAN	仅包含平移按钮。
				// BMAP_NAVIGATION_CONTROL_ZOOM	仅包含缩放按钮。
				type: BMAP_NAVIGATION_CONTROL_LARGE
			},

			// 是否开启全景地图，默认不开启
			panoramaControl: false,

			// 是否开启鼠标滚轮缩放，默认为false
			scrollWheelZoom: false,

			/** 标记点集合 
				[
					{lon: 131, lat: 21, content: "1"},
				 	{lon: 131, lat: 21, content: "2"},
			 	 	{lon: 131, lat: 21, content: "3"}
			 	]
			 	说明：content: 内容 
			 */
			points: undefined
		};

		if(options) {
			$.extend(settings, options);
		}

 		return Map.setup(settings);
 	};

})(jQuery, window, document, undefined);