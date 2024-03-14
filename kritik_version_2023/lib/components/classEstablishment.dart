// // ignore_for_file: file_names
// import 'package:hive/hive.dart';

// part 'classEstablishment.g.dart';

// @HiveType(typeId: 1)
// class Establishment {
//   @HiveField(0)
//   String pathImage = "";
//   @HiveField(1)
//   String name = "";
//   @HiveField(2)
//   String location = "";
//   @HiveField(3)
//   String category = "";
//   @HiveField(4)
//   String description = "";
//   @HiveField(5)
//   String address = "";
//   @HiveField(6)
//   String aiScript = '';
//   @HiveField(7)
//   List<Reviews> reviews = [];

//   Establishment(this.pathImage, this.name, this.location, this.category,
//       this.description, this.address, this.aiScript, this.reviews);
// }

// @HiveType(typeId: 2)
// class Reviews {
//   @HiveField(0)
//   String name = "";
//   @HiveField(1)
//   String reviewComment = "";
//   @HiveField(2)
//   double starRating = 0;
//   @HiveField(3)
//   String imagePath = "";
//   @HiveField(4)
//   String establishmentName = "";

//   Reviews(this.name, this.reviewComment, this.starRating, this.imagePath,
//       this.establishmentName);
// }

// @HiveType(typeId: 3)
// class User {
//   @HiveField(0)
//   String name = "";
//   @HiveField(1)
//   List<Reviews> reviews = [];
//   @HiveField(2)
//   List<Establishment> bookmarks = [];

//   User(this.name, this.reviews, this.bookmarks);
// }
// ignore_for_file: file_names

class Establishment {
  String pathImage;
  String name;
  String location;
  String category;
  String description;
  String address;
  String aiScript;
  List<Reviews> reviews;

  Establishment({
    required this.pathImage,
    required this.name,
    required this.location,
    required this.category,
    required this.description,
    required this.address,
    required this.aiScript,
    required this.reviews,
  });
}

class Reviews {
  String name;
  String reviewComment;
  double starRating;
  String imagePath;
  String establishmentName;

  Reviews({
    required this.name,
    required this.reviewComment,
    required this.starRating,
    required this.imagePath,
    required this.establishmentName,
  });
}

class User {
  String name;
  List<Reviews> reviews;
  List<Establishment> bookmarks;

  User({
    required this.name,
    required this.reviews,
    required this.bookmarks,
  });
}
