import 'package:furnitureui/model/product_model.dart';

class Cart {
  List<ProductModel> products = [];

  void addProduct(ProductModel product) {
    products.add(product);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var product in products) {
      totalPrice += product.price;
    }
    return totalPrice;
  }
}

// Create an instance of Cart to manage the cart items
Cart cart = Cart();
