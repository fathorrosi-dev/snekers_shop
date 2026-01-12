import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snekers_shop/provider/cart_provider.dart';
import 'package:snekers_shop/screen/home_screen/components/shoe_card.dart';
import 'package:snekers_shop/screen/utils/constants/colors.dart';
import 'package:snekers_shop/screen/utils/helpers/helper_function.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: HelperFunction.isDarkMode(context)
                    ? AppColors.secondaryDark
                    : AppColors.secondaryLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: Theme.of(context).textTheme.bodyLarge,
                      decoration: const InputDecoration(hintText: 'Search'),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: HelperFunction.isDarkMode(context)
                          ? AppColors.lightTextSecondary
                          : AppColors.darkTextSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'Everyone flies... some fly longer than others',
              style: HelperFunction.isDarkMode(context)
                  ? Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.lightTextSecondary,
                    )
                  : Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.darkTextSecondary,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks🔥',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See All',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 21),
          SizedBox(
            height: 450,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection:
                  Axis.horizontal, // Set scroll direction to horizontal
              itemCount: value.getShoeList().length,
              itemBuilder: (context, index) {
                final shoe = value.getShoeList()[index];
                return ShoeCard(shoe: shoe);
              },
            ),
          ),
        ],
      ),
    );
  }
}
