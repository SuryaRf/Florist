import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Sale {
  String productName;
  int quantity;
  double price;

  Sale({required this.productName, required this.quantity, required this.price});
}

class RecordSalesController extends GetxController {
  TextEditingController productNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  // Reactive list of sales
  var sales = <Sale>[].obs;

  // Total amount calculation
  double get totalAmount => sales.fold(0, (sum, item) => sum + (item.quantity * item.price));

  // Method to add a sale
  void addSale() {
    final productName = productNameController.text;
    final quantity = int.tryParse(quantityController.text) ?? 0;
    final price = double.tryParse(priceController.text) ?? 0.0;

    if (productName.isNotEmpty && quantity > 0 && price > 0) {
      sales.add(Sale(productName: productName, quantity: quantity, price: price));
      clearFields();
    }
  }

  // Clear text fields after adding a sale
  void clearFields() {
    productNameController.clear();
    quantityController.clear();
    priceController.clear();
  }
}
