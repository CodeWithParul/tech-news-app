import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class modifiedText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const modifiedText(
      {Key? key, required this.text, required this.size, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(color: color,fontSize: size),
    );
  }
}

class boldText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const boldText({ Key? key , required this.text, required this.size, required this.color }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(color: color,fontSize: size,fontWeight: FontWeight.bold),
    );
  }
}
