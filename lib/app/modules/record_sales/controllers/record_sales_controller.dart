import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:florist/app/modules/record_sales/controllers/db_helper.dart';
import 'package:florist/app/modules/record_sales/models/sale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class Sale {
//   String productName;
//   int quantity;
//   double price;
//   final DateTime timestamp;

//   Sale({required this.productName, required this.quantity, required this.price, required this.timestamp,});
// }

class RecordSalesController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController productNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var totalAmount = 0.0.obs;

  // Reactive list of sales
  var sales = <Sale>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadSales();
  }

  // Total amount calculation
  // double get totalAmount => sales.fold(0, (sum, item) => sum + (item.quantity * item.price));
  // Load sales from SQLite and update total amount
  // Future<void> _loadSales() async {
  //   final localSales = await DBHelper.insertSale(sale);
  //   sales.addAll(localSales);
  //   totalAmount.value = sales.fold(
  //     0,
  //     (sum, item) => sum + (item.quantity * item.price),
  //   );
  // }

  Future<void> _loadSales() async {
    final localSales = await DBHelper.getSales();
    sales.addAll(localSales);
    totalAmount.value = sales.fold(
      0.0,
      (sum, item) => sum + (item.quantity * item.price),
    );
  }

  // Method to add a sale
  void addSale() async {
    final productName = productNameController.text;
    final quantity = int.tryParse(quantityController.text) ?? 0;
    final price = double.tryParse(priceController.text) ?? 0.0;

    if (productName.isNotEmpty && quantity > 0 && price > 0) {
      final newSale = Sale(
        productName: productName,
        quantity: quantity,
        price: price,
        // timestamp: DateTime.now(),
      );
      sales.add(newSale);
      totalAmount.value += newSale.quantity * newSale.price;

      await DBHelper.insertSale(newSale);

      // Simpan data ke Firebase
      await _firestore.collection('sales').add({
        'productName': newSale.productName,
        'quantity': newSale.quantity,
        'price': newSale.price,
        // 'timestamp': newSale.timestamp,
      });

      // Clear input fields
      productNameController.clear();
      quantityController.clear();
      priceController.clear();
    }
  }

  // Clear text fields after adding a sale
  void clearFields() {
    productNameController.clear();
    quantityController.clear();
    priceController.clear();
  }
}
