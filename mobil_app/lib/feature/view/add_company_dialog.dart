import 'package:flutter/material.dart';
import 'package:mobil_app/feature/view_model/add_company_view_model.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/helper/snackbar_helper.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text(ProjectItemsString.addCompany),
      content: TextField(
        controller: textController,
        textCapitalization: TextCapitalization.characters,
        decoration: const InputDecoration(
          labelText: ProjectItemsString.addCompantLabelText,
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(ProjectItemsString.cancelButton),
        ),
        ElevatedButton(
          onPressed: () async {
            final symbol = textController.text.trim().toUpperCase();
            if (symbol.isEmpty) return;

            final result = await addSymbol(symbol);

            if (!mounted) return; // ✅ tüm context kullanımı öncesi kontrol

            if (result) {
              if (!mounted) return; // 🔁 tekrar güvenli hale getir
              SnackbarHelper.showSuccess(context, '$symbol başarıyla eklendi');
              widget.onCompanyAdded?.call();
            } else {
              if (!mounted) return;
              SnackbarHelper.showError(
                  context, '$symbol eklenemedi. Tekrar deneyin.');
            }

            if (mounted) Navigator.of(context).pop(); // ✅ tekrar kontrol
          },
          child: const Text(ProjectItemsString.saveButton),
        ),
      ],
    );
  }
}
