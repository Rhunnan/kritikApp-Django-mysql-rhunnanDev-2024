class User {
  String name;

  User({required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
    );
  }
}

class Establishment {
  String pathImage;
  String name;
  String location;
  String category;
  String description;
  String address;
  String aiScript;

  Establishment({
    required this.pathImage,
    required this.name,
    required this.location,
    required this.category,
    required this.description,
    required this.address,
    required this.aiScript,
  });

  factory Establishment.fromJson(Map<String, dynamic> json) {
    return Establishment(
      pathImage: json['path_image'],
      name: json['name'],
      location: json['location'],
      category: json['category'],
      description: json['description'],
      address: json['address'],
      aiScript: json['ai_script'],
    );
  }
}

class Reviews {
  String reviewComment;
  String starRating;
  String imagePath;
  String userId;
  String establishmentId;

  Reviews({
    required this.reviewComment,
    required this.starRating,
    required this.imagePath,
    required this.userId,
    required this.establishmentId,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
        reviewComment: json['review_comment'],
        starRating: json['star_rating'],
        imagePath: json['image_path'],
        userId: json['userId'],
        establishmentId: json['establishmentId']);
  }
}
