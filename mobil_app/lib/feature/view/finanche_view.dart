import 'package:flutter/material.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';
import 'package:mobil_app/product/utilitiy/extensions/context_extension.dart';

class FinancheView extends StatefulWidget {
  const FinancheView({super.key});

  @override
  State<FinancheView> createState() => _FinancheViewState();
}

class _FinancheViewState extends State<FinancheView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: context.width,
        height: context.height,
        decoration: AppStyles.backRoundDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Üst Bilgi
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.02,
                  vertical: context.height * 0.005,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Main portfolio',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const Padding(
              padding: PagePadding.all(),
              child: Text(
                '\$ 7,466.20',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkColor,
                ),
              ),
            ),

            /// Alt Alan
            Expanded(
              child: Container(
                width: context.width,
                decoration: AppStyles.frontRoundDecoration,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add)),
                      ),

                      /// Hisse Listesi
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              leading: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.deepPurple.shade100,
                                child: const Text(
                                  'AAPL',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              title: const Text(
                                'Apple Inc.',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: const Text(
                                'Technology Company',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                              trailing: const Text(
                                '\$22,993.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green,
                                  fontSize: 13,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              tileColor: Colors.white,
                              dense: true,
                              visualDensity: VisualDensity.compact,
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Crypto Para Piyasası',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 8),

                      SizedBox(
                        height: 130,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            /// Bitcoin
                            _cryptoCard(
                              name: 'Bitcoin',
                              price: '\$67.02',
                              change: '+0.44%',
                              icon: Icons.currency_bitcoin,
                              iconColor: Colors.orange,
                              bgColor: Colors.orange.shade100,
                              changeColor: Colors.green,
                            ),

                            /// Ethereum
                            _cryptoCard(
                              name: 'Ethereum',
                              price: '\$1822.21',
                              change: '+1.61%',
                              icon: Icons.token,
                              iconColor: Colors.purple,
                              bgColor: Colors.purple.shade100,
                              changeColor: Colors.green,
                            ),

                            /// Tether
                            _cryptoCard(
                              name: 'Tether',
                              price: '\$1.00',
                              change: '-0.01%',
                              icon: Icons.attach_money,
                              iconColor: Colors.teal,
                              bgColor: Colors.teal.shade100,
                              changeColor: Colors.red,
                            ),

                            /// + Ekle Butonu
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: InkWell(
                                onTap: () {
                                  // işlem burada yapılabilir
                                },
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(12),
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.add,
                                        size: 30, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Kart yapısı
  Widget _cryptoCard({
    required String name,
    required String price,
    required String change,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required Color changeColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: bgColor,
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(height: 8),
            Text(
              name.toLowerCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Text(
              price,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              change,
              style: TextStyle(
                fontSize: 12,
                color: changeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
