class Mod {
  Mod({
    this.id,
    this.title,
    this.description,
    this.image,
    this.category,
    this.file,
    this.downloads,
  });

  final String? id;
  final String? title;
  final String? description;
  final String? image;
  final String? category;
  final String? file;
  final String? downloads;

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

  // Convert Mod object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'category': category,
      'file': file,
      'downloads': downloads,
    };
  }

  @override
  String toString() {
    return "$id, $title, $description, $image, $category, $file, $downloads";
  }
}
