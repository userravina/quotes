import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../main.dart';

class Love extends StatefulWidget {
  const Love({Key? key}) : super(key: key);

  @override
  State<Love> createState() => _LoveState();
}

class _LoveState extends State<Love> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffedd3d4),
        appBar: AppBar(
          title: Text("Love"),
        ),
        body: Stack(
          children: [

            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: love.length,
              itemBuilder: (context, index) => Box(love[index]),
            ),
          ],
        ),
      ),
    );
  }

  Widget Box(String data) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Expanded(
        child: Container(
          height: 100,
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