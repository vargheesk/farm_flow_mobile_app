// import 'package:app2/services/auth_service.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Govt_info extends StatelessWidget {
//   const Govt_info({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Sample data for info items
//     final List<Map<String, String>> infoItems = [
//       {
//     'title': 'Subsidy for Agriculture Machinery',
//     'summary': 'Government offers subsidies on modern farming equipment to improve agricultural productivity.',
//     'date': '15 Jan 2025',
//     'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'Interest-Free Loan for Farmers',
//   'summary': 'Farmers can now avail interest-free loans to support crop cultivation and farm development.',
//   'date': '12 Jan 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'Best Fertilizer for Coconut Trees',
//   'summary': 'Discover the most effective fertilizers to boost the growth and yield of coconut trees.',
//   'date': '10 Jan 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'New Hybrid Banana Tree Launched',
//   'summary': 'Introducing a high-yield hybrid banana variety designed for faster growth and disease resistance.',
//   'date': '08 Jan 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'Limited Stock: Vegetable Seeds',
//   'summary': 'Get high-quality vegetable seeds at discounted rates. Hurry, stock is running out!',
//   'date': '05 Jan 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'New Pesticide for Coconut Pest Control',
//   'summary': 'Effective pest control solutions for coconut trees are now available to prevent common diseases.',
//   'date': '18 Jan 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'Organic Farming Training Programs',
//   'summary': 'Join hands-on organic farming workshops to learn sustainable agriculture techniques.',
//   'date': '20 Jan 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'Advanced Drip Irrigation Systems',
//   'summary': 'Upgrade your irrigation system with the latest drip technology to save water and boost yield.',
//   'date': '22 Jan 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'Disease-Resistant Tomato Seeds',
//   'summary': 'New tomato seed variety offers resistance to common plant diseases for better harvests.',
//   'date': '25 Jan 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'Government Grant for Organic Farming',
//   'summary': 'Avail government grants for transitioning to organic farming practices.',
//   'date': '28 Jan 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'Crop Insurance Scheme Updates',
//   'summary': 'Latest updates on crop insurance policies to protect farmers from losses.',
//   'date': '30 Jan 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'Neem-Based Organic Pesticides',
//   'summary': 'Eco-friendly neem-based pesticides are now available for safe pest control.',
//   'date': '02 Feb 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'High-Quality Hybrid Rice Seeds',
//   'summary': 'Boost rice production with high-yield, drought-resistant hybrid rice seeds.',
//   'date': '05 Feb 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'Soil Testing Centers Opened',
//   'summary': 'New government soil testing labs help farmers choose the right fertilizers.',
//   'date': '07 Feb 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'Farmers Market for Organic Produce',
//   'summary': 'Sell your organic produce directly to consumers at local farmers markets.',
//   'date': '10 Feb 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'Solar Pumps for Irrigation Subsidy',
//   'summary': 'Government subsidy available for solar-powered irrigation pumps.',
//   'date': '12 Feb 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'New Pest-Resistant Cotton Variety',
//   'summary': 'Introducing pest-resistant cotton seeds for higher yield and fewer losses.',
//   'date': '14 Feb 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
// {
//   'title': 'Weather Alert System for Farmers',
//   'summary': 'Real-time weather alerts to help farmers plan agricultural activities.',
//   'date': '16 Feb 2025',
//   'imageUrl': 'https://via.placeholder.com/80',
// },
//     ];

