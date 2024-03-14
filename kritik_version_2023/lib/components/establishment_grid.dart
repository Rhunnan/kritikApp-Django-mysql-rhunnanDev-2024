// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:kritik_version_2023/components/classEstablishment.dart';
// import 'package:kritik_version_2023/components/establishment_profile.dart';
// import 'package:kritik_version_2023/components/profile_page.dart';
// import 'package:kritik_version_2023/components/search_bar_profile.dart';
// import 'package:kritik_version_2023/components/services.dart';
// import 'package:provider/provider.dart';

// class EstablishmentsGrid extends StatefulWidget {
//   // ignore: prefer_const_constructors_in_immutables
//   EstablishmentsGrid({super.key});

//   @override
//   State<EstablishmentsGrid> createState() => _EstablishmentsGridState();
// }

// class _EstablishmentsGridState extends State<EstablishmentsGrid> {
//   TextEditingController controllerSearchText = TextEditingController();
//   var restaurants = true;
//   var hotels = false;
//   var beach = false;
//   var populars = false;
//   var explore = false;

//   //putting initial list into the hivebox and from the hive box putting in in  a list nad filtering it
//   final EstablishmentService _establishmentServices = EstablishmentService();
//   final UserService _userService = UserService();

//   late List<Establishment> hotelFilter = [],
//       restaurantFilter = [],
//       beachFilter = [],
//       allEstabFilter = [];

//   // /using this initState to run this functions only once
//   @override
//   void initState() {
//     super.initState();
//     hoFilters(controllerSearchText);
//     restoFilters(controllerSearchText);
//     beachFilters(controllerSearchText);
//     allFilters(controllerSearchText);
//     WidgetsBinding.instance?.addPostFrameCallback((_) {
//       // Simulate a tap on Restaurants button
//       changeColorNavigation(1);
//     });
//   }

//   Future<void> hoFilters(TextEditingController searchText) async {
//     hotelFilter = await _establishmentServices.getAllEstablishment().then(
//         (establishmentList) => establishmentList
//             .map((establishment) => establishment)
//             .where((establishment) => establishment.category.contains("Hotel"))
//             .toList()
//             .cast<Establishment>());
//     if (searchText.text.isEmpty) {
//       hotelFilter = await _establishmentServices.getAllEstablishment().then(
//           (establishmentList) => establishmentList
//               .map((establishment) => establishment)
//               .where(
//                   (establishment) => establishment.category.contains("Hotel"))
//               .toList()
//               .cast<Establishment>());
//     } else {
//       hotelFilter = hotelFilter
//           .map((establishment) => establishment)
//           .where(
//               (establishment) => establishment.name.contains(searchText.text))
//           .toList()
//           .cast<Establishment>();

//       // changeColorNavigation(2);
//     }

//     print("hotel called");
//     print(hotelFilter.length);

//     setState(() {});
//   }

//   Future<void> allFilters(TextEditingController searchText) async {
//     allEstabFilter = await _establishmentServices.getAllEstablishment();

//     if (searchText.text.isEmpty) {
//       allEstabFilter = await _establishmentServices.getAllEstablishment();
//       print("all List of establishments");
//       print(allEstabFilter.length);
//     } else {
//       allEstabFilter = allEstabFilter
//           .map((establishment) => establishment)
//           .where(
//               (establishment) => establishment.name.contains(searchText.text))
//           .toList()
//           .cast<Establishment>();

//       // changeColorNavigation(4);
//     }

//     setState(() {});
//   }

//   Future<void> restoFilters(TextEditingController searchText) async {
//     restaurantFilter = await _establishmentServices.getAllEstablishment().then(
//         (establishmentList) => establishmentList
//             .map((establishment) => establishment)
//             .where((establishment) =>
//                 establishment.category.contains("Restaurant"))
//             .toList()
//             .cast<Establishment>());

//     if (searchText.text.isEmpty) {
//       restaurantFilter = await _establishmentServices
//           .getAllEstablishment()
//           .then((establishmentList) => establishmentList
//               .map((establishment) => establishment)
//               .where((establishment) =>
//                   establishment.category.contains("Restaurant"))
//               .toList()
//               .cast<Establishment>());
//     } else {
//       restaurantFilter = restaurantFilter
//           .map((establishment) => establishment)
//           .where(
//               (establishment) => establishment.name.contains(searchText.text))
//           .toList()
//           .cast<Establishment>();

