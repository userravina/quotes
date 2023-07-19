import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes/controller/controller_quote.dart';
import 'package:quotes/utils/Database.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  quotesController controller = Get.put(quotesController());

  @override
  void initState() {
    controller.loadDB();
    controller.loadDB2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffedd3d4),
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    Get.toNamed('Add');
                  },
                  child: Icon(
                    Icons.add_box,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            title: Text("Quotes Category",
                style: GoogleFonts.acme(fontSize: 20, letterSpacing: 1)),
            elevation: 0,
          ),
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 30.h,
                    width: 94.w,
                    child: CarouselSlider.builder(
                      itemCount: controller!.imageslider.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          height: 30.h,
                          width: 94.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "${controller!.imageslider[index]}"),
                                  fit: BoxFit.fill)),
                        );
                      },
                      options: CarouselOptions(
                        height: 350.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        onPageChanged: (index, reason) {
                          controller.changeslider(index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 33.h,
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'life');
                      },
                      child: Box('Life', 'assets/images/L.png'),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'love');
                      },
                      child: Box('Love', 'assets/images/L.png'),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'friend');
                      },
                      child: Box('Friendship', 'assets/images/F.png'),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, 'birth');
                    //   },
                    //   child: Box('Birthday', 'assets/images/B.png'),
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, 'funny');
                    //   },
                    //   child: Box('Funny', 'assets/images/F.png'),
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, 'nature');
                    //   },
                    //   child: Box('Nature', 'assets/images/N.png'),
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, 'success');
                    //   },
                    //   child: Box('Success', 'assets/images/S.png'),
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, 'failure');
                    //   },
                    //   child: Box('Failure', 'assets/images/F.png'),
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, 'motive');
                    //   },
                    //   child: Box('Motivativational', 'assets/images/m.png'),
                    // ),
                  ],
                ),
              ),
              Expanded(
                  child: Obx(
                () => ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('quot');
                        },
                        onLongPress: () {
                          DB_helper.db_helper.delete(controller.dataList[index]['id']);
                          controller.loadDB();
                        },
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15), color: Color(0xff7D612B)),
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Color(0xff7D612B), width: 2)),
                                  child: CircleAvatar(
                                    backgroundImage: FileImage(File('${controller.dataList[index]['img']}')),
                                    backgroundColor: Color(0xffedd3d4),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("${controller.dataList[index]['category']}",
                                    style: GoogleFonts.acme(
                                        color: Colors.white, letterSpacing: 1, fontSize: 17)),
                                Expanded(
                                    child: SizedBox(
                                      width: 10,
                                    )),
                                Icon(
                                  Icons.navigate_next,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: controller.dataList.length,
                ),
                  ))
            ],
          )),
    );
  }

  Widget Box(String cate, String image) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Color(0xff7D612B)),
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xff7D612B), width: 2)),
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                  backgroundColor: Color(0xffedd3d4),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text("$cate",
                  style: GoogleFonts.acme(
                      color: Colors.white, letterSpacing: 1, fontSize: 17)),
              Expanded(
                  child: SizedBox(
                width: 10,
              )),
              Icon(
                Icons.navigate_next,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
