function calcPrice() {
  const priceInput = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxPrice = Math.floor(inputValue * 0.1);

    addTaxPrice.innerHTML = taxPrice;
    profit.innerHTML = inputValue - taxPrice;
  });
};

window.addEventListener('load', calcPrice);
