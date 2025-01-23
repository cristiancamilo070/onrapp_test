// product_list_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onrapp_test/domain/use_cases/fake_store_use_cases/get_all_products_use_case.dart';
import 'package:onrapp_test/domain/models/product_model.dart';

class ProductListEvent {}

class ProductListState {
  final List<ProductModel> products;
  final bool isLoading;

  ProductListState({this.products = const [], this.isLoading = false});
}

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final GetAllProductsUseCase getAllProductsUseCase;

  ProductListBloc(this.getAllProductsUseCase)
      : super(ProductListState(isLoading: true)) {
    on<ProductListEvent>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
      ProductListEvent event, Emitter<ProductListState> emit) async {
    emit(ProductListState(isLoading: true));
    final result = await getAllProductsUseCase.execute(NoParams());
    result.fold(
      (error) => emit(ProductListState(isLoading: false)),
      (products) =>
          emit(ProductListState(products: products, isLoading: false)),
    );
  }
}
