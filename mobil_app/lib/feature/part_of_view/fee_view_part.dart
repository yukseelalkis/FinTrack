part of '../view/fee_view.dart';

class _CrediCardWidget extends StatelessWidget {
  const _CrediCardWidget({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.isCvvFocused,
  });

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isCvvFocused;

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      cardBgColor: AppColors.greenColor,
      showBackView: isCvvFocused,
      obscureCardNumber: true,
      obscureCardCvv: true,
      isHolderNameVisible: true,
      isSwipeGestureEnabled: true,
      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
    );
  }
}

class ValidateButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ValidateButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          onPressed: onPressed,
          child: const Text(ProjectItemsString.validateButton),
        ),
      ),
    );
  }
}
