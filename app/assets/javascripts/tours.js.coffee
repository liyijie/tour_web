$ ->
  map = new BMap.Map("bmap");
  map.disableScrollWheelZoom();
  map.addControl(new BMap.NavigationControl());
  map.addControl(new BMap.PanoramaControl());
  myGeo = new BMap.Geocoder();
  myGeo.getPoint(tour_addr, (point)->
    if (point)
      map.centerAndZoom(point, 16);
      map.addOverlay(new BMap.Marker(point));
  , city);
