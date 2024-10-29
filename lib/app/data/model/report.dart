class Report {
  final String name;
  final int amount;
  final String description;
  final DateTime date;
  final String inOut;

  Report({required this.name, required this.amount, required this.description, required this.date, required this.inOut});
}

List<Report> reports = [
  Report(
    name: 'Mawar',
    amount: 10,
    description: 'Penambahan stok untuk Mawar',
    date: DateTime(2024, 10, 25),
    inOut: 'masuk',
  ),
  Report(
    name: 'Tulip',
    amount: 5,
    description: 'Penjualan Tulip',
    date: DateTime(2024, 10, 26),
    inOut: 'keluar',
  ),
  Report(
    name: 'Bunga Matahari',
    amount: 8,
    description: 'Penambahan stok untuk Bunga Matahari',
    date: DateTime(2024, 10, 27),
    inOut: 'masuk',
  ),
  Report(
    name: 'Anggrek',
    amount: 3,
    description: 'Penjualan Anggrek',
    date: DateTime(2024, 10, 28),
    inOut: 'keluar',
  ),
  Report(
    name: 'Lili',
    amount: 15,
    description: 'Penambahan stok untuk Lili',
    date: DateTime(2024, 10, 28),
    inOut: 'masuk',
  ),
  Report(
    name: 'Aster',
    amount: 10,
    description: 'Penjualan Aster',
    date: DateTime(2024, 10, 29),
    inOut: 'keluar',
  ),
  Report(
    name: 'Mawar',
    amount: 7,
    description: 'Penjualan Mawar',
    date: DateTime(2024, 10, 29),
    inOut: 'keluar',
  ),
  Report(
    name: 'Tulip',
    amount: 12,
    description: 'Penambahan stok untuk Tulip',
    date: DateTime(2024, 10, 30),
    inOut: 'masuk',
  ),
  Report(
    name: 'Bunga Matahari',
    amount: 6,
    description: 'Penjualan Bunga Matahari',
    date: DateTime(2024, 10, 31),
    inOut: 'keluar',
  ),
  Report(
    name: 'Anggrek',
    amount: 4,
    description: 'Penambahan stok untuk Anggrek',
    date: DateTime(2024, 11, 1),
    inOut: 'masuk',
  ),
];