//     return Scaffold(
//       drawer: NavigationDrawer(),
//       body: Container(
//         color: const Color.fromARGB(255, 195, 245, 197),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Builder(
//                         builder: (context) => IconButton(
//                           icon: const Icon(Icons.menu),
//                           onPressed: () {
//                             Scaffold.of(context).openDrawer();
//                           },
//                         ),
//                       ),
//                       const Text(
//                         'Govt info',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromARGB(255, 26, 103, 30),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   // Search Bar
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.8),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Search',
//                         prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide.none,
//                         ),
//                         filled: true,
//                         fillColor: Colors.transparent,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // List of Info Items
//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.all(16),
//                 itemCount: infoItems.length,
//                 itemBuilder: (context, index) {
//                   final item = infoItems[index];
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 16),
//                     child: Card(
//                       elevation: 2,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(12),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.network(
//                                 item['imageUrl']!,
//                                 width: 80,
//                                 height: 80,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return Container(
//                                     width: 80,
//                                     height: 80,
//                                     color: Colors.grey[200],
//                                     child: const Icon(Icons.error),
//                                   );
//                                 },
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Expanded(
//                                         child: Text(
//                                           item['title']!,
//                                           style: const TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                       Text("last date: "+
//                                         item['date']!,
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                           color: Colors.grey[600],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     item['summary']!,
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.grey[600],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NavigationDrawer extends StatelessWidget {
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
//                 // Add your sign out logic here
//                 await AuthService().signout(context: context);
//               },
//             ),
//           ],
//         ),
//       );
// }

import 'package:app2/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Govt_info extends StatefulWidget {
  const Govt_info({super.key});

  @override
  State<Govt_info> createState() => _Govt_infoState();
}

class _Govt_infoState extends State<Govt_info> {
  String searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  // Sample data for info items
  final List<Map<String, String>> allInfoItems = [
    {
      'title': 'Subsidy for Agriculture Machinery',
      'summary':
          'Government offers subsidies on modern farming equipment to improve agricultural productivity.',
      'date': '15 Jan 2025',
      'imageUrl': 'https://agrimachinery.nic.in/Images/SliderImages/8.jpg',
    },
    {
      'title': 'Interest-Free Loan for Farmers',
      'summary':
          'Farmers can now avail interest-free loans to support crop cultivation and farm development.',
      'date': '12 Jan 2025',
      'imageUrl':
          'https://nafa.co.in/info/wp-content/uploads/2022/04/Effective-tips-while-applying-for-agricultural-loans.jpg',
    },
    {
      'title': 'Best Fertilizer for Coconut Trees',
      'summary':
          'Discover the most effective fertilizers to boost the growth and yield of coconut trees.',
      'date': '10 Jan 2025',
      'imageUrl':
          'https://fertilizer-machine.net/wp-content/uploads/2018/06/types-of-fertilizer.jpg',
    },
    {
      'title': 'New Hybrid Banana Tree Launched',
      'summary':
          'Introducing a high-yield hybrid banana variety designed for faster growth and disease resistance.',
      'date': '08 Jan 2025',
      'imageUrl':
          'https://m.media-amazon.com/images/I/61I21YlyhjL._AC_UF1000,1000_QL80_.jpg',
    },
    {
      'title': 'Limited Stock: Vegetable Seeds',
      'summary':
          'Get high-quality vegetable seeds at discounted rates. Hurry, stock is running out!',
      'date': '05 Jan 2025',
      'imageUrl':
          'https://m.media-amazon.com/images/S/aplus-media-library-service-media/a4a8ed79-ab31-4853-9949-5f8489175176.__CR0,0,970,600_PT0_SX970_V1___.jpg',
    },
    {
      'title': 'New Pesticide for Coconut Pest Control',
      'summary':
          'Effective pest control solutions for coconut trees are now available to prevent common diseases.',
      'date': '18 Jan 2025',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmKWNpr3RCmsYR2590Y1fhYcN2LqGquX-nxA&s',
    },
    {
      'title': 'Organic Farming Training Programs',
      'summary':
          'Join hands-on organic farming workshops to learn sustainable agriculture techniques.',
      'date': '20 Jan 2025',
      'imageUrl':
          'https://www.lingayasvidyapeeth.edu.in/sanmax/wp-content/uploads/2024/04/Organic-Farming.png',
    },
    {
      'title': 'Advanced Drip Irrigation Systems',
      'summary':
          'Upgrade your irrigation system with the latest drip technology to save water and boost yield.',
      'date': '22 Jan 2025',
      'imageUrl':
          'https://cdn11.bigcommerce.com/s-tjrce8etun/images/stencil/original/uploaded_images/drip-irrigation-with-moisture-sensor.jpg?t=1706903189',
    },
    {
      'title': 'Disease-Resistant Tomato Seeds',
      'summary':
          'New tomato seed variety offers resistance to common plant diseases for better harvests.',
      'date': '25 Jan 2025',
      'imageUrl':
          'https://image.made-in-china.com/202f0j00DNRivhYnAtqd/Indeterminate-Good-Disease-Resistance-Tomato-Seeds-for-Planting.webp',
    },
    {
      'title': 'Government Grant for Organic Farming',
      'summary':
          'Avail government grants for transitioning to organic farming practices.',
      'date': '28 Jan 2025',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1aAeLUKsKcKmK25_pw86CmPzPtAHEDRM2SQ&s',
    },
    {
      'title': 'Crop Insurance Scheme Updates',
      'summary':
          'Latest updates on crop insurance policies to protect farmers from losses.',
      'date': '30 Jan 2025',
      'imageUrl':
          'https://assets.thehansindia.com/h-upload/2025/01/02/1511462-crop-insurance.webp',
    },
    {
      'title': 'Neem-Based Organic Pesticides',
      'summary':
          'Eco-friendly neem-based pesticides are now available for safe pest control.',
      'date': '02 Feb 2025',
      'imageUrl':
          'https://iffcourbangardens.com/cdn/shop/files/DrNeemOil.jpg?v=1701408280',
    },
    {
      'title': 'High-Quality Hybrid Rice Seeds',
      'summary':
          'Boost rice production with high-yield, drought-resistant hybrid rice seeds.',
      'date': '05 Feb 2025',
      'imageUrl':
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/plant-seed/a/6/r/1-pp-1-hybrid-original-imagsqt2ft3zhaga.jpeg?q=90&crop=false',
    },
    {
      'title': 'Soil Testing Centers Reopened',
      'summary':
          'New government soil testing labs help farmers choose the right fertilizers.',
      'date': '07 Feb 2025',
      'imageUrl':
          'https://content.jdmagicbox.com/comp/def_content/soil-testing-services/weiam2hpxu-soil-testing-services-9-k7fzi.jpg',
    },
    {
      'title': 'Farmers Market for Organic Produce',
      'summary':
          'Sell your organic produce directly to consumers at local farmers markets.',
      'date': '10 Feb 2025',
      'imageUrl':
          'https://img-cdn.thepublive.com/fit-in/1200x675/filters:format(webp)/30-stades/media/media_files/hCIfOsmxqE5Soh5w3MWb.jpg',
    },
    {
      'title': 'Solar Pumps for Irrigation Subsidy',
      'summary':
          'Government subsidy available for solar-powered irrigation pumps.',
      'date': '12 Feb 2025',
      'imageUrl':
          'https://kenbrooksolar.com/wp-content/uploads/Solar-Pump-Yojana-2021.jpg',
    },
    {
      'title': 'New Pest-Resistant Cotton Variety',
      'summary':
          'Introducing pest-resistant cotton seeds for higher yield and fewer losses.',
      'date': '14 Feb 2025',
      'imageUrl':
          'https://blog.agriapp.com/wp-content/uploads/2024/05/Gardenology.org-IMG_2026_hunt09oct-1-1024x768.webp',
    },
  ];

  List<Map<String, String>> get filteredItems {
    if (searchQuery.isEmpty) {
      return allInfoItems;
    }
    return allInfoItems.where((item) {
      final title = item['title']?.toLowerCase() ?? '';
      final summary = item['summary']?.toLowerCase() ?? '';
      final searchLower = searchQuery.toLowerCase();
      return title.contains(searchLower) || summary.contains(searchLower);
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Container(
        color: const Color.fromARGB(255, 195, 245, 197),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        ),
                      ),
                      const Text(
                        'Govt info',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 26, 103, 30),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Search Bar with real-time filtering
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search by Heading or Summary',
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        suffixIcon: searchQuery.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    searchQuery = '';
                                    _searchController.clear();
                                  });
                                },
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // List of Filtered Info Items
            Expanded(
              child: filteredItems.isEmpty
                  ? Center(
                      child: Text(
                        "No results found for '$searchQuery'",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      item['imageUrl']!,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          width: 80,
                                          height: 80,
                                          color: Colors.grey[200],
                                          child: const Icon(Icons.error),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                item['title']!,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "last date: " + item['date']!,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          item['summary']!,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            backgroundBlendMode: BlendMode.srcOver,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
              ),
            ],
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  buildHeader(context),
                  buildMenuItems(context),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 52,
              backgroundImage: NetworkImage(
                  "https://static.vecteezy.com/system/resources/previews/007/296/447/non_2x/user-icon-in-flat-style-person-icon-client-symbol-vector.jpg"),
            ),
            const SizedBox(height: 12),
            const Text(
              "users name",
              style: TextStyle(
                  fontSize: 28, color: Color.fromARGB(255, 255, 255, 255)),
            ),
            Text(
              FirebaseAuth.instance.currentUser!.email!.toString(),
              style: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 230, 230, 230),
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.person_outline_outlined,
                  color: Colors.white),
              title: const Text(
                'Profile',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.store, color: Colors.white),
              title: const Text(
                'Become Shop Owner',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.white),
              title: const Text(
                'About Us',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              onTap: () {},
            ),
            ListTile(
                leading:
                    const Icon(Icons.bug_report_rounded, color: Colors.white),
                title: const Text(
                  'Report bug',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                onTap: () async {
                  launchUrl(Uri.parse(
                      "mailto:farmflow2025@gmail.com?subject=Reporting a BUG in FarmFlow"));
                }),
            ListTile(
                leading: const Icon(Icons.email_rounded, color: Colors.white),
                title: const Text(
                  'Contact Us',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                onTap: () async {
                  launchUrl(Uri.parse(
                      "mailto:farmflow2025@gmail.com?subject=Enquring about FarmFlow"));
                }),
            const Divider(color: Color.fromARGB(255, 212, 212, 212)),
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: Colors.white),
              title: const Text(
                'Logout',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              onTap: () async {
                // Add your sign out logic here
                await AuthService().signout(context: context);
              },
            ),
          ],
        ),
      );
}
