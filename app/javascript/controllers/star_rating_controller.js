import { Controller } from "@hotwired/stimulus"
import StarRating from "star-rating.js"

export default class extends Controller {
  connect() {
    console.log("Star rating controller connected")
    new StarRating(this.element)
  }
}
