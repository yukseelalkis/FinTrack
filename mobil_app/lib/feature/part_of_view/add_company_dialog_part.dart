part of '../view/add_company_dialog.dart';

class _AddCompanyTextField extends StatelessWidget {
  const _AddCompanyTextField({
    required this.textController,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      textCapitalization: TextCapitalization.characters,
      decoration: const InputDecoration(
        labelText: ProjectItemsString.addCompantLabelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _AddCompanyCancelButton extends StatelessWidget {
  const _AddCompanyCancelButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Text(ProjectItemsString.cancelButton),
    );
  }
}

class _AddCompanySaveButton extends StatelessWidget {
  const _AddCompanySaveButton();

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_AddCompanyDialogState>();
    if (state == null) return const SizedBox.shrink();

    return ElevatedButton(
      onPressed: () {
        final symbol = state.textController.text.trim().toUpperCase();
        if (symbol.isEmpty) return;

        _handleSave(state, symbol);
      },
      child: const Text(ProjectItemsString.saveButton),
    );
  }

  Future<void> _handleSave(_AddCompanyDialogState state, String symbol) async {
    final result = await state.addSymbol(symbol);

    if (!state.mounted) return;

    if (result) {
      SnackbarHelper.showSuccess(state.context, '$symbol başarıyla eklendi');
      state.widget.onCompanyAdded?.call();
    } else {
      SnackbarHelper.showError(
          state.context, '$symbol eklenemedi. Tekrar deneyin.');
    }

    if (state.mounted) Navigator.of(state.context).pop();
  }
}
