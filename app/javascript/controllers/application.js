import { Application } from "@hotwired/stimulus"
import Rails from "@rails/ujs"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

// Start Rails UJS
Rails.start()

export { application }