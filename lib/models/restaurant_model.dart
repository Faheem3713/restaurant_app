class Restaurant {
  final int id;
  final String name;
  final String neighborhood;
  final String photograph;
  final String address;
  final String date;
  final Map<String, dynamic> latlng;
  final String cuisineType;
  final Map<String, dynamic> operatingHours;
  final List<Review> reviews;
  final String rating;
  Restaurant({
    required this.rating,
    required this.date,
    required this.id,
    required this.name,
    required this.neighborhood,
    required this.photograph,
    required this.address,
    required this.latlng,
    required this.cuisineType,
    required this.operatingHours,
    required this.reviews,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    List<Review> reviews =
        (json['reviews'] as List).map((e) => Review.fromJson(e)).toList();

    final Map<int, int> ratingMap = {};
    int sum = 0;

    for (var e in reviews.map((e) => e.rating).toList()) {
      ratingMap[e] = (ratingMap[e] ?? 0) + 1;
    }

    ratingMap.forEach((key, value) {
      sum += key * value;
    });
    final totalValue = ratingMap.values
        .fold(0, (previousValue, element) => previousValue + element);
    final rating = (sum / totalValue).toStringAsFixed(1);

    return Restaurant(
      rating: rating,
      date: json['date'] ?? '',
      id: json['id'],
      name: json['name'],
      neighborhood: json['neighborhood'],
      photograph: json['photograph'],
      address: json['address'],
      latlng: json['latlng'],
      cuisineType: json['cuisine_type'],
      operatingHours: json['operating_hours'],
      reviews: reviews,
    );
  }
}

class Review {
  final String name;
  final String date;
  final int rating;
  final String comments;

  Review({
    required this.name,
    required this.date,
    required this.rating,
    required this.comments,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      name: json['name'],
      date: json['date'],
      rating: json['rating'],
      comments: json['comments'],
    );
  }
}
