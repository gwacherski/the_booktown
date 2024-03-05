import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  connect() {
    mapboxgl.accessToken = 'pk.eyJ1Ijoia2VsbGVtb25payIsImEiOiJjbHRlZTUweWQwY3dwMmpuOTd4OGN6aWZiIn0.Xy11okG2Goxq4HSwJZhEOQ';

    this.map = new mapboxgl.Map({
	    container: 'map', // container ID
	    style: 'mapbox://styles/mapbox/streets-v12', // style URL

});
  this.addMarkersToMap(map);
  }

  addMarkersToMap(map) {
    // Create a new marker.
    new mapboxgl.Marker()
      .setLngLat([30.5, 50.5])
      .addTo(this.map);
  }
}
