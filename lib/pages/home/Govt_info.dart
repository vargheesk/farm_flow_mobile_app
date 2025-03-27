// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:app2/pages/home/AnnouncementDetailPage.dart';

// class Govt_info extends StatefulWidget {
//   const Govt_info({super.key});

//   @override
//   State<Govt_info> createState() => _Govt_infoState();
// }

// class _Govt_infoState extends State<Govt_info> {
//   String searchQuery = '';
//   final TextEditingController _searchController = TextEditingController();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   Map<String, dynamic>? userData;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }

//   Future<void> _loadUserData() async {
//     final user = _auth.currentUser;
//     if (user != null) {
//       final doc = await _firestore.collection('Users').doc(user.uid).get();
//       setState(() {
//         userData = doc.data();
//       });
//     }
//   }

//   Stream<List<Map<String, dynamic>>> getAnnouncements() {
//     if (userData == null) return Stream.value([]);

//     return _firestore
//         .collectionGroup('Announcement')
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs
//           .map((doc) => {...doc.data() as Map<String, dynamic>, 'id': doc.id})
//           .where((announcement) =>
//               announcement['state'] == userData?['state'] &&
//               announcement['district'] == userData?['district'] &&
//               announcement['block'] == userData?['block'] &&
//               announcement['office'] == userData?['office'])
//           .toList()
//         ..sort((a, b) => (b['createdAt'] as Timestamp)
//             .compareTo(a['createdAt'] as Timestamp));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: const Color.fromARGB(255, 195, 245, 197),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Govt info',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 26, 103, 30),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.8),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: TextField(
//                       controller: _searchController,
//                       onChanged: (value) => setState(() => searchQuery = value),
//                       decoration: InputDecoration(
//                         hintText: 'Search announcements',
//                         prefixIcon:
//                             const Icon(Icons.search, color: Colors.grey),
//                         suffixIcon: searchQuery.isNotEmpty
//                             ? IconButton(
//                                 icon: const Icon(Icons.clear),
//                                 onPressed: () => setState(() {
//                                   searchQuery = '';
//                                   _searchController.clear();
//                                 }),
//                               )
//                             : null,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: StreamBuilder<List<Map<String, dynamic>>>(
//                 stream: getAnnouncements(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   }

//                   if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   }

//                   final announcements = snapshot.data ?? [];
//                   final filteredAnnouncements = announcements.where((item) {
//                     final title = item['heading']?.toLowerCase() ?? '';
//                     final summary = item['summary']?.toLowerCase() ?? '';
//                     final searchLower = searchQuery.toLowerCase();
//                     return title.contains(searchLower) ||
//                         summary.contains(searchLower);
//                   }).toList();

//                   if (filteredAnnouncements.isEmpty) {
//                     return Center(
//                       child: Text(
//                         searchQuery.isEmpty
//                             ? "No announcements available"
//                             : "No results found for '$searchQuery'",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     );
//                   }

//                   return ListView.builder(
//                     padding: const EdgeInsets.all(16),
//                     itemCount: filteredAnnouncements.length,
//                     itemBuilder: (context, index) {
//                       final item = filteredAnnouncements[index];
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   AnnouncementDetail(announcement: item),
//                             ),
//                           );
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.only(bottom: 16),
//                           child: Card(
//                             elevation: 2,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(12),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Created: ${item['createdAt']?.toDate().toString().split(' ')[0] ?? 'N/A'}',
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.grey[600],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       ClipRRect(
//                                         borderRadius: BorderRadius.circular(8),
//                                         child: Image.network(
//                                           item['imageLink'] ?? '',
//                                           width: 80,
//                                           height: 80,
//                                           fit: BoxFit.cover,
//                                           errorBuilder:
//                                               (context, error, stackTrace) {
//                                             return Container(
//                                               width: 80,
//                                               height: 80,
//                                               color: Colors.grey[200],
//                                               child: const Icon(Icons.error),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                       const SizedBox(width: 12),
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               item['heading'] ?? '',
//                                               style: const TextStyle(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             const SizedBox(height: 4),
//                                             Text(
//                                               item['summary'] ?? '',
//                                               style: TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.grey[600],
//                                               ),
//                                             ),
//                                             const SizedBox(height: 8),
//                                             if (item['lastDate'] != null)
//                                               Text(
//                                                 'Last Date: ${DateTime.parse(item['lastDate']).toString().split(' ')[0]}',
//                                                 style: TextStyle(
//                                                   fontSize: 12,
//                                                   color: Colors.grey[600],
//                                                 ),
//                                               ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
// }
//
//
//
//
//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Govt_info extends StatefulWidget {
  const Govt_info({super.key});

  @override
  State<Govt_info> createState() => _Govt_infoState();
}

