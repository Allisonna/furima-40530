const price = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit")

  priceInput.addEventListener("input", () => {
    const inputValue = parseInt(priceInput.value);
    const fee = Math.floor(inputValue*0.1);
    addTaxDom.innerHTML = fee;
    const profit = Math.floor(inputValue - fee);
    profitDisplay.innerHTML = profit;
  });
};
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);