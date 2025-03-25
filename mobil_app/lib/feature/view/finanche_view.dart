import 'package:flutter/material.dart';
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
        appBar: AppBar(
          title: const Text("Finanche page"),
        ),
        body: Container(
          height: context.height,
          width: context.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromRGBO(245, 106, 72, 1),
                Color.fromRGBO(251, 212, 177, 1)
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: context.height * 0.6,
                width: context.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
              )
            ],
          ),
        ));
  }
}
