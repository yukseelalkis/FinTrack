import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:mobil_app/feature/view_model/fee_mixin.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';

part '../part_of_view/payment_view_part.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> with FeeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Klavye açılınca ekran kayar
      body: SingleChildScrollView(
        padding: const PagePadding.all(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// Kart Görseli
            Padding(
              padding: const PagePadding.xOnlyTop(),
              child: _CrediCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                isCvvFocused: isCvvFocused,
              ),
            ),

            /// Kart Bilgileri Formu
            CreditCardForm(
                formKey: formKey,
                obscureCvv: true,
                obscureNumber: true,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: onCreditCardModelChange,
                inputConfiguration: AppStyles.creditCardInputDecoration),

            /// Validate Butonu
            ValidateButton(onPressed: onValidate),
          ],
        ),
      ),
    );
  }
}
