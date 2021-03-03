window.onload = function(){
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfitDom = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    inputValue = priceInput.value;
    let tax = inputValue * 0.1;
    let profit = inputValue - tax;
    addTaxDom.innerHTML = Math.floor(tax);
    addProfitDom.innerHTML = Math.floor(profit);
  })
}

