$ ->

  if $("#tour-list-map").length > 0
    mapView = $("#tour-list-map").map({
      city: city,
      navigation: {
        type: BMAP_NAVIGATION_CONTROL_ZOOM
      }
    });
    mapView.addPointOverlay([{
      lon: 106.662609, lat: 26.620606, content: "1"
    },{
      lon: 106.710327, lat: 26.613887, content: "2"
    },{
      lon: 106.720322, lat: 26.632736, content: "3"
    }])

  if $("#bmap").length > 0
    mapView = $("#bmap").map({
      city: city,
      height: "400px"
    })
    mapView.Geocoder.getPoint(city, tour_addr, (point) -> 
      if(point) 
        mapView._map.centerAndZoom(point, 16)
        mapView.addOverlay(new BMap.Marker(point))
    );

    # map = new BMap.Map("bmap");
    # map.disableScrollWheelZoom();
    # map.addControl(new BMap.NavigationControl());
    # map.addControl(new BMap.PanoramaControl());
    # myGeo = new BMap.Geocoder();
    # myGeo.getPoint(tour_addr, (point)->
    #   if (point)
    #     map.centerAndZoom(point, 16);
    #     map.addOverlay(new BMap.Marker(point));
    # , city);

  if $(".btn-ticket-more").length > 0
    $(".btn-ticket-more").click -> 
      isShow = $(this).attr("isShow");
      if isShow isnt "undefined" and isShow isnt "show"
        $(this).parent().prev(".ticket-table").children(".info:gt(1)").slideDown(300)
        $(this).addClass("dropup")
        $(this).attr("isShow", "show")
        $(this).html("收起<span class='caret'></span>")
      else
        $(this).parent().prev(".ticket-table").children(".info:gt(1)").slideUp(300)
        $(this).removeClass("dropup")
        $(this).attr("isShow", "hide")
        $(this).html("查看更多<span class='caret'></span>")

