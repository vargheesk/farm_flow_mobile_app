import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app2/services/auth_service.dart';

class Plant_Shop extends StatefulWidget {
  const Plant_Shop({super.key});

  @override
  State<Plant_Shop> createState() => _Plant_ShopState();
}

class _Plant_ShopState extends State<Plant_Shop> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> filteredShops = [];

  // Sample data for plant shops
  final List<Map<String, String>> allShops = [
    {
      'name': 'Green Thumb Nursery',
      'address': '123 Main Street',
      'imageUrl':
          'https://content.jdmagicbox.com/comp/ernakulam/a6/0484px484.x484.150724120846.f7a6/catalogue/sahyadri-gardens-edapally-north-ernakulam-nursery-plants-manufacturers-12bk9sk-250.jpg',
    },
    {
      'name': 'Garden Center Plus',
      'address': '456 Oak Avenue',
      'imageUrl':
          'https://media.istockphoto.com/id/470649314/photo/nursery-filled-with-various-colorful-flowers.jpg?s=612x612&w=0&k=20&c=I-dS3DihpAYdtT-0jkm9HuHJMMBVhh3xSfCFRqIK8UQ=',
    },
    {
      'name': 'Plant Paradise',
      'address': '789 Pine Road',
      'imageUrl':
          'https://gumlet.assettype.com/down-to-earth%2Fimport%2Flibrary%2Flarge%2F2024-05-13%2F0.30992200_1715602499_photo-3.jpg',
    },
    {
      'name': 'Flora & Fauna',
      'address': '321 Maple Lane',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/5/5f/Cutchogue_-_Oregon_Road_-_Plant_Nursery.jpg',
    },
    {
      'name': 'The Plant House',
      'address': '654 Cedar Street',
      'imageUrl':
          'https://images.squarespace-cdn.com/content/v1/61d891d5796acd7ec864ab8d/2b3c8217-73b5-4ecb-9e77-2d59c9fc9d2e/Green+house.jpg',
    },
    {
      'name': 'Urban Jungle',
      'address': '987 Birch Boulevard',
      'imageUrl':
          'https://images.squarespace-cdn.com/content/v1/649c98f87fb15e3b0ed1adeb/483bd7b7-5e5a-42ee-820d-3be1ded35001/IMG_7965.jpg',
    },
    {
      'name': 'Blossom Garden',
      'address': '159 Willow Drive',
      'imageUrl':
          'https://www.startupdonut.co.uk/sites/default/files/plantnursery1_1.jpg',
    },
    {
      'name': 'Evergreen Nursery',
      'address': '753 Spruce Street',
      'imageUrl':
          'https://i0.wp.com/gardensnursery.com/wp-content/uploads/2020/03/Whats-a-Tree-Plant-in-Grower-Nursery.jpg',
    },
    {
      'name': 'Nature’s Nook',
      'address': '246 Elm Road',
      'imageUrl':
          'https://www.sanparks.org/wp-content/uploads/2021/03/DSC_9353-1000x667.jpg',
    },
    {
      'name': 'Leaf & Bloom',
      'address': '135 Palm Avenue',
      'imageUrl':
          'https://metrogarden.in/storage/images/testimonials/20211022112918_jos_imageph.jpg',
    },
    {
      'name': 'Root & Shoot',
      'address': '864 Aspen Boulevard',
      'imageUrl':
          'https://indiagardening.b-cdn.net/wp-content/uploads/2019/11/bestplantnurseryinpune7.jpg',
    },
    {
      'name': 'Botanic Bliss',
      'address': '975 Magnolia Street',
      'imageUrl':
          'https://thumbs.dreamstime.com/b/young-tree-nursery-waiting-plant-black-plastic-bag-59723457.jpg',
    },
    {
      'name': 'Green Haven',
      'address': '312 Cypress Road',
      'imageUrl':
          'https://media.istockphoto.com/id/1333717916/photo/view-in-the-rows-of-a-tree-nursery-with-numerous-fruit-trees-and-shrubs.jpg?s=612x612&w=0&k=20&c=krCXOxxuoGCh_ef0Mw_VAKdNtocVOZInKtYXMdBFS9Y=',
    },
    {
      'name': 'Petal & Stem',
      'address': '678 Olive Lane',
      'imageUrl':
          'https://5.imimg.com/data5/SELLER/Default/2024/1/380268275/WA/PM/YJ/24203098/nursery-plant.jpeg',
    },
    {
      'name': 'The Bloom Room',
      'address': '543 Poplar Street',
      'imageUrl':
          'https://i0.wp.com/ameft.com/wp-content/uploads/2024/03/Greenhouse_Acclimatization.jpg?fit=1024%2C768&ssl=1',
    },
    {
      'name': 'Nature’s Palette',
      'address': '210 Redwood Drive',
      'imageUrl':
          'https://halsco.com.sa/wp-content/uploads/2022/09/Home-Nursery-2.jpg',
    },
    {
      'name': 'Sunshine Nursery',
      'address': '876 Hickory Avenue',
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1679429383405-de11c569e905?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bnVyc2VyeSUyMHBsYW50fGVufDB8fDB8fHww',
    },
    {
      'name': 'Verdant Vibes',
      'address': '369 Fir Street',
      'imageUrl':
          'https://gangajalnursery.com/assets/images/home/about-image.jpg',
    },
    {
      'name': 'Leafy Lane',
      'address': '741 Chestnut Road',
      'imageUrl':
          'https://landscaping-dubai.com/en/wp-content/uploads/2020/02/Selecting-Nursery-Plants.jpg',
    },
    {
      'name': 'Bloom & Grow',
      'address': '528 Walnut Drive',
      'imageUrl':
          'https://content.jdmagicbox.com/comp/thiruvananthapuram/k9/0471px471.x471.220319215828.y2k9/catalogue/vellayani-college-sales-counter-vellayani-thiruvananthapuram-plant-nurseries-tmt6dhihwl-250.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    filteredShops = allShops;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String searchTerm = _searchController.text.toLowerCase();
    setState(() {
      filteredShops = allShops.where((shop) {
        return shop['name']!.toLowerCase().contains(searchTerm) ||
            shop['address']!.toLowerCase().contains(searchTerm);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Container(
        color: const Color.fromARGB(255, 140, 218, 145),
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
                        'Plant Shops',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 26, 103, 30),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search shops by name or address',
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  _searchController.clear();
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
            // Grid of Shop Cards
            Expanded(
              child: filteredShops.isEmpty
                  ? const Center(
                      child: Text(
                        'No shops found',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: filteredShops.length,
                      itemBuilder: (context, index) {
                        final shop = filteredShops[index];
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Image.network(
                                  shop['imageUrl']!,
                                  height: 140,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 140,
                                      color: Colors.grey[200],
                                      child: const Icon(Icons.error),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      shop['name']!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      shop['address']!,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
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

// NavigationDrawer implementation remains the same
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
                await AuthService().signout(context: context);
              },
            ),
          ],
        ),
      );
}
