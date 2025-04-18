import 'package:flutter/material.dart';
import 'package:mobil_app/feature/mixin/format_date.dart';
import 'package:mobil_app/feature/model/stockDetailModel.dart';
import 'package:mobil_app/feature/model/stockModel.dart';
import 'package:mobil_app/feature/view/payment_view.dart';
import 'package:mobil_app/feature/view_model/stock_detail_view_model.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/helper/navigator_helper.dart';
part 'stock_detail_part.dart';

class StockDetail extends StatefulWidget {
  final StockModel stockItem;

  const StockDetail({super.key, required this.stockItem});

  @override
  State<StockDetail> createState() => _StockDetailState();
}

class _StockDetailState extends StockDetailViewModel with FormatDate {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.stockItem.symbol)),
      body: Column(
        children: [
          Expanded(
            child: stockDetailItems == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      for (var item in stockDetailItems!)
                        Padding(
                          padding: const PagePadding.all(),
                          child: Column(
                            children: [
                              /// Sirket karttlari
                              ///  sirket bilgileri vs gelmekte
                              _StockInfoCard(item: item),
                              const Padding(
                                padding: PagePadding.all(),
                                child: Text(ProjectItemsString.comments,
                                    style: TextStyle(
                                        color: AppColors.greenColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                              if (item.comments != null &&
                                  item.comments!.isNotEmpty)
                                ...item.comments!.map((comment) {
                                  return _CommentTile(
                                    title: comment.title ?? '',
                                    username: comment.appuser?.userName ??
                                        ProjectItemsString.defaultUsername,
                                    content: comment.content ?? '',
                                    date: formatDate(comment.createOn),
                                  );
                                })
                            ],
                          ),
                        ),
                      if (showCommentForm)
                        _CommentForm(
                          formKey: formKey,
                          titleController: titleController,
                          commentController: commentController,
                          onSubmit: addComment,
                        ),
                    ],
                  ),
          ),
          const _CommentActionButtons(),
        ],
      ),
    );
  }
}
