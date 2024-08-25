
const price = () => {
  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  if (!priceInput) return;

  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    if (inputValue >= 300 && inputValue <= 9999999) {
      const tax = Math.floor(inputValue * 0.1);
      const profitValue = inputValue - tax;
      taxPrice.innerText = tax.toLocaleString();
      profit.innerText = profitValue.toLocaleString();
    } else {
      taxPrice.innerText = '';
      profit.innerText = '';
    }
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);