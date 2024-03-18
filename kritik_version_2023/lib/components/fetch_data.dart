import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:kritik_version_2023/components/classEstablishment.dart';
import 'package:kritik_version_2023/components/establishment_data_grid.dart';
import 'package:kritik_version_2023/components/services.dart';
import 'package:http/http.dart' as http;

// Future<void> initHive() async {
//   final EstablishmentService establishmentServ = EstablishmentService();
//   final UserService _usertService = UserService();
//   // Check if the box is empty
//   int boxLength = await establishmentServ.getBoxLength();
//   if (boxLength == 0) {
//     // Add items only if the box is empty
//     for (int i = 0; i < establishmentData.length; i++) {
//       await establishmentServ.addItem(establishmentData.elementAt(i));
//     }

//     print("Added initial data to the Hive box.");
//   } else {
//     print("Hive box already contains data. Skipping addition.");
//   }

//   print("Finished initializing Hive.");
//   int bookmarLength = await _usertService.getBoxLength();
//   print("bookmar length: + $bookmarLength");
// //create sakog usa ka user ron ang bookmars mo gana
//   if (bookmarLength == 0) {
//     // Add items only if the box is empty
//     _usertService.addUser(User("Rhunnan", [
//       Reviews("Rhunnan", "Chowi have the best food in town", 5,
//           "assets/images/chowi.png", "Jollibee"),
//     ], []));
//   }
// }
//get ideas about the commented codes
// final establishmentProvider = FutureProvider<List<dynamic>>((ref) async {
//   final response = await http
//       .get(Uri.parse("http://192.168.254.102:8000/api/v1/establishment/"));

//   if (response.statusCode == 200) {
//     return jsonDecode(response.body);
//   } else {
//     throw Exception('Failed to Load data');
//   }
// });
class ApiService {
  String userUrl = "http://127.0.0.1:8000/api/v1/establishment/";

  Future<List<Establishment>> getEstablishment() async {
    Response response = await get(Uri.parse(userUrl));
    print('Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      print(result);

      return result.map((e) => Establishment.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final establishmentProvider = Provider<ApiService>((ref) => ApiService());

final establishmentDataProvider =
    FutureProvider<List<Establishment>>((ref) async {
  return ref.watch(establishmentProvider).getEstablishment();
});
