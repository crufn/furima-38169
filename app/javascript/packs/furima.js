window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const price = parseInt(inputValue, 10);

    if (!isNaN(price)) {
      const addTax = Math.floor(price * 0.1); 
      const profit = price - addTax; 

      addTaxDom.innerHTML = addTax.toLocaleString() + "";
      profitDom.innerHTML = profit.toLocaleString() + "";
    } else {
      addTaxDom.innerHTML = "0"; 
      profitDom.innerHTML = "0"; 
    }
  });
});
