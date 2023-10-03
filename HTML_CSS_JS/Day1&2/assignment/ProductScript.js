function calculateTotal() {
    var total = 0;
    var discount = 0;
    var pay=0;

    // Get the selected products and quantities
    var product1Quantity = parseInt(document.getElementById("product1Quantity").value);
    var product2Quantity = parseInt(document.getElementById("product2Quantity").value);
    var product3Quantity = parseInt(document.getElementById("product3Quantity").value);
    var product4Quantity = parseInt(document.getElementById("product4Quantity").value);

    // Calculate the total price
    total += product1Quantity * 150; // Product 1 price is 150
    total += product2Quantity * 200; // Product 2 price is 200
    total += product3Quantity * 300; // Product 3 price is 300
    total += product4Quantity * 250; // Product 4 price is 250
    // Apply discount if total is above 1000
    if (total > 1000) {
        discount = total * 0.1; // 10% discount
        
    }
    pay =total-discount;
    // Display the total price and discount
    document.getElementById("total").innerHTML = "Total Price: " + total.toFixed(2);
    document.getElementById("discount").innerHTML = "Discount on price: " + discount.toFixed(2);
    document.getElementById("pay").innerHTML = "Total Payble Amount: " + pay.toFixed(2);
}