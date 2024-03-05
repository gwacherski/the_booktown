import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  connect() {
    mapboxgl.accessToken = 'pk.eyJ1Ijoia2VsbGVtb25payIsImEiOiJjbHRlZTUweWQwY3dwMmpuOTd4OGN6aWZiIn0.Xy11okG2Goxq4HSwJZhEOQ';

    const map = new mapboxgl.Map({
	  container: 'map', // container ID
	  style: 'mapbox://styles/mapbox/streets-v12', // style URL // starting zoom
    });
  }
}
