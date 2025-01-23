import 'package:dartz/dartz.dart';
import 'package:onrapp_test/domain/exceptions/base_exception.dart';
import 'package:onrapp_test/domain/models/product_model.dart';
import 'package:onrapp_test/domain/repositories/fake_store_repository.dart';
import 'package:onrapp_test/domain/use_cases/base_use_cases.dart';

class GetProductDetailUseCase
    extends BaseUseCases<ProductModel, GetProductDetailParams> {
  final FakeStoreRepository repository;

  GetProductDetailUseCase(this.repository);

  @override
  Future<Either<BaseException, ProductModel>> execute(
    GetProductDetailParams params,
  ) {
    return repository.getProductById(params.productId);
  }
}

class GetProductDetailParams {
  final int productId;
  GetProductDetailParams(this.productId);
}
