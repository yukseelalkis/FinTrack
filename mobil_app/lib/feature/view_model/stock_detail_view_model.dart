import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/comment_post_model.dart';
import 'package:mobil_app/feature/model/stock_detail_model.dart';
import 'package:mobil_app/feature/service/comment_service.dart';
import 'package:mobil_app/feature/service/stock_detail_service.dart';
import 'package:mobil_app/feature/view/stock_detail_view.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';
import 'package:mobil_app/product/utilitiy/helper/snackbar_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StockDetailViewModel extends State<StockDetail> {
  List<StockDetailModel>? stockDetailItems;
  bool showCommentForm = false;

  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  late final Dio dio;
  late final StockDetailService detailService;
  late final CommentService commentService;

  @override
  void initState() {
    super.initState();
    dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
    detailService = StockDetailService(dio);
    commentService = CommentService(dio);
    fetchGetStockSymbol(widget.stockItem.symbol);
  }

  Future<void> fetchGetStockSymbol(String symbol) async {
    try {
      final fetchDetailItems = await detailService
          .fetchGetSymbolDetail('${ServicePath.stockBySymbol.path}$symbol');
      if (!mounted) return;
      setState(() {
        stockDetailItems = fetchDetailItems;
      });
    } catch (e) {
      if (!mounted) return;
      SnackbarHelper.showError(context, ProjectItemsString.fetchError);
    }
  }

  Future<void> addComment() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final comment = CommentPostModel(
      title: titleController.text.trim(),
      content: commentController.text.trim(),
      stockId: widget.stockItem.id,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('user_token') ?? '';

    if (token.isEmpty) {
      if (!mounted) return;
      SnackbarHelper.showError(context, ProjectItemsString.noSessionFound);
      return;
    }

    final isSuccess = await commentService.postComment(
      symbol: widget.stockItem.symbol,
      comment: comment,
      token: token,
    );

    if (!mounted) return;

    if (isSuccess) {
      setState(() {
        commentController.clear();
        titleController.clear();
        showCommentForm = false;
      });
      SnackbarHelper.showSuccess(context, ProjectItemsString.commentSuccess);
      fetchGetStockSymbol(widget.stockItem.symbol);
    } else {
      SnackbarHelper.showError(context, ProjectItemsString.commentFailed);
    }
  }
}
