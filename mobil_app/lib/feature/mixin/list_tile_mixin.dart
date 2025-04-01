import 'package:flutter/material.dart';
import 'package:mobil_app/product/widget/list_tile.dart';

/// kripyto yada finans icin lsite getirecek
mixin CommandListTileMixin {
  Widget buildCommonList(List<dynamic>? items) {
    if (items != null && items.isNotEmpty) {
      return ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return CommonListTile(item: items[index]);
        },
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
