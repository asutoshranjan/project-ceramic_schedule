import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule/screen/friday_page.dart';
import 'package:schedule/screen/monday_page.dart';
import 'package:schedule/screen/thursday_page.dart';
import 'package:schedule/screen/tuesday_page.dart';
import 'package:schedule/screen/wednesday_page.dart';
import 'package:schedule/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: const Color(0xFF171825),
          appBar: AppBar(
            title: Text(
              'Class Schedule',
              style: GoogleFonts.montserrat(
                  fontSize: 24,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFDA699)),
            ),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.circle_notifications,
                  color: Color(0xFF9D68F6),
                  size: 32,
                ),
                tooltip: 'Notifications',
                onPressed: () {
                  Navigator.pushNamed(context, '/notice');
                },
              ),
            ],
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Monday'),
                Tab(text: 'Tuesday'),
                Tab(text: 'Wednesday'),
                Tab(text: 'Thursday'),
                Tab(text: 'Friday'),
              ],
            ),
            backgroundColor: const Color(0xFF1C1D2D),
          ),

          drawer: AppDrawer(),

          body: const TabBarView(children: [
            Monday(),
            Tuesday(),
            Wednesday(),
            Thursday(),
            Friday(),
          ]),
        ),
      ),
    );
  }
}
