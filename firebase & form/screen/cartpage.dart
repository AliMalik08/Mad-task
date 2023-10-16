import 'package:flutter/material.dart';
import 'package:furnitureui/model/product_model.dart';
import 'package:furnitureui/screen/Paymentpage.dart';
import 'package:furnitureui/screen/cart.dart';

class CartPage extends StatelessWidget {
  final Cart cart;

  CartPage({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.products.length,
        itemBuilder: (context, index) {
          ProductModel product = cart.products[index];
          return Card(
            child: ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Total: \$${cart.calculateTotalPrice()}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      // Navigate back to the previous screen (ProductDetailsScreen)
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor:
                Colors.grey, // Set the text color to white when button is grey
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Navigate to the payment page with the product details and total payment
            moveToPaymentPage(context, cart);
          },
          child: Text('Proceed to Payment'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor:
                Colors.grey, // Set the text color to white when button is grey
          ),
        ),
      ],
    );
  }

  void moveToPaymentPage(BuildContext context, Cart cart) {
    // Collect product details and total payment
    String productsDetails = '';
    double totalPayment = cart.calculateTotalPrice();

    for (var product in cart.products) {
      productsDetails +=
          'Product: ${product.name}, Price: \$${product.price}\n';
    }

    // Navigate to the payment page and pass product details and total payment
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentPage(
            productsDetails: productsDetails, totalPayment: totalPayment),
      ),
    );
  }
}
