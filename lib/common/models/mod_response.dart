import 'package:mod_game/common/models/mod.dart';

class ModResponse {
  ModResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool? success;
  final List<Mod> data;
  final String? message;

  ModResponse copyWith({
    bool? success,
    List<Mod>? data,
    String? message,
  }) {
    return ModResponse(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  factory ModResponse.fromJson(Map<String, dynamic> json) {
    return ModResponse(
      success: json["success"],
      data: json["data"] == null
          ? []
          : List<Mod>.from(json["data"]!.map((x) => Mod.fromJson(x))),
      message: json["message"],
    );
  }

  @override
  String toString() {
    return "$success, $data, $message";
  }
}
