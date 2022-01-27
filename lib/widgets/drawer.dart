import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0XFF171825),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  Material(   // login call button
                    color: Color(0xFF262A3D),
                    borderRadius: BorderRadius.circular(26),
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      leading: Icon(Icons.recent_actors_rounded, color: Colors.white, size: 30,),
                      title: Text('Activities', style: GoogleFonts.montserrat(color: Colors.white, fontSize: 21),),
                      onTap: () {
                        Navigator.pushNamed(context, '/activities');
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Material(  // admin call button
                      color: Color(0xFF262A3D),
                      borderRadius: BorderRadius.circular(26),
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        leading: Icon(Icons.school_rounded, color: Colors.white, size: 30,),
                        title: Text('Exams', style: GoogleFonts.montserrat(color: Colors.white, fontSize: 21),),
                        onTap: () {
                          Navigator.pushNamed(context, '/exams');
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 24),
                  Divider(color: Color(0xFF262A3D), thickness:3),
                  SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Material(   // Logout call button
                      color: Color(0xFF262A3D),
                      borderRadius: BorderRadius.circular(26),
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        leading: Icon(Icons.info, color: Colors.white, size: 30,),
                        title: Text('About', style: GoogleFonts.montserrat(color: Colors.white, fontSize: 21),),
                        onTap: () {
                          Navigator.pushNamed(context, '/about');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
