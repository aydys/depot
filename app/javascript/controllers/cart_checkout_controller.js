import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart-checkout"
export default class extends Controller {
  static targets = ['btn']

  initialize() {
    this.disableCheckoutButton()
  }
  
  disableCheckoutButton() {
    this.btnTarget.disabled = window.location.pathname == '/orders/new'
  }
}
