import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snekers_shop/model/shoe_model.dart';
import 'package:snekers_shop/provider/cart_provider.dart';
import 'package:snekers_shop/screen/utils/constants/colors.dart';
import 'package:snekers_shop/screen/utils/helpers/helper_function.dart';

class CartItem extends StatefulWidget {
  final ShoeModel shoe;
  const CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void deleteItemFromCart(ShoeModel shoes) {
    Provider.of<CartProvider>(context, listen: false).removeItemFromCart(shoes);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: HelperFunction.isDarkMode(context)
            ? AppColors.secondaryDark
            : AppColors.secondaryLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Image.asset(widget.shoe.imageUrl),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price.toString()),
        trailing: IconButton(
          onPressed: () => deleteItemFromCart(widget.shoe),
          icon: Icon(
            Icons.delete,
            color: HelperFunction.isDarkMode(context)
                ? AppColors.light
                : AppColors.dark,
          ),
        ),
      ),
    );
  }
}
