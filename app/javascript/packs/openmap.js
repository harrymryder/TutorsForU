const marker_data = document.getElementById('markers')
const tutor_markers = marker_data.dataset.tutors
const query_marker = marker_data.dataset.query
console.log(tutor_markers)
console.log(query_marker)

var vectorSource = new ol.source.Vector({
  //create empty vector
  });

tutor_markers.forEach((tutor) => {
  console.log(tutor)
  var iconFeature = new ol.Feature({
  geometry: new ol.geom.Point(ol.proj.fromLonLat([tutor.longitude,tutor.latitude])),
  name: tutor.name
  });

  vectorSource.addFeature(iconFeature);
})


var iconStyle = new ol.style.Style({
  image: new ol.style.Icon(({
    anchor: [0.5, 46],
    anchorXUnits: 'fraction',
    anchorYUnits: 'pixels',
    opacity: 0.75,
    src: 'http://openlayers.org/en/v3.9.0/examples/data/icon.png'
  }))
});
var vectorLayer = new ol.layer.Vector({
  source: vectorSource,
  style: iconStyle
});

var map = new ol.Map({
  target: 'map',
  layers: [new ol.layer.Tile({ source: new ol.source.OSM()}), vectorLayer],
  view: new ol.View({
    center: ol.proj.fromLonLat([-0.1235992, 51.5787402]),
    zoom: 13
  })
});
