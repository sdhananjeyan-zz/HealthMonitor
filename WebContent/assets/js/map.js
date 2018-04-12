function myMap() {
var mapProp= {
    center:new google.maps.LatLng(12.956,77.714),
    zoom:12,
};
var map=new google.maps.Map(document.getElementById("map-canvas"),mapProp);
}