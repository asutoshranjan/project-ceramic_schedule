import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF171825),
        appBar: AppBar(
          title: Text(
            'About',
            style: GoogleFonts.montserrat(
                fontSize: 24,
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFDA699)),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF1C1D2D),
        ),
        body: ListView(
          children: [
            
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 40),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF262A3D),
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: Image.asset('assets/logo.png'),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      'Schedule',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFFFCFCFD),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(bottom: 11),
                    child: Text(
                      'The all in one task manager app designed for class Ceramic-24',
                      style: GoogleFonts.poppins(
                        color: const Color(0xDF92CC7F),
                        fontSize: 14.4,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 40),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF262A3D),
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: Icon(MdiIcons.github, color: Color(0xFF9C68F6), size: 30),
                  title: Text(
                    'Github',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFFCFCFD),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Tap to get the App Source Code',
                    style: GoogleFonts.poppins(
                      color: const Color(0xDF92CC7F),
                      fontSize: 14.4,
                    ),
                  ),
                  onTap: (){
                    launch('https://github.com/asutoshranjan');
                  },
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF262A3D),
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: Icon(MdiIcons.email, color: Color(0xFF9C68F6), size: 30),
                  title: Text(
                    'Email',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFFCFCFD),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Have any suggestions? Tap to Email',
                    style: GoogleFonts.poppins(
                      color: const Color(0xDF92CC7F),
                      fontSize: 14.4,
                    ),
                  ),
                  onTap: (){
                    launch('mailto:asutoshranjan13@gmail.com?');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
