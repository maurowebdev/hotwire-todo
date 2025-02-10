import { Controller } from "@hotwired/stimulus"
import { put } from "@rails/request.js"

// Connects to data-controller="checkbox"
export default class extends Controller {
  static values = { url: String }

  async update(e) {
    let checkbox = e.target
    let checked = checkbox.checked
    console.log("updating checkbox", checked)
    const response = await put(this.urlValue, {
      body: {
        status: checked ? "completed" : "pending"
      },
      responseKind: "turbo-stream"
    })
  }
}
