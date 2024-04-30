
class RSO {
  String name = 'RSO Name';
  String description = 'RSO Description';
  String category = 'RSO Category';
  String email = 'rso@email.com';
  String website = 'rso.com';
  String image = 'https://via.placeholder.com/150';
  int id = 0;

  RSO({required this.name,required this.description,required this.category,required this.email, required this.website,required this.image,required this.id});

  factory RSO.fromJson(Map<String, dynamic> json) {
    return RSO(
      name: json['name'],
      description: json['description'],
      category: json['category'],
      email: json['email'],
      website: json['website'],
      image: json['image'],
      id: json['id']
    );
  }
}