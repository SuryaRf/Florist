import 'package:flutter/material.dart';
import '../../../data/model/flower.dart';

class FlowerDetailPage extends StatelessWidget {
  final Flower flower;

  const FlowerDetailPage({Key? key, required this.flower}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(flower.name),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              flower.image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              flower.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Stock: ${flower.stock}',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),
            Text(
              'Description goes here...', // Add any additional details you want.
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
