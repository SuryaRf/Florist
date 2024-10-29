class Flower {
  final String name;
  final String image;
  final String description;
  final String stock;

  Flower({required this.name, required this.image, required this.description, required this.stock});

  
}


List<Flower> flowers = [
  Flower(
    name: 'Mawar',
    image: 'lib/app/data/assets/images/mawar.jpg',
    description: 'Bunga yang indah dan harum, sering melambangkan cinta dan romansa.',
    stock: '15',
  ),
  Flower(
    name: 'Tulip',
    image: 'lib/app/data/assets/images/tulip.jpg',
    description: 'Bunga yang cerah dengan banyak warna, populer di musim semi.',
    stock: '20',
  ),
  Flower(
    name: 'Bunga Matahari',
    image: 'lib/app/data/assets/images/matahari.jpg',
    description: 'Bunga besar dan ceria yang mengikuti arah matahari.',
    stock: '10',
  ),
  Flower(
    name: 'Anggrek',
    image: 'lib/app/data/assets/images/anggrek.jpg',
    description: 'Bunga elegan dengan pola kelopak yang unik, melambangkan keindahan eksotis.',
    stock: '8',
  ),
  Flower(
    name: 'Lili',
    image: 'lib/app/data/assets/images/lili.jpg',
    description: 'Bunga anggun dengan aroma yang kuat, sering dikaitkan dengan kemurnian.',
    stock: '12',
  ),
  Flower(
    name: 'Aster',
    image: 'lib/app/data/assets/images/aster.jpg',
    description: 'Bunga sederhana namun menawan dengan kelopak putih dan pusat kuning.',
    stock: '25',
  ),
];
