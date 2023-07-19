import 'dart:typed_data';

import 'package:get/get.dart';

import '../utils/Database.dart';

class quotesController extends GetxController{

 // SliderIndex
  List imageslider = [
    "assets/images/slider1.png",
    "assets/images/slider2.jpg",
    "assets/images/SLider3.jpg",
    "assets/images/slider4.jpg"
  ];

  int sliderindex = 0;

  void changeslider(int index)
  {
    sliderindex = index;
    update();
  }

  // Database

  RxString imgPath = "".obs;
  Uint8List? byte;
  RxList dataList = [].obs;

  Future<void> loadDB() async {
    dataList.value = await DB_helper.db_helper.readDBcate();
  }
  RxList quotlist =[].obs;
  Future<void> loadDB2()
  async {
    quotlist.value = await DB_helper.db_helper.readDB();
  }
}