//       // changeColorNavigation(1);
//     }
//     print("restaurant called");
//     print(restaurantFilter.length);

//     setState(() {});
//   }

//   Future<void> beachFilters(TextEditingController searchText) async {
//     beachFilter = await _establishmentServices.getAllEstablishment().then(
//         (establishmentList) => establishmentList
//             .map((establishment) => establishment)
//             .where((establishment) => establishment.category.contains("Beach"))
//             .toList()
//             .cast<Establishment>());
//     if (searchText.text.isEmpty) {
//       beachFilter = await _establishmentServices.getAllEstablishment().then(
//           (establishmentList) => establishmentList
//               .map((establishment) => establishment)
//               .where(
//                   (establishment) => establishment.category.contains("Beach"))
//               .toList()
//               .cast<Establishment>());
//     } else {
//       beachFilter = beachFilter
//           .map((establishment) => establishment)
//           .where(
//               (establishment) => establishment.name.contains(searchText.text))
//           .toList()
//           .cast<Establishment>();

//       // changeColorNavigation(3);
//     }
//     print("beach called");
//     print(beachFilter.length);

//     setState(() {});
//   }

//   //filtering establishments. putting them into a new list

//   //filtering establishments. putting them into a new list

//   //filtering establishments. putting them into a new list

//   //for the mean time I will use all the data of the establishments for showing the explore and popular filter while I stil dont have data
//   //filtering establishments. putting them into a new list
//   // List<Establishment> exploreFilter = establishmentData
//   //     .map((establishment) => establishment)
//   //     .toList()
//   //     .cast<Establishment>()
//   //     .where((establishment) => establishment.category.contains("Explore"))
//   //     .cast<Establishment>()
//   //     .toList();
//   //        //filtering establishments. putting them into a new list
//   // List<Establishment> popularFilter = establishmentData
//   //     .map((establishment) => establishment)
//   //     .toList()
//   //     .cast<Establishment>()
//   //     .where((establishment) => establishment.category.contains("Popular"))
//   //     .cast<Establishment>()
//   //     .toList();
//   // establishmentData.forEach((establishment) {
//   //   listOfAllEstablishments.add(establishment);
//   // });
//   // var filterCategoryList = EstablishmentGridData.map((establishment) => (establishment["Category"])).toList();

//   //default value of the displayed list of establishments
//   List<Establishment> establishmentDataDisplay = [];
//   // establishmentData
//   //     .map((establishment) => establishment)
//   //     .toList()
//   //     .cast<Establishment>()
//   //     .where((establishment) => establishment.category.contains("Restaurant"))
//   //     .cast<Establishment>()
//   //     .toList();

// //function to route to the page profile
//   Future route(Establishment estabProfile) {
//     return Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) =>
//               EstablishmentProfile(establishment: estabProfile)),
//     );
//   }

// //logic to change the colors of the text button and the list of data to be filtered
//   void changeColorNavigation(int num) {
//     switch (num) {
//       case 1: //for restaurant
//         establishmentDataDisplay = restaurantFilter;
//         setState(() {
//           restaurants = true;
//           hotels = false;
//           beach = false;
//           populars = false;
//           explore = false;
//         });
//         break;
//       case 2: //for hotels
//         establishmentDataDisplay = hotelFilter;
//         setState(() {
//           restaurants = false;
//           hotels = true;
//           beach = false;
//           populars = false;
//           explore = false;
//         });
//         break;

//       case 3: //for nbeach
//         establishmentDataDisplay = beachFilter;
//         setState(() {
//           restaurants = false;
//           hotels = false;
//           beach = true;
//           populars = false;
//           explore = false;
//         });
//         break;

//       case 4: // for populars
//         establishmentDataDisplay = allEstabFilter;
//         setState(() {
//           restaurants = false;
//           hotels = false;
//           beach = false;
//           populars = true;
//           explore = false;
//         });
//         break;

//       case 5: //for explore
//         establishmentDataDisplay = allEstabFilter;

//         setState(() {
//           explore = true;
//           restaurants = false;
//           hotels = false;
//           beach = false;
//           populars = false;
//         });
//         break;
//       default:
//         establishmentDataDisplay = restaurantFilter;

