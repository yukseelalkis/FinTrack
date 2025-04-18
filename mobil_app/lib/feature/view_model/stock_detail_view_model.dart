import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/commentPostModel.dart';
import 'package:mobil_app/feature/model/stockDetailModel.dart';
import 'package:mobil_app/feature/service/comment_service.dart';
import 'package:mobil_app/feature/service/stock_detail_service.dart';
import 'package:mobil_app/feature/view/stock_detail_view.dart';
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
      setState(() {
        stockDetailItems = fetchDetailItems;
      });
    } catch (e) {
      SnackbarHelper.showError(context, 'Veriler alınırken bir hata oluştu.');
    }
  }

  Future<void> addComment() async {
    if (!formKey.currentState!.validate()) return;

    final comment = CommentPostModel(
      title: titleController.text.trim(),
      content: commentController.text.trim(),
      stockId: widget.stockItem.id!,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('user_token') ?? '';

    if (token.isEmpty) {
      SnackbarHelper.showError(
          context, "Oturum bulunamadı. Lütfen tekrar giriş yapın.");
      return;
    }

    final isSuccess = await commentService.postComment(
      symbol: widget.stockItem.symbol,
      comment: comment,
      token: token,
    );

    if (isSuccess) {
      setState(() {
        commentController.clear();
        titleController.clear();
        showCommentForm = false;
      });
      SnackbarHelper.showSuccess(context, "Yorum başarıyla gönderildi");
      fetchGetStockSymbol(widget.stockItem.symbol);
    } else {
      SnackbarHelper.showError(context, "Yorum gönderilemedi");
    }
  }
}
