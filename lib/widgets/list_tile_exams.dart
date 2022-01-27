import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListExams extends StatelessWidget {

  final String subject;
  final String description;

  const ListExams({
    Key? key,
    required this.subject,
    required this.description,
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
        leading: Icon(Icons.school_rounded, color: Color(0xFF9C68F6), size:28),
        title: Text(
          subject,
          style: GoogleFonts.poppins(
            color: const Color(0xFFFCFCFD),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          description,
          style: GoogleFonts.poppins(
            color: const Color(0xDF92CC7F),
            fontSize: 14.4,
          ),
        ),
      ),
    );
  }
}
