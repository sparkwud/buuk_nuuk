// import 'package:buuk_nuuk/models/category_model.dart';
// import 'package:buuk_nuuk/utils/pallete.dart';
// import 'package:buuk_nuuk/views/screens/category_items_screen.dart';
// import 'package:buuk_nuuk/views/screens/search_screen.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// final TextEditingController searchController = TextEditingController();

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         //physics: const BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             SizedBox(
//               height: height / 2,
//               child: Stack(
//                 children: [
//                   Container(
//                     height: height / 2.5,
//                     decoration: BoxDecoration(
//                       color: appColors.lightBlue,
//                       borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(45),
//                         bottomRight: Radius.circular(45),
//                       ),
//                     ),
//                     child: SafeArea(
//                       minimum: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Spacer(),
//                           Text(
//                             "Book Store",
//                             style: Theme.of(context).textTheme.displayLarge,
//                           ),
//                           const Spacer(),
//                           InkWell(
//                             onTap: () {
//                               showSearch(
//                                 context: context,
//                                 delegate: SearchScreen(),
//                               );
//                             },
//                             child: Container(
//                               padding: const EdgeInsets.all(12),
//                               height: 50,
//                               width: double.maxFinite,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 border: Border.all(
//                                   width: 1,
//                                   color: appColors.black,
//                                 ),
//                               ),
//                               child: const Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("Search for Books"),
//                                   Icon(Icons.search),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const Spacer(
//                             flex: 2,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Most Popular',
//                                 style:
//                                     Theme.of(context).textTheme.displayMedium,
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                       CategoryItemScreen(category: Category.fiction)
//                                     ),
//                                   );
//                                 },
//                                 child: Text(
//                                   "See All",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headlineMedium,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const Spacer(
//                             flex: 5,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 0,
//                     right: 0,
//                     bottom: 0,
//                     child: Container(
//                       height: height / 5.3,
//                       //height: constraints.maxHeight * 0.38,
//                       margin: const EdgeInsets.only(left: 16),
//                       child: const PopularBooks(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Headline(
//               category: "Anime",
//               showAll: "Anime",
//             ),
//             SizedBox(
//               //color: Colors.grey.shade100,
//               height: height / 3.4,
//               child: const AnimeBooks(),
//             ),
//             Headline(
//               category: "Action & Adventure",
//               showAll: "Action & Adventure",
//             ),
//             SizedBox(
//               //color: Colors.yellow,
//               height: height / 3.4,
//               child: const AdevntureBooks(),
//             ),
//             Headline(
//               category: "Novel",
//               showAll: "Novel",
//             ),
//             SizedBox(
//               //color: Colors.yellow,
//               height: height / 3.4,
//               child: const NovelBooks(),
//             ),
//             Headline(
//               category: "Horror",
//               showAll: "Horror",
//             ),
//             SizedBox(
//               //color: Colors.yellow,
//               height: height / 3.4,
//               child: const HorrorBooks(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
