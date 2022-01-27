import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedule/widgets/list_tile.dart';

class Monday extends StatefulWidget {
  const Monday({Key? key}) : super(key: key);

  @override
  State<Monday> createState() => _MondayState();
}

class _MondayState extends State<Monday> {
  final Stream<QuerySnapshot> _mondayStream = FirebaseFirestore.instance.collection('Monday').orderBy('time', descending: false).snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _mondayStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return List(courseName: data['subject'], timeSlot: data['time']);
          }).toList(),
        );
      },
    );
  }
}
