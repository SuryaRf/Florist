import 'package:cloud_firestore/cloud_firestore.dart';

class Flower {
  final String id; // Add this
  final String name;
  final String image;
  final String description;
  final int stock;
  final double price;

  // Update the constructor to include `id`
  Flower({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.stock,
    required this.price,
  });

  // Factory method to create `Flower` from Firestore document
  factory Flower.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Flower(
      id: doc.id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      description: data['description'] ?? '',
      stock: data['stock'] ?? 0,
      price: (data['price'] ?? 0).toDouble(),
    );
  }
}



// List<Flower> flowers = [
//   Flower(
//     name: 'Mawar',
//     image: 'lib/app/data/assets/images/mawar.jpg',
//     description: 'Bunga yang indah dan harum, sering melambangkan cinta dan romansa.',
//     stock: 15,
//     price: 30000, id: ''
//   ),
//   Flower(
//     name: 'Tulip',
//     image: 'lib/app/data/assets/images/tulip.jpg',
//     description: 'Bunga yang cerah dengan banyak warna, populer di musim semi.',
//     stock: 20,
//      price: 30000, id: ''
//   ),
//   Flower(
//     name: 'Bunga Matahari',
//     image: 'lib/app/data/assets/images/matahari.jpg',
//     description: 'Bunga besar dan ceria yang mengikuti arah matahari.',
//     stock: 10,
//      price: 30000, id: ''
//   ),
//   Flower(
//     name: 'Anggrek',
//     image: 'lib/app/data/assets/images/anggrek.jpg',
//     description: 'Bunga elegan dengan pola kelopak yang unik, melambangkan keindahan eksotis.',
//     stock: 8,
//      price: 30000, id: ''
//   ),
//   Flower(
//     name: 'Lili',
//     image: 'lib/app/data/assets/images/lili.jpg',
//     description: 'Bunga anggun dengan aroma yang kuat, sering dikaitkan dengan kemurnian.',
//     stock: 12,
//      price: 30000, id: ''
//   ),
//   Flower(
//     name: 'Aster',
//     image: 'lib/app/data/assets/images/aster.jpg',
//     description: 'Bunga sederhana namun menawan dengan kelopak putih dan pusat kuning.',
//     stock: 25,
//      price: 30000, id: ''
//   ),
// ];
