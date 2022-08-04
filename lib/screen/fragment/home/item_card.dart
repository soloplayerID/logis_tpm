import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String svgSrc;
  final VoidCallback press;

  const ItemCard({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: press,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color(0xffaaaaaa), blurRadius: 20, spreadRadius: -12)
            ],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.13),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  svgSrc,
                  width: MediaQuery.of(context).size.width * 0.18,
                )),
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.withOpacity(0.7)),
            ),
          ],
        ),
      ),
    );
  }
}
