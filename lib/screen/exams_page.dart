import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule/widgets/list_tile_exams.dart';

class ExamsPage extends StatefulWidget {
  const ExamsPage({Key? key}) : super(key: key);

  @override
  State<ExamsPage> createState() => _ExamsPageState();
}

class _ExamsPageState extends State<ExamsPage> {
  final Stream<QuerySnapshot> _noticesStream = FirebaseFirestore.instance.collection('Exams').orderBy('slno', descending: false).snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF171825),
        appBar: AppBar(
          title: Text(
            'Exams',
            style: GoogleFonts.montserrat(
                fontSize: 24,
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFDA699)),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF1C1D2D),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _noticesStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return ListExams(subject: data['subject'], description: data['description']);
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

