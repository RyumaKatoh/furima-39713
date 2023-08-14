function item (){
  const itemPrice  = document.getElementById("item-price");
  const taxPrice  = document.getElementById("add-tax-price");
  const benefit = document.getElementById("profit");
  itemPrice.addEventListener("keyup", () => {
    const price = itemPrice.value;
    const priceItem = parseInt(price);
  
    const priceTax = `${Math.floor(priceItem/10)}`;
    taxPrice.innerHTML = `${priceTax}`;
  
    const profit = `${priceItem - priceTax}`
    benefit.innerHTML = `${profit}`;
  });  
};

window.addEventListener('turbo:load', item);