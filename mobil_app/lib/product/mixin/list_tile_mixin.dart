import 'package:flutter/material.dart';
import 'package:mobil_app/product/widget/custom_list_tile.dart';

/// kripyto yada finans icin lsite getirecek
// mixin CommandListTileMixin {
//   Widget buildCommonList(List<dynamic>? items) {
//     if (items != null && items.isNotEmpty) {
//       return ListView.builder(
//         itemCount: items.length,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//           return CommonListTile(item: items[index]);
//         },
//       );
//     } else {
//       return const Center(child: Text('veri yok'));
//     }
//   }
// }

mixin CommandListTileMixin {
  Widget buildCommonList({
    required List<dynamic>? items,
    required bool isLoading,
    String emptyMessage = 'Veri bulunamadı.',
  }) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

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
      return Center(
        child: Text(
          emptyMessage,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }
  }
}
