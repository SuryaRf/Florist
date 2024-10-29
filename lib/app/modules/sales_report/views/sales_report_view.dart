import 'package:florist/app/data/model/report.dart';
import 'package:florist/app/modules/detail_sales_report/views/detail_sales_report_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../controllers/sales_report_controller.dart';

class SalesReportView extends GetView<SalesReportController> {
  const SalesReportView({super.key});
  
  String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Laporan',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.green, width: 2),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                reports[index].name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    formatDate(reports[index].date),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jumlah: ${reports[index].amount}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        reports[index].inOut == 'masuk' ? 'Masuk' : 'Keluar',
                        style: TextStyle(
                          color: reports[index].inOut == 'masuk'
                              ? Colors.green
                              : Colors.red,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: GestureDetector(
                onTap: () {
                  // Navigasi ke halaman detail penjualan
                  Get.to(
                    DetailSalesReportView(),
                    arguments: reports[index],
                  );
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    IconlyBold.arrow_right,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
