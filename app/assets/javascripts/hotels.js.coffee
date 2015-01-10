$ ->
  # map = new BMap.Map("bmap");
  # map.disableScrollWheelZoom();
  # map.addControl(new BMap.NavigationControl());
  # map.addControl(new BMap.PanoramaControl());
  # myGeo = new BMap.Geocoder();
  # myGeo.getPoint(hotel_addr, (point)->
  #   if (point)
  #     map.centerAndZoom(point, 16);
  #     map.addOverlay(new BMap.Marker(point));
  # , city);

  

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


  if $("#hotel-list-map").length > 0
    mapView = $("#hotel-list-map").map({
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