//         setState(() {
//           explore = false;
//           restaurants = true;
//           hotels = false;
//           beach = false;
//           populars = false;
//         });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 50),
//           child: Column(
//             children: [
//               //proofile and ciity
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20),
//                     child: SvgPicture.asset(
//                       "assets/images/locationIcon.svg",
//                       height: 30,
//                       width: 28.5,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 17, right: 10),
//                     child: Container(
//                         height: 24,
//                         width: 245,
//                         decoration: const BoxDecoration(
//                             border: Border(
//                                 bottom: BorderSide(
//                                     width: 1.0, color: Colors.black))),
//                         child: const Text(
//                           "Cebu, Philippines",
//                           style: TextStyle(fontSize: 17),
//                         )),
//                   ),
//                   Container(
//                     height: 43,
//                     width: 43,
//                     decoration:
//                         BoxDecoration(borderRadius: BorderRadius.circular(20)),
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const ProfilePage()),
//                         );
//                       },
//                       child: Image.asset("assets/images/profile1.png"),
//                     ),
//                   ),
//                 ],
//               ),
//               //profile and city ending
//               //search bar starting
//               Padding(
//                 padding: const EdgeInsets.only(left: 17),
//                 child: SizedBox(
//                   height: 70,
//                   width: 320,
//                   child: Row(
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             hoFilters(controllerSearchText);
//                             restoFilters(controllerSearchText);
//                             beachFilters(controllerSearchText);
//                             allFilters(controllerSearchText);
//                             if (hotels == true) {
//                               changeColorNavigation(2);
//                             } else if (restaurants == true) {
//                               changeColorNavigation(1);
//                             } else if (beach == true) {
//                               changeColorNavigation(3);
//                             } else if (explore == true) {
//                               changeColorNavigation(5);
//                             } else {
//                               changeColorNavigation(4);
//                             }

//                             // controllerSearchText.clear();
//                           },
//                           icon: Icon(Icons.search)),
//                       // SvgPicture.asset("assets/images/searchIcon.svg"),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20, right: 0),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: SizedBox(
//                             height: 70,
//                             width: 220,
//                             child: TextField(
//                               controller: controllerSearchText,
//                               style: const TextStyle(
//                                   fontSize: 20,
//                                   color: Color.fromARGB(255, 136, 129, 129)),
//                               decoration: const InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText: 'Search',
//                                   hintStyle: TextStyle(fontSize: 25)),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SvgPicture.asset("assets/images/adjust.svg")
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.only(left: 10),
//           height: 50,
//           width: 330,
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: GestureDetector(
//                     onTap: () {
//                       changeColorNavigation(1);
//                     },
//                     child: restaurants
//                         ? const Text("Restaurants",
//                             style: TextStyle(fontSize: 10, color: Colors.blue))
//                         : const Text("Restaurants",
//                             style:
//                                 TextStyle(fontSize: 10, color: Colors.black))),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: GestureDetector(
//                     onTap: () {
//                       changeColorNavigation(2);
//                     },
//                     child: hotels
//                         ? const Text("Hotels",
//                             style: TextStyle(fontSize: 10, color: Colors.blue))
//                         : const Text("Hotels",
//                             style:
//                                 TextStyle(fontSize: 10, color: Colors.black))),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: GestureDetector(
//                     onTap: () {
//                       changeColorNavigation(3);
//                     },
//                     child: beach
//                         ? const Text("Beach",
//                             style: TextStyle(fontSize: 10, color: Colors.blue))
//                         : const Text("Beach",
//                             style:
//                                 TextStyle(fontSize: 10, color: Colors.black))),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: GestureDetector(
//                     onTap: () {
//                       changeColorNavigation(5);
//                     },
//                     child: explore
//                         ? const Text("Explore",
//                             style: TextStyle(fontSize: 10, color: Colors.blue))
//                         : const Text("Explore",
//                             style:
//                                 TextStyle(fontSize: 10, color: Colors.black))),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: GestureDetector(
//                     onTap: () {
//                       changeColorNavigation(4);
//                     },
//                     child: populars
//                         ? const Text("Populars",
//                             style: TextStyle(fontSize: 10, color: Colors.blue))
//                         : const Text("Populars",
//                             style:
//                                 TextStyle(fontSize: 10, color: Colors.black))),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 480,
//           width: 350,
//           child:
//               //establishments grid V
//               GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.80,
//             ),
//             // itemCount: EstablishmentGridData.length,
//             itemCount: establishmentDataDisplay.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   _userService.addToBookmarks(establishmentDataDisplay[index]);
//                   route(establishmentDataDisplay[index]);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     child: Column(
//                       children: [
//                         //establishment Image
//                         Container(
//                             height: 150,
//                             width: 150,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage(
//                                     // EstablishmentGridData[index]['path']),
//                                     establishmentDataDisplay[index].pathImage),
//                                 fit: BoxFit.cover,
//                               ),
//                               borderRadius: BorderRadius.circular(35.0),
//                             ),
//                             //bookmark and star rating
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 75.0, top: 7, bottom: 80),
//                                   child:
//                                       Image.asset("assets/images/bookmark.png"),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 60),
//                                   child: Image.asset(
//                                       "assets/images/starRating.png"),
//                                 )
//                               ],
//                             )),
//                         //Establishments Name, Location and Location symbol
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Row(
//                             children: [
//                               Image.asset("assets/images/locationSmallRed.png"),
//                               Column(
//                                 children: [
//                                   Text(
//                                     establishmentDataDisplay[index].name,
//                                     // EstablishmentGridData[index]['name'],
//                                     style: const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                   Text(
//                                     establishmentDataDisplay[index].location,
//                                     // EstablishmentGridData[index]['location'],
//                                     style: const TextStyle(
//                                         fontSize: 11,
//                                         fontWeight: FontWeight.w300),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
// // pag add og input sa hivebox nya i retrives sa hivebox then i post diri
//the lower part is for the django the comment section are the orig one
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kritik_version_2023/components/classEstablishment.dart';
import 'package:kritik_version_2023/components/establishment_profile.dart';
import 'package:kritik_version_2023/components/profile_page.dart';
import 'package:kritik_version_2023/components/search_bar_profile.dart';
import 'package:kritik_version_2023/components/services.dart';
import 'package:provider/provider.dart';

class EstablishmentsGrid extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  EstablishmentsGrid({super.key});

  @override
  State<EstablishmentsGrid> createState() => _EstablishmentsGridState();
}

