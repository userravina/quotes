import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../main.dart';

class Life extends StatefulWidget {
  const Life({Key? key}) : super(key: key);

  @override
  State<Life> createState() => _LifeState();
}

class _LifeState extends State<Life> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffedd3d4),
        appBar: AppBar(
          title: Text("Life"),
        ),
        body: Stack(
          children: [
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: life.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Box(life[index]),

                ],

              ),

            ),

          ],
        ),
      ),
    );
  }
  Widget Box(var data) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Expanded(
        child: Container(
          height: 160,
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
                Text(
                  '$data',
                    style: GoogleFonts.acme(color: Colors.white,letterSpacing: 1,fontSize: 17)

                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: (){
                      Share.share(data);
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
  }
}