import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaymentPage extends StatelessWidget {
  final String productsDetails;
  final double totalPayment;

  PaymentPage(
      {Key? key, required this.productsDetails, required this.totalPayment})
      : super(key: key);

  Future<void> _storeOrderDetails(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      String userId = user?.uid ?? "";

      await FirebaseFirestore.instance.collection('orders').add({
        'userId': userId.toString(),
        'productsDetails': productsDetails,
        'totalPayment': totalPayment,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Order placed successfully!'),
        duration: Duration(seconds: 2),
      ));

      // Navigate back to the home page after placing the order
      Navigator.popUntil(context, (route) => route.isFirst);
    } catch (e) {
      print('Error storing order: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to place the order. Please try again later.'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Products Details:'),
            Text(productsDetails),
            Text('Total Payment: \$${totalPayment.toStringAsFixed(2)}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _storeOrderDetails(context),
              child: Text('Place Order'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors
                    .grey, // Set the text color to white when button is grey
              ),
            ),
          ],
        ),
      ),
    );
  }
}
