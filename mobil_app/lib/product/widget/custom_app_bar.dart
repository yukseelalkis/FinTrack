import 'package:flutter/material.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarColor, // ya da istediğin renk
      elevation: 10,
      centerTitle: true,
      title: SizedBox(
        height: 70,
        child: Image.asset(
          'assets/png/logo.png',
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
