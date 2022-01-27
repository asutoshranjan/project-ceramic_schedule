import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class List extends StatelessWidget {

  final String courseName;
  final String timeSlot;

  const List({
    Key? key,
    required this.courseName,
    required this.timeSlot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF262A3D),
      ),
      child: ListTile(
        leading: Icon(Icons.bookmarks, color: Color(0xFF9C68F6)),
        title: Text(
          courseName,
          style: GoogleFonts.poppins(
            color: const Color(0xFFFCFCFD),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          timeSlot,
          style: GoogleFonts.poppins(
            color: const Color(0xDF92CC7F),
            fontSize: 14.4,
          ),
        ),
      ),
    );
  }
}
