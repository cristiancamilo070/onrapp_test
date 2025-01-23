// product_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onrapp_test/domain/models/rating_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required String title,
    required String description,
    required double price,
    required String category,
    required String image,
    required RatingModel rating,
  }) = _ProductModel;

  /// Método para generar una instancia desde JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
