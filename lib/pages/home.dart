import 'package:berl1n_gemini/pages/chat.dart';
import 'package:berl1n_gemini/pages/chat_and_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3F4F4),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width * 0.2),

              Text(
                "Unleash the Power of Gemini AI for a Seamless Chatbot Experience!",
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.bold),
                // textAlign: TextAlign.left,
              ),
              // Spacer(),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(28),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TextOnly()),
                      );
                    },
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.42,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black.withOpacity(0.6), width: 2.0),
                        color: Color(0xFFA1EEBD).withOpacity(0.7),
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
                                ImageIcon(
                                  AssetImage("assets/icons/text2.png"),
                                  size: 28,
                                ),
                                Text(
                                  "Text Only",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                ImageIcon(
                                  AssetImage("assets/icons/right-arrow.png"),
                                  size: 22,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  InkWell(
                    borderRadius: BorderRadius.circular(28),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TextWithImage()),
                      );
                    },
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.42,

                      // width: 180,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black.withOpacity(0.6), width: 2.0),
                        color: Color(0xFF92C7CF).withOpacity(0.3),
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
                                ImageIcon(
                                  AssetImage("assets/icons/image.png"),
                                  size: 30,
                                ),
                                Text(
                                  "Image",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Search by \nImage",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                ImageIcon(
                                  AssetImage("assets/icons/right-arrow.png"),
                                  size: 22,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                "Gemini Ai by Google",
                style: GoogleFonts.poppins(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
