# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->

  if $("#bmap").length > 0
    mapView = $("#bmap").map({
      city: city,
      navigation: {
      	type: BMAP_NAVIGATION_CONTROL_ZOOM
      }
    })
    mapView.Geocoder.getPoint(city, shop_addr, (point) -> 
      if(point) 
        mapView._map.centerAndZoom(point, 16)
        mapView.addOverlay(new BMap.Marker(point))
    );