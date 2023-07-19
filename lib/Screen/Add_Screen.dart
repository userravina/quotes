import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quotes/model/model.dart';
import 'package:sizer/sizer.dart';

import '../controller/controller_quote.dart';
import '../utils/Database.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  @override
  Widget build(BuildContext context) {
    quotesController controller = Get.put(quotesController());
    TextEditingController txtcate = TextEditingController();

    TextEditingController txtcategory = TextEditingController();
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xffedd3d4),
          appBar: AppBar(
            title: Text("Add Quots",
                style: GoogleFonts.acme(fontSize: 20, letterSpacing: 1)),
            elevation: 0,
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "Category",
                    style: GoogleFonts.acme(
                        fontSize: 15, letterSpacing: 1, color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Quots",
                    style: GoogleFonts.acme(
                        fontSize: 15, letterSpacing: 1, color: Colors.white),
                  ),
                ),
              ],
              indicatorColor: Colors.white,
            ),
          ),
          body: TabBarView(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 120,
                      top: 40,
                    ),
                    child: Obx(
                      () => CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.brown.shade300,
                        backgroundImage: FileImage(
                          File(controller.imgPath.value),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 120, left: 195),
                      child: InkWell(
                          onTap: () async {
                            ImagePicker picker = ImagePicker();
                            XFile? xfill = await picker.pickImage(
                                source: ImageSource.gallery, imageQuality: 30);
                            controller.imgPath.value = xfill!.path;
                            controller.byte = await xfill.readAsBytes();
                          },
                          child: CircleAvatar(child: Icon(Icons.edit)))),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 200, right: 10),
                    child: TextField(
                      controller: txtcate,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelStyle: TextStyle(color: Colors.brown),
                        labelText: "Enter Category...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xff7D612B),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xff7D612B),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xff7D612B),
                          ),
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 300,
                      left: 150,
                    ),
                    child: InkWell(
                      onTap: () async {
                        String? cate = txtcate.text;
                        String? path = controller.imgPath.value;
                        CategoryModel model = CategoryModel(
                          cate: cate,
                          img: controller.imgPath.value
                        );
                        await DB_helper.db_helper.insertInDBcate(model);
                        controller.loadDB();
                        Get.back();
                      },
                      child: Container(
                        height: 5.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.brown.shade500,
                        ),
                        child: Center(child: Text("Add",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      style: TextStyle(color: Color(0xff7D612B)),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.brown),
                        alignLabelWithHint: true,
                        labelText: "Enter Category...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xff7D612B),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xff7D612B),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xff7D612B),
                          ),
                        ),
                      ),
                      maxLines: 4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,

                    ),
                    child: InkWell(
                      onTap: () async {
                        String? category = txtcate.text;
                        quotModel model = quotModel(
                          quot: category,
                        );
                        await DB_helper.db_helper.insertInDBquot(model);
                        controller.loadDB2();
                        Get.back();
                      },
                      child: Container(
                        height: 5.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.brown.shade500,
                        ),
                        child: Center(child: Text("Add",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
