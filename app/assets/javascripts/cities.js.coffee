$ -> 
  map = new BMap.Map("bmap");
  map.centerAndZoom(city, 12);
  map.disableScrollWheelZoom();
  map.addControl(new BMap.NavigationControl());
  map.addControl(new BMap.PanoramaControl());
