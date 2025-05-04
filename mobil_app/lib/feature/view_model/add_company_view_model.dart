import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/service/add_service.dart';
import 'package:mobil_app/feature/view/add_company_dialog.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';
import 'package:mobil_app/product/utilitiy/helper/snackbar_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AddCompanyViewModel extends State<AddCompanyDialog> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Future<bool> addSymbol(String symbol) async {
    final dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
    final addService = AddService(dio);

    try {
      final prefs = await SharedPreferences.getInstance();

      if (!mounted) return false; // ✅ doğru konumda

      final token = prefs.getString('user_token') ?? '';

      if (token.isEmpty) {
        SnackbarHelper.showError(context, ProjectItemsString.sessionNotFound);
        return false;
      }

      final result = await addService.postSymbolStock(
        symbol: symbol,
        token: token,
      );

      return result;
    } catch (e) {
      if (mounted) {
        SnackbarHelper.showError(context, 'Şirket ekleme hatası: $e');
      }
      return false;
    }
  }
}

