import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/model/flower.dart';

class HomeController extends GetxController {
  var flowers = <Flower>[].obs;
  var isLoading = true.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchFlowers();
  }

  Future<void> fetchFlowers() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await _firestore.collection('flowers').get();
      flowers.value = snapshot.docs
          .map((doc) => Flower.fromFirestore(doc))
          .toList();
    } finally {
      isLoading.value = false;
    }
  }

  // Fungsi untuk refresh data
  Future<void> refreshData() async {
    await fetchFlowers(); 
  }
}
