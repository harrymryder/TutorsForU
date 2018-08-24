const mapElement = document.getElementById('map');
const tutorMarkers = JSON.parse(mapElement.dataset.tutors)
console.log(tutorMarkers)
const queryMarker = JSON.parse(mapElement.dataset.query)

var tutorVectorSource = new ol.source.Vector({
  //create empty vector
  });
tutorMarkers.forEach((tutor) => {
  var iconFeature = new ol.Feature({
    geometry: new ol.geom.Point(ol.proj.fromLonLat([tutor.longitude,tutor.latitude])),
    name: tutor.name
  });
  tutorVectorSource.addFeature(iconFeature);
})
var queryVectorSource = new ol.source.Vector({
  //create empty vector
  });
var iconFeature = new ol.Feature({
  geometry: new ol.geom.Point(ol.proj.fromLonLat([queryMarker[1],queryMarker[0]])),
});
queryVectorSource.addFeature(iconFeature);

var tutorIconStyle = new ol.style.Style({
  image: new ol.style.Icon(({
    anchor: [0.5, 46],
    anchorXUnits: 'fraction',
    anchorYUnits: 'pixels',
    opacity: 1,
    scale: 0.08,
    src: document.getElementById('map').dataset['logo']
  }))
});
var queryIconStyle = new ol.style.Style({
  image: new ol.style.Icon(({
    anchor: [0.5, 46],
    anchorXUnits: 'fraction',
    anchorYUnits: 'pixels',
    opacity: 0.75,
    scale: 0.08,
    src: document.getElementById('map').dataset['pin']
  }))
});
var tutorsVectorLayer = new ol.layer.Vector({
  source: tutorVectorSource,
  style: tutorIconStyle
});
var queryVectorLayer = new ol.layer.Vector({
  source: queryVectorSource,
  style: queryIconStyle
});

var map = new ol.Map({
  target: 'map',
  layers: [new ol.layer.Tile({ source: new ol.source.OSM()}), tutorsVectorLayer, queryVectorLayer],
  view: new ol.View({
    center: ol.proj.fromLonLat([queryMarker[1],queryMarker[0]]),
    zoom: 12
  })
});
