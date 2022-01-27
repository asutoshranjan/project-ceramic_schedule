import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule/widgets/list_tile_notice.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  final Stream<QuerySnapshot> _noticesStream = FirebaseFirestore.instance.collection('Notice').orderBy('slno', descending: false).snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF171825),
        appBar: AppBar(
          title: Text(
            'Notice',
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
                return ListNotice(title: data['title'], description: data['description']);
              }).toList(),
            );
          },
        ),
      ),
    );
  }
  }

