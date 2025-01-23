import 'package:dartz/dartz.dart';
import 'package:onrapp_test/domain/exceptions/base_exception.dart';
import 'package:onrapp_test/domain/models/product_model.dart';
import 'package:onrapp_test/domain/repositories/fake_store_repository.dart';
import 'package:onrapp_test/domain/use_cases/base_use_cases.dart';

class GetAllProductsUseCase extends BaseUseCases<List<ProductModel>, NoParams> {
  final FakeStoreRepository repository;

  GetAllProductsUseCase(this.repository);

  @override
  Future<Either<BaseException, List<ProductModel>>> execute(NoParams params) {
    return repository.getAllProducts();
  }
}

class NoParams {}
