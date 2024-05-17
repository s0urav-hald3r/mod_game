import 'package:mod_game/feature/home/models/category.dart';

class CategoryResponse {
  CategoryResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool? success;
  final List<Category> data;
  final String? message;

  CategoryResponse copyWith({
    bool? success,
    List<Category>? data,
    String? message,
  }) {
    return CategoryResponse(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      success: json["success"],
      data: json["data"] == null
          ? []
          : List<Category>.from(json["data"]!.map((x) => Category.fromJson(x))),
      message: json["message"],
    );
  }

  @override
  String toString() {
    return "$success, $data, $message";
  }
}
