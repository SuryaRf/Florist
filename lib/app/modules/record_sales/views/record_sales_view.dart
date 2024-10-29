import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/record_sales_controller.dart';

class RecordSalesView extends GetView<RecordSalesController> {
  const RecordSalesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecordSalesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RecordSalesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
