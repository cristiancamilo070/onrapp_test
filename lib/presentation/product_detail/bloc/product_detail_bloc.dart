// product_detail_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onrapp_test/domain/use_cases/fake_store_use_cases/get_product_by_id_use_case.dart';
import 'package:onrapp_test/domain/models/product_model.dart';

class ProductDetailEvent {
  final int productId;
  ProductDetailEvent(this.productId);
}

class ProductDetailState {
  final ProductModel? product;
  final bool isLoading;

  ProductDetailState({this.product, this.isLoading = true});
}

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetProductDetailUseCase getProductDetailUseCase;

  ProductDetailBloc(this.getProductDetailUseCase)
      : super(ProductDetailState()) {
    on<ProductDetailEvent>(_onLoadProductDetail);
  }

  Future<void> _onLoadProductDetail(
      ProductDetailEvent event, Emitter<ProductDetailState> emit) async {
    emit(ProductDetailState(isLoading: true));
    final result = await getProductDetailUseCase
        .execute(GetProductDetailParams(event.productId));
    result.fold(
      (error) => emit(ProductDetailState(isLoading: false)),
      (product) => emit(ProductDetailState(product: product, isLoading: false)),
    );
  }
}
