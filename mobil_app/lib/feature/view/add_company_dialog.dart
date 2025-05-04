import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view_model/add_company_view_model.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';
import 'package:mobil_app/product/utilitiy/helper/snackbar_helper.dart';

part '../part_of_view/add_company_dialog_part.dart';

class AddCompanyDialog extends StatefulWidget {
  final VoidCallback? onCompanyAdded;

  const AddCompanyDialog({super.key, this.onCompanyAdded});

  @override
  State<AddCompanyDialog> createState() => _AddCompanyDialogState();
}

class _AddCompanyDialogState extends AddCompanyViewModel {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: AppStyles.addCompanyDialogBorder,
      title: const Text(ProjectItemsString.addCompany),
      content: _AddCompanyTextField(textController: textController),
      actions: const [
        _AddCompanyCancelButton(),
        _AddCompanySaveButton(),
      ],
    );
  }
}