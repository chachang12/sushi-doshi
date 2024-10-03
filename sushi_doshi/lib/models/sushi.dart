class Sushi {
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final int rating;
  final List<String> ingredients; // New field

  Sushi({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.ingredients, // New field
  });

  // Convert a Sushi object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imagePath': imagePath,
      'rating': rating,
      'ingredients': ingredients, // New field
    };
  }

  // Create a Sushi object from a JSON map
  factory Sushi.fromJson(Map<String, dynamic> json) {
    return Sushi(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imagePath: json['imagePath'],
      rating: json['rating'],
      ingredients: json['ingredients'] != null
          ? List<String>.from(json['ingredients'])
          : [], // Handle null case
    );
  }
}