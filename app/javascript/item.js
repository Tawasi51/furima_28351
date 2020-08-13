window.addEventListener("DOMContentLoaded", () => {
  const priceInput = document.getElementById("item_price");
  const productTax = document.getElementById("add-tax-price");
  const productProfit= document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    const inputValue = document.getElementById("item_price").value;
    productTax.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
    productProfit.innerHTML = Math.floor(inputValue * 0.9).toLocaleString();
  })
});


    // let price = $('.price-input').val();
    // let sales_profit = Math.round(price * 0.9)
    // let sales_commission = (price - sales_profit)
    // $('.sales_commission').html(sales_commission)
    // $('.sales_profit').html(sales_profit)
    // $('#add-tax-price').val(sales_commission)
    // $('#profit').val(sales_profit)
  // })

