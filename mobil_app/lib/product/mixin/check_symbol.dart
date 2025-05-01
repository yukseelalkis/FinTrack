// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:mobil_app/feature/view_model/add_company_view_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:mobil_app/feature/service/add_service.dart';
// import 'package:mobil_app/product/init/language/project_items_string.dart';
// import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';
// import 'package:mobil_app/product/utilitiy/helper/snackbar_helper.dart';

// mixin AddComopanyMixin on AddCompanyViewModel {
//   Future<bool> tryAddSymbol(String symbol) async {
//     final dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
//     final addService = AddService(dio);

//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('user_token') ?? '';

//       if (token.isEmpty) {
//         if (!mounted) return false;
//         SnackbarHelper.showError(context, ProjectItemsString.sessionNotFound);
//         return false;
//       }

//       final result = await addService.postSymbolStock(
//         symbol: symbol,
//         token: token,
//       );

//       return result;
//     } catch (e) {
//       debugPrint('Şirket ekleme hatası: $e');
//       return false;
//     }
//   }
// }
