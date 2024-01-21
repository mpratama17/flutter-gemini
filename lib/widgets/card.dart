import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CustomCard() {
  return Container(
    height: 200,
    width: 185,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black.withOpacity(0.7), width: 2.0),
      color: Color(0xFFA1EEBD),
      borderRadius: BorderRadius.all(
        Radius.circular(28),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.text_decrease_rounded),
              Text(
                "Text Only",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ask \nAnything",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Icon(Icons.arrow_right)
            ],
          )
        ],
      ),
    ),
  );
}
