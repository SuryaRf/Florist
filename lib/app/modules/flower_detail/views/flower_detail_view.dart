import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import '../../../data/model/flower.dart';

class FlowerDetailPage extends StatelessWidget {
  final Flower flower;

  const FlowerDetailPage({Key? key, required this.flower}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
            appBar: AppBar(
        title: const Text(
          'Detail',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: Colors.green[400],
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Section
            Container(
              width: width,
              height: height * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  flower.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            // Content Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    flower.name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 4.8,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 24,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(width: 8),
                      Text("4.8 (268 Reviews)", style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Ageratum is a genus of 40 to 60 tropical and warm temperate flowering annuals and perennials from the family Asteraceae, tribe Eupatorieae. Most species are native to Central America...",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoColumn("Ukuran", "Medium"),
                      _buildInfoColumn("Tinggi", "12.6\""),
                      _buildInfoColumn("Kondisi", "Baik"),
                    ],
                  ),
                ],
              ),
            ),
        
            // Bottom Container Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currencyFormatter.format(flower.price),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[700]),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("Stok: ${flower.stock}", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
        ),
      ],
    );
  }
}
