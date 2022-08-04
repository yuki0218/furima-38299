function profit_calculation() {
  const price = document.getElementById("item-price");
  price.addEventListener('keyup', () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const commissionRate = 0.1;
    const commission = Math.floor(price.value * commissionRate);

    addTaxPrice.innerHTML = `${commission}`;
    profit.innerHTML = `${price.value - commission}`;
  });
}

window.addEventListener('load', profit_calculation)
  