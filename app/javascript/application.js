// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const taxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  priceInput.addEventListener('input', () => {
    const price = parseInt(priceInput.value, 10);
    if (price >= 300 && price <= 9999999) {
      const tax = Math.floor(price * 0.1); // 販売手数料は10%、切り捨て
      const profitAmount = Math.floor(price - tax); // 利益、切り捨て
      taxPrice.textContent = tax;
      profit.textContent = profitAmount;
    } else {
      taxPrice.textContent = '';
      profit.textContent = '';
    }
  });
});
import "item_price"
import "card"