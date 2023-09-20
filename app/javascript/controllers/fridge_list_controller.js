import { Controller } from "@hotwired/stimulus"

  export default class extends FridgeList {

    static targets = ["ingredientList"]

    connect() {

      showIngredients(event){

        const categoryId = event.currentTarget.value;

        fetch(`/categories/${categoryId}/ingredients`)
        .then((response) => response.json())
        .then((data) => {

          this.ingredientListTarget.innerHTML = "";

          data.forEach((ingredient) => {
            const ingredientItem = document.createElement("li");
            ingredientItem.textContent = ingredient.name;
            this.ingredientListTarget.appendChild(ingredientItem);
          })
        })

      }
    }
  }
