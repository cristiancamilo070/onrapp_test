// product_list_page.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:onrapp_test/core/routes/app_routes.dart';
import 'package:onrapp_test/core/themes/app_theme.dart';
import 'package:onrapp_test/domain/models/product_model.dart';
import 'package:onrapp_test/domain/use_cases/fake_store_use_cases/get_all_products_use_case.dart';
import 'package:onrapp_test/presentation/product_list/bloc/product_list_bloc.dart';

// product_list_page.dart
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductListBloc(context.read<GetAllProductsUseCase>())
            ..add(ProductListEvent()),
      child: Scaffold(
        body: BlocBuilder<ProductListBloc, ProductListState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.colors.white.withOpacity(0.9),
                      AppTheme.colors.appTertiary.withOpacity(0.6),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.colors.appPrimary,
                  ),
                ),
              );
            }

            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.colors.white.withOpacity(0.9),
                    AppTheme.colors.appTertiary.withOpacity(0.6),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        child: Text(
                          'Lista de productos',
                          textAlign: TextAlign.center,
                          style: AppTheme.style.semiBold.copyWith(
                            color: AppTheme.colors.appQuaternary,
                            fontSize: AppTheme.fontSize.f20,
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final ProductModel product = state.products[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                  imageUrl: product.image,
                                ),
                              ),
                              title: Text(
                                product.title,
                                style: AppTheme.style.bold,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                product.description,
                                style: AppTheme.style.regular.copyWith(
                                  fontSize: AppTheme.fontSize.f14,
                                  color: AppTheme.colors.appBlackGrey
                                      .withOpacity(0.8),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: Text(
                                '\$${product.price}',
                                style: AppTheme.style.bold.copyWith(
                                  color: AppTheme.colors.appPrimary,
                                ),
                              ),
                              onTap: () => context.push(
                                RoutesPaths.productDetailPage.replaceFirst(
                                  ':id',
                                  product.id.toString(),
                                ),
                              ),
                              contentPadding: const EdgeInsets.all(12),
                            ),
                          );
                        },
                        childCount: state.products.length,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
