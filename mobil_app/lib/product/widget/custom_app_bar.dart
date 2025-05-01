import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view/add_company_dialog.dart';
import 'package:mobil_app/product/widget/get_logo.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onCompanyAdded; // 🔥 Burada parametre eklendi

  const CustomAppBar({super.key, this.onCompanyAdded});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarColor,
      elevation: 10,
      centerTitle: true,
      title: const SizedBox(
        height: 70,
        child: GetLogo(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) =>
                  AddCompanyDialog(onCompanyAdded: onCompanyAdded),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
