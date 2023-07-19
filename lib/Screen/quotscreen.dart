import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../controller/controller_quote.dart';

class quotscreen extends StatefulWidget {
  const quotscreen({super.key});

  @override
  State<quotscreen> createState() => _quotscreenState();
}

class _quotscreenState extends State<quotscreen> {
  quotesController controller = Get.put(quotesController());

  @override
  void initState() {
    controller.loadDB2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffedd3d4),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Expanded(
                      child: Container(
                        height: 107,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff7D612B),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${controller.quotlist[index]['quot']}',
                                  style: GoogleFonts.acme(
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      fontSize: 17)),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {
                                    Share.share(
                                        '${controller.quotlist[index]['quot']}');
                                  },
                                  child: Icon(
                                    Icons.share,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: controller.quotlist.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
