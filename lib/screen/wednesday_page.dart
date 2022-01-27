import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedule/widgets/list_tile.dart';

class Wednesday extends StatefulWidget {
  const Wednesday({Key? key}) : super(key: key);

  @override
  State<Wednesday> createState() => _WednesdayState();
}

class _WednesdayState extends State<Wednesday> {
  final Stream<QuerySnapshot> _wednesdayStream = FirebaseFirestore.instance.collection('Wednesday').orderBy('time', descending: false).snapshots();

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: _wednesdayStream,
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