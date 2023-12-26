import 'package:flutter/material.dart';
import 'package:learning_flutter/exchange/data/models.dart';

class HistoryExchangeItemWidget extends StatelessWidget {
  final Currency currency;

  const HistoryExchangeItemWidget({super.key, required this.currency});
  String _time() {
    final date = DateTime.fromMillisecondsSinceEpoch(currency.timestamp ?? 0);
    return "${date.day}/${date.month}/${date.year}  ${date.hour}:${date.minute}:${date.second}.${date.millisecond}";
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_time()),
      subtitle: Text(currency.exchange.toStringAsFixed(2)),
    );
  }
}