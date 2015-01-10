$ -> 
  # map = new BMap.Map("bmap");
  # map.centerAndZoom(city, 12);
  # map.disableScrollWheelZoom();
  # map.addControl(new BMap.NavigationControl());
  # map.addControl(new BMap.PanoramaControl());

  if $("#bmap").length > 0
    mapView = $("#bmap").map({
      city: city,
      height: "540px"
    })
   	mapView.panToCity(city)