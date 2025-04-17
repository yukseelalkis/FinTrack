import 'package:intl/intl.dart';

mixin FormatDate {
  String formatLastUpdated(String? lastUpdated) {
    if (lastUpdated == null) return 'Updated: Unknown';

    final DateTime? parsedDate = DateTime.tryParse(lastUpdated);
    if (parsedDate == null) return 'Updated: Unknown';

    final String formatted = DateFormat('dd-MM-yyyy HH:mm').format(parsedDate);
    return 'Updated: $formatted';
  }

  String formatDate(String? date) {
    if (date == null) return '';
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd.MM.yyyy HH:mm').format(parsedDate);
    } catch (e) {
      return '';
    }
  }
}
