import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="destroy"
export default class extends Controller {
  connect() {
    const logoutLink = this.element;  // Retrieve the logout link element

    logoutLink.addEventListener('click', (event) => {
      event.preventDefault(); // Prevent the default link behavior

      // Display a confirmation dialog
      const confirmLogout = confirm('Are you sure you want to logout?');

      // If the user confirms, redirect to the logout path
      if (confirmLogout) {
          window.location.href = '<%= destroy_user_session_path %>';
      }
    });
  }
}
