// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:onrapp_test/core/themes/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Importa el paquete
import 'package:onrapp_test/domain/use_cases/fake_store_use_cases/get_product_by_id_use_case.dart';
import 'package:onrapp_test/presentation/product_detail/bloc/product_detail_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final int productId;

  const ProductDetailPage({required this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailBloc(context.read<GetProductDetailUseCase>())
            ..add(ProductDetailEvent(productId)),
      child: Scaffold(
        body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppTheme.colors.appPrimary,
                ),
              );
            }

            final product = state.product!;
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        _actionButton(
                          icon: FontAwesomeIcons.arrowLeft,
                          backgroundColor: AppTheme.colors.appPrimary,
                          onPressed: () {
                            context.pop();
                          },
                        ),
                        Expanded(
                          child: Text(
                            'Detalles del producto',
                            textAlign: TextAlign.center,
                            style: AppTheme.style.semiBold.copyWith(
                              color: AppTheme.colors.appQuaternary,
                              fontSize: AppTheme.fontSize.f20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              height: 250,
                              fit: BoxFit.cover,
                              imageUrl: product.image,
                            ),
                          ),
                        ),
                        heightSpace16,
                        Text(
                          product.title,
                          style: AppTheme.style.bold
                              .copyWith(fontSize: AppTheme.fontSize.f20),
                        ),
                        heightSpace8,
                        Text(
                          product.description,
                          style: AppTheme.style.regular
                              .copyWith(fontSize: AppTheme.fontSize.f14),
                        ),
                        heightSpace8,
                        Text(
                          'Categoría: ${product.category}',
                          style: AppTheme.style.regular.copyWith(
                            fontSize: AppTheme.fontSize.f14,
                            color:
                                AppTheme.colors.appBlackGrey.withOpacity(0.8),
                          ),
                        ),
                        heightSpace8,
                        Text(
                          'Precio: \$${product.price}',
                          style: AppTheme.style.bold.copyWith(
                            color: AppTheme.colors.appPrimary,
                            fontSize: AppTheme.fontSize.f20,
                          ),
                        ),
                        heightSpace8,
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: product.rating.rate,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: AppTheme.colors.appPrimary,
                              ),
                              itemCount: 5,
                              itemSize: 24.0,
                              unratedColor:
                                  AppTheme.colors.appBlackGrey.withOpacity(0.5),
                              direction: Axis.horizontal,
                            ),
                            widthSpace10,
                            Text(
                              '(${product.rating.count} valoraciones)',
                              style: AppTheme.style.regular.copyWith(
                                color: AppTheme.colors.appBlackGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required Color backgroundColor,
    required VoidCallback onPressed,
    Color? iconColor,
  }) {
    return Material(
      elevation: 8,
      shadowColor: backgroundColor.withOpacity(0.5),
      color: Colors.transparent,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: FaIcon(
              icon,
              color: iconColor ?? AppTheme.colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