class _EstablishmentsGridState extends State<EstablishmentsGrid> {
  TextEditingController controllerSearchText = TextEditingController();
  var restaurants = true;
  var hotels = false;
  var beach = false;
  var populars = false;
  var explore = false;

  //putting initial list into the hivebox and from the hive box putting in in  a list nad filtering it
  final EstablishmentService _establishmentServices = EstablishmentService();
  final UserService _userService = UserService();

  late List<Establishment> hotelFilter = [],
      restaurantFilter = [],
      beachFilter = [],
      allEstabFilter = [];

  // /using this initState to run this functions only once
  @override
  void initState() {
    super.initState();
    hoFilters(controllerSearchText);
    restoFilters(controllerSearchText);
    beachFilters(controllerSearchText);
    allFilters(controllerSearchText);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // Simulate a tap on Restaurants button
      changeColorNavigation(1);
    });
  }

  Future<void> hoFilters(TextEditingController searchText) async {
    hotelFilter = await _establishmentServices.getAllEstablishment().then(
        (establishmentList) => establishmentList
            .map((establishment) => establishment)
            .where((establishment) => establishment.category.contains("Hotel"))
            .toList()
            .cast<Establishment>());
    if (searchText.text.isEmpty) {
      hotelFilter = await _establishmentServices.getAllEstablishment().then(
          (establishmentList) => establishmentList
              .map((establishment) => establishment)
              .where(
                  (establishment) => establishment.category.contains("Hotel"))
              .toList()
              .cast<Establishment>());
    } else {
      hotelFilter = hotelFilter
          .map((establishment) => establishment)
          .where(
              (establishment) => establishment.name.contains(searchText.text))
          .toList()
          .cast<Establishment>();

      // changeColorNavigation(2);
    }

    print("hotel called");
    print(hotelFilter.length);

    setState(() {});
  }

  Future<void> allFilters(TextEditingController searchText) async {
    allEstabFilter = await _establishmentServices.getAllEstablishment();

    if (searchText.text.isEmpty) {
      allEstabFilter = await _establishmentServices.getAllEstablishment();
      print("all List of establishments");
      print(allEstabFilter.length);
    } else {
      allEstabFilter = allEstabFilter
          .map((establishment) => establishment)
          .where(
              (establishment) => establishment.name.contains(searchText.text))
          .toList()
          .cast<Establishment>();

      // changeColorNavigation(4);
    }

    setState(() {});
  }

  Future<void> restoFilters(TextEditingController searchText) async {
    restaurantFilter = await _establishmentServices.getAllEstablishment().then(
        (establishmentList) => establishmentList
            .map((establishment) => establishment)
            .where((establishment) =>
                establishment.category.contains("Restaurant"))
            .toList()
            .cast<Establishment>());

    if (searchText.text.isEmpty) {
      restaurantFilter = await _establishmentServices
          .getAllEstablishment()
          .then((establishmentList) => establishmentList
              .map((establishment) => establishment)
              .where((establishment) =>
                  establishment.category.contains("Restaurant"))
              .toList()
              .cast<Establishment>());
    } else {
      restaurantFilter = restaurantFilter
          .map((establishment) => establishment)
          .where(
              (establishment) => establishment.name.contains(searchText.text))
          .toList()
          .cast<Establishment>();

      // changeColorNavigation(1);
    }
    print("restaurant called");
    print(restaurantFilter.length);

    setState(() {});
  }

  Future<void> beachFilters(TextEditingController searchText) async {
    beachFilter = await _establishmentServices.getAllEstablishment().then(
        (establishmentList) => establishmentList
            .map((establishment) => establishment)
            .where((establishment) => establishment.category.contains("Beach"))
            .toList()
            .cast<Establishment>());
    if (searchText.text.isEmpty) {
      beachFilter = await _establishmentServices.getAllEstablishment().then(
          (establishmentList) => establishmentList
              .map((establishment) => establishment)
              .where(
                  (establishment) => establishment.category.contains("Beach"))
              .toList()
              .cast<Establishment>());
    } else {
      beachFilter = beachFilter
          .map((establishment) => establishment)
          .where(
              (establishment) => establishment.name.contains(searchText.text))
          .toList()
          .cast<Establishment>();

      // changeColorNavigation(3);
    }
    print("beach called");
    print(beachFilter.length);

    setState(() {});
  }

  //filtering establishments. putting them into a new list

  //filtering establishments. putting them into a new list

  //filtering establishments. putting them into a new list

  //for the mean time I will use all the data of the establishments for showing the explore and popular filter while I stil dont have data
  //filtering establishments. putting them into a new list
  // List<Establishment> exploreFilter = establishmentData
  //     .map((establishment) => establishment)
  //     .toList()
  //     .cast<Establishment>()
  //     .where((establishment) => establishment.category.contains("Explore"))
  //     .cast<Establishment>()
  //     .toList();
  //        //filtering establishments. putting them into a new list
  // List<Establishment> popularFilter = establishmentData
  //     .map((establishment) => establishment)
  //     .toList()
  //     .cast<Establishment>()
  //     .where((establishment) => establishment.category.contains("Popular"))
  //     .cast<Establishment>()
  //     .toList();
  // establishmentData.forEach((establishment) {
  //   listOfAllEstablishments.add(establishment);
  // });
  // var filterCategoryList = EstablishmentGridData.map((establishment) => (establishment["Category"])).toList();

  //default value of the displayed list of establishments
  List<Establishment> establishmentDataDisplay = [];
  // establishmentData
  //     .map((establishment) => establishment)
  //     .toList()
  //     .cast<Establishment>()
  //     .where((establishment) => establishment.category.contains("Restaurant"))
  //     .cast<Establishment>()
  //     .toList();

