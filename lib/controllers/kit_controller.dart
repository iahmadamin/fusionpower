import 'package:get/get.dart';

class KitController extends GetxController {
  List<Map<String, dynamic>> products = [
    {
      'imgPath': "assets/images/solar.png",
      'title': "150 kWH",
      'subtitle': "Monthle Prod.",
      'count': 1,
    },
    {
      'imgPath': "assets/images/Deye2-Hybrid-inverter-8kw-300x300.jpg",
      'title': "12 kW",
      'subtitle': "Max Power",
      'count': 1,
    },
    {
      'imgPath': "assets/images/Fusion_battery-300x300.jpg",
      'title': "4.8 kWH",
      'subtitle': "Storage",
      'count': 1,
    },
  ];
  int totalProductCounts = 3;

  int bill = -1;
  bool showBillResult = false;
  double energyOffset = 0.5;

  void updateEneryOffset(double value) {
    energyOffset = value;
    update();
  }

  void updateBill(int bill) {
    this.bill = bill;

    if (bill < 600) {
      showBillResult = false;
    }
    update();
  }

  void enableShowBillResult() {
    showBillResult = true;
    update();
  }

  void incrementProductCount(int index) {
    if (products[index]['count'] < 35) {
      products[index]['count'] = products[index]['count'] + 1;
      totalProductCounts++;
      update();
    }
  }

  void decrementProductCount(int index) {
    if (products[index]['count'] > 1) {
      products[index]['count'] = products[index]['count'] - 1;
      totalProductCounts--;
      update();
    }
  }
}
