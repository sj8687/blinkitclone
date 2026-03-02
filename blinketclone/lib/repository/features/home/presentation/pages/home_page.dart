import 'package:blinketclone/repository/features/home/presentation/widgets/cart_feb.dart';
import 'package:blinketclone/repository/features/home/presentation/widgets/cart_page.dart';
import 'package:blinketclone/repository/features/home/presentation/widgets/product_page.dart';
import 'package:flutter/material.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/banner_slider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CartFAB(),
      bottomNavigationBar: const _BottomNav(),
      body: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          const SliverToBoxAdapter(child: BannerSlider()),
          const SliverToBoxAdapter(child: CategoryList()),
          const SliverPadding(
            padding: EdgeInsets.all(12),
            sliver: ProductGrid(),
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.category), label: "Categories"),
        NavigationDestination(icon: Icon(Icons.shopping_cart), label: "Cart"),
        NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}