class Mod {
  Mod({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.file,
    required this.downloads,
  });

  final String? id;
  final String? title;
  final String? description;
  final String image;
  final String? category;
  final String? file;
  final String downloads;

  Mod copyWith({
    String? id,
    String? title,
    String? description,
    String? image,
    String? category,
    String? file,
    String? downloads,
  }) {
    return Mod(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      category: category ?? this.category,
      file: file ?? this.file,
      downloads: downloads ?? this.downloads,
    );
  }

  factory Mod.fromJson(Map<String, dynamic> json) {
    return Mod(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      image: json["image"] ??
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png',
      category: json["category"],
      file: json["file"],
      downloads: json["downloads"] ?? 0,
    );
  }

  @override
  String toString() {
    return "$id, $title, $description, $image, $category, $file, $downloads";
  }
}
