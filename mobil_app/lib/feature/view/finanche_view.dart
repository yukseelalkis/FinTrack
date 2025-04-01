import 'package:flutter/material.dart';
import 'package:mobil_app/feature/mixin/list_tile_mixin.dart';
import 'package:mobil_app/feature/view_model/finanche_view_model.dart';

class FinancheView extends StatefulWidget {
  const FinancheView({super.key});

  @override
  State<FinancheView> createState() => _FinancheViewState();
}

class _FinancheViewState extends FinancheViewModel with CommandListTileMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Finanche Page'),
        ),
        body: SingleChildScrollView(
          child: buildCommonList(stockItems),
        ));
  }
}