//function to route to the page profile
  Future route(Establishment estabProfile) {
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              EstablishmentProfile(establishment: estabProfile)),
    );
  }

//logic to change the colors of the text button and the list of data to be filtered
  void changeColorNavigation(int num) {
    switch (num) {
      case 1: //for restaurant
        establishmentDataDisplay = restaurantFilter;
        setState(() {
          restaurants = true;
          hotels = false;
          beach = false;
          populars = false;
          explore = false;
        });
        break;
      case 2: //for hotels
        establishmentDataDisplay = hotelFilter;
        setState(() {
          restaurants = false;
          hotels = true;
          beach = false;
          populars = false;
          explore = false;
        });
        break;

      case 3: //for nbeach
        establishmentDataDisplay = beachFilter;
        setState(() {
          restaurants = false;
          hotels = false;
          beach = true;
          populars = false;
          explore = false;
        });
        break;

      case 4: // for populars
        establishmentDataDisplay = allEstabFilter;
        setState(() {
          restaurants = false;
          hotels = false;
          beach = false;
          populars = true;
          explore = false;
        });
        break;

      case 5: //for explore
        establishmentDataDisplay = allEstabFilter;

        setState(() {
          explore = true;
          restaurants = false;
          hotels = false;
          beach = false;
          populars = false;
        });
        break;
      default:
        establishmentDataDisplay = restaurantFilter;

        setState(() {
          explore = false;
          restaurants = true;
          hotels = false;
          beach = false;
          populars = false;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              //proofile and ciity
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SvgPicture.asset(
                      "assets/images/locationIcon.svg",
                      height: 30,
                      width: 28.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17, right: 10),
                    child: Container(
                        height: 24,
                        width: 245,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.black))),
                        child: const Text(
                          "Cebu, Philippines",
                          style: TextStyle(fontSize: 17),
                        )),
                  ),
                  Container(
                    height: 43,
                    width: 43,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()),
                        );
                      },
                      child: Image.asset("assets/images/profile1.png"),
                    ),
                  ),
                ],
              ),
              //profile and city ending
              //search bar starting
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: SizedBox(
                  height: 70,
                  width: 320,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            hoFilters(controllerSearchText);
                            restoFilters(controllerSearchText);
                            beachFilters(controllerSearchText);
                            allFilters(controllerSearchText);
                            if (hotels == true) {
                              changeColorNavigation(2);
                            } else if (restaurants == true) {
                              changeColorNavigation(1);
                            } else if (beach == true) {
                              changeColorNavigation(3);
                            } else if (explore == true) {
                              changeColorNavigation(5);
                            } else {
                              changeColorNavigation(4);
                            }

                            // controllerSearchText.clear();
                          },
                          icon: Icon(Icons.search)),
                      // SvgPicture.asset("assets/images/searchIcon.svg"),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            height: 70,
                            width: 220,
                            child: TextField(
                              controller: controllerSearchText,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 136, 129, 129)),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search',
                                  hintStyle: TextStyle(fontSize: 25)),
                            ),
                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/images/adjust.svg")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 50,
          width: 330,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                    onTap: () {
                      changeColorNavigation(1);
                    },
                    child: restaurants
                        ? const Text("Restaurants",
                            style: TextStyle(fontSize: 10, color: Colors.blue))
                        : const Text("Restaurants",
                            style:
                                TextStyle(fontSize: 10, color: Colors.black))),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                    onTap: () {
                      changeColorNavigation(2);
                    },
                    child: hotels
                        ? const Text("Hotels",
                            style: TextStyle(fontSize: 10, color: Colors.blue))
                        : const Text("Hotels",
                            style:
                                TextStyle(fontSize: 10, color: Colors.black))),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                    onTap: () {
                      changeColorNavigation(3);
                    },
                    child: beach
                        ? const Text("Beach",
                            style: TextStyle(fontSize: 10, color: Colors.blue))
                        : const Text("Beach",
                            style:
                                TextStyle(fontSize: 10, color: Colors.black))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                    onTap: () {
                      changeColorNavigation(5);
                    },
                    child: explore
                        ? const Text("Explore",
                            style: TextStyle(fontSize: 10, color: Colors.blue))
                        : const Text("Explore",
                            style:
                                TextStyle(fontSize: 10, color: Colors.black))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                    onTap: () {
                      changeColorNavigation(4);
                    },
                    child: populars
                        ? const Text("Populars",
                            style: TextStyle(fontSize: 10, color: Colors.blue))
                        : const Text("Populars",
                            style:
                                TextStyle(fontSize: 10, color: Colors.black))),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 480,
          width: 350,
          child:
              //establishments grid V
              GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.80,
            ),
            // itemCount: EstablishmentGridData.length,
            itemCount: establishmentDataDisplay.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _userService.addToBookmarks(establishmentDataDisplay[index]);
                  route(establishmentDataDisplay[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Column(
                      children: [
                        //establishment Image
                        Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    // EstablishmentGridData[index]['path']),
                                    establishmentDataDisplay[index].pathImage),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            //bookmark and star rating
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 75.0, top: 7, bottom: 80),
                                  child:
                                      Image.asset("assets/images/bookmark.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 60),
                                  child: Image.asset(
                                      "assets/images/starRating.png"),
                                )
                              ],
                            )),
                        //Establishments Name, Location and Location symbol
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Image.asset("assets/images/locationSmallRed.png"),
                              Column(
                                children: [
                                  Text(
                                    establishmentDataDisplay[index].name,
                                    // EstablishmentGridData[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    establishmentDataDisplay[index].location,
                                    // EstablishmentGridData[index]['location'],
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
// pag add og input sa hivebox nya i retrives sa hivebox then i post diri
