import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snekers_shop/model/shoe_model.dart';
import 'package:snekers_shop/provider/cart_provider.dart';
import 'package:snekers_shop/screen/utils/constants/colors.dart';
import 'package:snekers_shop/screen/utils/helpers/helper_function.dart';

class ShoeCard extends StatelessWidget {
  final ShoeModel shoe;

  const ShoeCard({super.key, required this.shoe});

  void addShoeToCart(ShoeModel shoeItem, BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).adaItemToCart(shoeItem);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Successfully Added!',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(
          'Check your cart',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: HelperFunction.isDarkMode(context)
            ? AppColors.secondaryDark
            : AppColors.secondaryLight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Container(
        width: 277, // Width for each item card
        height: 450, // Height for each item card
        decoration: BoxDecoration(
          color: HelperFunction.isDarkMode(context)
              ? AppColors.secondaryDark
              : AppColors.secondaryLight,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Image.asset(
              shoe.imageUrl,
              height: 177,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                shoe.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: HelperFunction.isDarkMode(context)
                    ? Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.lightTextSecondary,
                      )
                    : Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.darkTextSecondary,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoe.name,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${shoe.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: HelperFunction.isDarkMode(context)
                              ? AppColors.lightTextSecondary
                              : AppColors.darkTextSecondary,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => addShoeToCart(shoe, context),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: HelperFunction.isDarkMode(context)
                            ? AppColors.light
                            : AppColors.dark,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: HelperFunction.isDarkMode(context)
                            ? AppColors.dark
                            : AppColors.light,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
