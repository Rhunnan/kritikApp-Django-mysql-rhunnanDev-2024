import 'package:kritik_version_2023/components/classEstablishment.dart';
import 'package:kritik_version_2023/components/establishment_data_grid.dart';
import 'package:kritik_version_2023/components/services.dart';

Future<void> initHive() async {
  final EstablishmentService establishmentServ = EstablishmentService();
  final UserService _usertService = UserService();
  // Check if the box is empty
  int boxLength = await establishmentServ.getBoxLength();
  if (boxLength == 0) {
    // Add items only if the box is empty
    for (int i = 0; i < establishmentData.length; i++) {
      await establishmentServ.addItem(establishmentData.elementAt(i));
    }

    print("Added initial data to the Hive box.");
  } else {
    print("Hive box already contains data. Skipping addition.");
  }

  print("Finished initializing Hive.");
  int bookmarLength = await _usertService.getBoxLength();
  print("bookmar length: + $bookmarLength");
//create sakog usa ka user ron ang bookmars mo gana
  if (bookmarLength == 0) {
    // Add items only if the box is empty
    _usertService.addUser(User("Rhunnan", [
      Reviews("Rhunnan", "Chowi have the best food in town", 5,
          "assets/images/chowi.png", "Jollibee"),
    ], []));
  }
}
