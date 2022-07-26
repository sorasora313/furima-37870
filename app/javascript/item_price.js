window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     console.log(inputValue);
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
     const addProfitDom = document.getElementById("profit");
     addProfitDom.innerHTML = Math.floor(inputValue  - addTaxDom.innerHTML);

  })
});