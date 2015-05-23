function initialize() {
    if ($("#googleMap").lenght != 0) {
    var latitude = parseInt($("#clinic_latitude").html());
    var longitude = parseInt($("#clinic_longitude").html());

  var mapProp = {
    center:new google.maps.LatLng(latitude, longitude),
    zoom:6,
    mapTypeId:google.maps.MapTypeId.HYBRID
  };
  var map=new 
  google.maps.Map(document.getElementById("googleMap"),mapProp);

  var marker=new google.maps.Marker({
    position: new google.maps.LatLng(latitude, longitude),
    map: map,
    title: 'Local da clínica'
  });     
    }
}
//google.maps.event.addDomListener(window, 'load', initialize);

$(document).ready(initialize);
$(document).on("page:load", initialize);

