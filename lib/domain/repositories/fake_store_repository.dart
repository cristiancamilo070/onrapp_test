// fake_store_repository.dart
import 'package:dartz/dartz.dart';
import 'package:onrapp_test/domain/exceptions/base_exception.dart';
import 'package:onrapp_test/domain/models/product_model.dart';

abstract class FakeStoreRepository {
  /// Retorna la lista de productos
  Future<Either<BaseException, List<ProductModel>>> getAllProducts();

  /// Retorna el detalle de un producto
  Future<Either<BaseException, ProductModel>> getProductById(int id);
}
