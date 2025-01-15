// import 'package:app2/pages/home/Govt_info.dart';
// import 'package:app2/pages/home/Leaf_Scan.dart';
// import 'package:app2/pages/home/Plant_Shop.dart';
// import 'package:app2/pages/home/chatbot.dart';
// import 'package:app2/services/auth_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gemini/flutter_gemini.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:ui';
// import 'package:url_launcher/url_launcher.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final List<Widget> pages = [
//     const Govt_info(),
//     const Leaf_Scan(),
//     const Plant_Shop(),
//   ];

//   int currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize Gemini
//     Gemini.init(
//       apiKey: "AIzaSyBRNcb_e0MSUfPin7l5I77lUMDA8UFaGUU",
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[currentPage],
//       appBar: AppBar(
//         // centerTitle: true,
//         // title: const Text('Farm Flow'),
//       ),
//       drawer: const NavigationDrawer(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const ChatbotPage()),
//           );
//         },
//         child: const Icon(Icons.chat_rounded),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentPage,
//         onTap: (value) {
//           setState(() {
//             currentPage = value;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.info_outline_rounded),
//             label: "Govt info",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.lens_blur_outlined),
//             label: "Scan leaf",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.store_outlined),
//             label: "Plant Shop",
//           ),
//         ],
//       ),
//     );
//   }
// }



// // Navigation Drawer



// class NavigationDrawer extends StatelessWidget {
//   const NavigationDrawer({super.key});

//   @override
//   Widget build(BuildContext context) => Drawer(
//         backgroundColor: Colors.transparent,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.2),
//             backgroundBlendMode: BlendMode.srcOver,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 blurRadius: 10,
//               ),
//             ],
//           ),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   buildHeader(context),
//                   buildMenuItems(context),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );

//   Widget buildHeader(BuildContext context) => Container(
//         padding: EdgeInsets.only(
//           top: 24 + MediaQuery.of(context).padding.top,
//           bottom: 24,
//         ),
//         child: Column(
//           children: [
//             const CircleAvatar(
//               radius: 52,
//               backgroundImage: NetworkImage(
//                   "https://static.vecteezy.com/system/resources/previews/007/296/447/non_2x/user-icon-in-flat-style-person-icon-client-symbol-vector.jpg"),
//             ),
//             const SizedBox(height: 12),
//             const Text(
//               "users name",
//               style: TextStyle(
//                   fontSize: 28, color: Color.fromARGB(255, 255, 255, 255)),
//             ),
//             Text(
//               FirebaseAuth.instance.currentUser!.email!.toString(),
//               style: GoogleFonts.raleway(
//                   textStyle: const TextStyle(
//                       color: Color.fromARGB(255, 230, 230, 230),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20)),
//             ),
//           ],
//         ),
//       );

//   Widget buildMenuItems(BuildContext context) => Container(
//         padding: const EdgeInsets.all(24),
//         child: Wrap(
//           runSpacing: 16,
//           children: [
//             ListTile(
//               leading: const Icon(Icons.person_outline_outlined,
//                   color: Colors.white),
//               title: const Text(
//                 'Profile',
//                 style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
//               ),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: const Icon(Icons.store, color: Colors.white),
//               title: const Text(
//                 'Become Shop Owner',
//                 style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
//               ),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: const Icon(Icons.info_outline, color: Colors.white),
//               title: const Text(
//                 'About Us',
//                 style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
//               ),
//               onTap: () {},
//             ),
//             ListTile(
//                 leading:
//                     const Icon(Icons.bug_report_rounded, color: Colors.white),
//                 title: const Text(
//                   'Report bug',
//                   style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
//                 ),
//                 onTap: () async {
//                   launchUrl(Uri.parse(
//                       "mailto:farmflow2025@gmail.com?subject=Reporting a BUG in FarmFlow"));
//                 }),
//             ListTile(
//                 leading: const Icon(Icons.email_rounded, color: Colors.white),
//                 title: const Text(
//                   'Contact Us',
//                   style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
//                 ),
//                 onTap: () async {
//                   launchUrl(Uri.parse(
//                       "mailto:farmflow2025@gmail.com?subject=Enquring about FarmFlow"));
//                 }),
//             const Divider(color: Color.fromARGB(255, 212, 212, 212)),
//             ListTile(
//               leading: const Icon(Icons.logout_rounded, color: Colors.white),
//               title: const Text(
//                 'Logout',
//                 style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
//               ),
//               onTap: () async {
//                 await AuthService().signout(context: context);
//               },
//             ),
//           ],
//         ),
//       );
// }

// String? encodeQueryParameters(Map<String, String> params) {
//   return params.entries
//       .map((MapEntry<String, String> e) =>
//           '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
//       .join('&');
// }

import 'package:app2/pages/home/Govt_info.dart';
import 'package:app2/pages/home/Leaf_Scan.dart';
import 'package:app2/pages/home/Plant_Shop.dart';
import 'package:app2/pages/home/chatbot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> pages = [
    const  Govt_info(),
    const Leaf_Scan(),
    const Plant_Shop(),
  ];

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    Gemini.init(
      apiKey: "AIzaSyBRNcb_e0MSUfPin7l5I77lUMDA8UFaGUU",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatbotPage()),
          );
        },
        child: const Icon(Icons.chat_rounded),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline_rounded),
            label: "Govt info",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lens_blur_outlined),
            label: "Scan leaf",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_outlined),
            label: "Plant Shop",
          ),
        ],
      ),
    );
  }
}