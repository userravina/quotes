import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Failure extends StatefulWidget {
  const Failure({Key? key}) : super(key: key);

  @override
  State<Failure> createState() => _FailureState();
}

class _FailureState extends State<Failure> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffedd3d4),
        appBar: AppBar(
          title: Text("Failure"),
        ),
        body: Stack(
          children: [

            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Box("The secret of life is to fall seven times and to get up eight times."),
                Box("Failure is another stepping stone to greatness."),
                Box("I can accept failure. Everyone fails at something. But I can't accept not trying."),
                Box("Failure is a part of the process. You just learn to pick yourself back up."),
                Box("Our greatest glory is not in never failing, but in rising every time we fail."),
                Box("Those who dare to fail miserably can achieve greatly."),
                Box("There is no innovation and creativity without failure. Period."),
                Box("There are no failures–just experiences and your reactions to them."),
                Box("It's fine to celebrate success but it is more important to heed the lessons of failure."),
                Box("Do not fear mistakes. You will know failure. Continue to reach out."),
              ],
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
                Text(
                  '$data',
                style: GoogleFonts.acme(color: Colors.white,letterSpacing: 1,fontSize: 17)

                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.share,
                    color: Color(0xFFFFFFFF),
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