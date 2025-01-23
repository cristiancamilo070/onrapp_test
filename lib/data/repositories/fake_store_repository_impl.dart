// fake_store_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:onrapp_test/data/providers/fake_store_provider.dart';
import 'package:onrapp_test/domain/exceptions/base_exception.dart';
import 'package:onrapp_test/domain/models/product_model.dart';
import 'package:onrapp_test/domain/repositories/fake_store_repository.dart';

class FakeStoreRepositoryImpl implements FakeStoreRepository {
  final FakeStoreProvider provider;

  FakeStoreRepositoryImpl(this.provider);

  @override
  Future<Either<BaseException, List<ProductModel>>> getAllProducts() async {
    try {
      final data = await provider.getProductsList();
      final products = data.map((json) => ProductModel.fromJson(json)).toList();
      return right(products);
    } catch (e) {
      return left(BaseException(
        'Error al obtener la lista de productos',
        success: false,
        message: e.toString(),
        code: 'PRODUCT_LIST_ERROR',
      ));
    }
  }

  @override
  Future<Either<BaseException, ProductModel>> getProductById(int id) async {
    try {
      final data = await provider.getProductDetail(id);
      final product = ProductModel.fromJson(data);
      return right(product);
    } catch (e) {
      return left(BaseException(
        'Error al obtener el detalle del producto',
        success: false,
        message: e.toString(),
        code: 'PRODUCT_DETAIL_ERROR',
      ));
    }
  }
}
