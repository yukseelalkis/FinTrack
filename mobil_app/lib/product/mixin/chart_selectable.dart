import 'package:mobil_app/product/utilitiy/enum/coin_chart_enum.dart';

mixin ChartSelectable {
  int selectedDay = 7;
  final List<int> dayOptions = [7, 15, 30];

  void onDaySelected(int day, void Function() fetchCallback) {
    if (selectedDay == day) return;
    selectedDay = day;
    fetchCallback();
  }

  CoinChartPath get selectedChartPath {
    return switch (selectedDay) {
      7 => CoinChartPath.day7,
      15 => CoinChartPath.day15,
      30 => CoinChartPath.day30,
      _ => CoinChartPath.day7,
    };
  }
}