class _Govt_infoState extends State<Govt_info> {
  String searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = _auth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection('Users').doc(user.uid).get();
      setState(() {
        userData = doc.data();
      });
    }
  }

  Stream<List<Map<String, dynamic>>> getAnnouncements() {
    if (userData == null) return Stream.value([]);

    return _firestore
        .collectionGroup('Announcement')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => {...doc.data() as Map<String, dynamic>, 'id': doc.id})
          .where((announcement) =>
              announcement['state'] == userData?['state'] &&
              announcement['district'] == userData?['district'] &&
              announcement['block'] == userData?['block'] &&
              announcement['office'] == userData?['office'])
          .toList()
        ..sort((a, b) => (b['createdAt'] as Timestamp)
            .compareTo(a['createdAt'] as Timestamp));
    });
  }

  Future<void> _launchURL(String url) async {
    if (url.isEmpty) return;
    final Uri uri = Uri.parse(url.startsWith('http') ? url : 'https://$url');
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Could not launch $url: $e');
    }
  }

  Future<void> _launchPhone(String phoneNumber) async {
    if (phoneNumber.isEmpty) return;
    final Uri uri = Uri.parse('tel:$phoneNumber');
    try {
      await launchUrl(uri);
    } catch (e) {
      debugPrint('Could not launch $phoneNumber: $e');
    }
  }

  String _formatDate(dynamic dateData) {
    try {
      DateTime date;
      if (dateData is Timestamp) {
        date = dateData.toDate();
      } else if (dateData is String) {
        date = DateTime.parse(dateData);
      } else {
        return '';
      }
      return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    } catch (e) {
      return '';
    }
  }

  Widget _buildInfoRow(IconData icon, String label, String value,
      {bool isLink = false}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: isLink ? Colors.blue : Colors.grey[600],
              decoration: isLink ? TextDecoration.underline : null,
            ),
          ),
        ),
      ],
    );
  }

  void _showAnnouncementDialog(Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Fixed Title Row
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item['heading'] ?? '',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2, // Allow 2 lines
                        overflow:
                            TextOverflow.ellipsis, // Add ellipsis if overflow
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item['imageLink'] ?? '',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: Colors.grey[200],
                        child: const Center(child: Icon(Icons.error)),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  item['summary'] ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item['description'] ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () => _launchPhone(item['helplineNumber'] ?? ''),
                  child: _buildInfoRow(
                    Icons.phone,
                    'Helpline:',
                    item['helplineNumber'] ?? '',
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () => _launchURL(item['link'] ?? ''),
                  child: _buildInfoRow(
                    Icons.link,
                    'Link:',
                    item['link'] ?? '',
                    isLink: true,
                  ),
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  Icons.calendar_today,
                  'Last Date:',
                  _formatDate(item['lastDate'] ?? ''),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Created: ${_formatDate(item['createdAt'] ?? '')}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 195, 245, 197),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Govt info',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 26, 103, 30),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) => setState(() => searchQuery = value),
                      decoration: InputDecoration(
                        hintText: 'Search announcements',
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        suffixIcon: searchQuery.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () => setState(() {
                                  searchQuery = '';
                                  _searchController.clear();
                                }),
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<List<Map<String, dynamic>>>(
                stream: getAnnouncements(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  final announcements = snapshot.data ?? [];
                  final filteredAnnouncements = announcements.where((item) {
                    final title = item['heading']?.toLowerCase() ?? '';
                    final summary = item['summary']?.toLowerCase() ?? '';
                    final searchLower = searchQuery.toLowerCase();
                    return title.contains(searchLower) ||
                        summary.contains(searchLower);
                  }).toList();

                  if (filteredAnnouncements.isEmpty) {
                    return Center(
                      child: Text(
                        searchQuery.isEmpty
                            ? "No announcements available"
                            : "No results found for '$searchQuery'",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredAnnouncements.length,
                    itemBuilder: (context, index) {
                      final item = filteredAnnouncements[index];
                      return GestureDetector(
                        onTap: () => _showAnnouncementDialog(item),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Created: ${item['createdAt']?.toDate().toString().split(' ')[0] ?? 'N/A'}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          item['imageLink'] ?? '',
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
                                            Text(
                                              item['heading'] ?? '',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              item['summary'] ?? '',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            if (item['lastDate'] != null)
                                              Text(
                                                'Last Date: ${DateTime.parse(item['lastDate']).toString().split(' ')[0]}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
