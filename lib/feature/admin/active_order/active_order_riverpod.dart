import 'package:eat_meat/feature/admin/active_order/active_order_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ActiveOrderNotifier extends StateNotifier<ActiveOrderView> {
  ActiveOrderNotifier() : super(const ActiveOrderView());
  final currentDate = DateTime.now();
  String formatTime() {
    final String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
    return formattedDate;
  }
}
