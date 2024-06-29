const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDisplay = document.getElementById("profit")

priceInput.addEventListener("input", () => {
  const inputValue = parseInt(priceInput.value);
  const fee = Math.floor(inputValue*0.1);
  addTaxDom.innerHTML = fee;
  const profit = inputValue - fee;
  profitDisplay.innerHTML = profit;
});