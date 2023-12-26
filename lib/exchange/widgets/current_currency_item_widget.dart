import 'package:flutter/material.dart';
import 'package:learning_flutter/exchange/data/models.dart';
import 'package:learning_flutter/types.dart';

class CurrentCurrencyItemWidget extends StatelessWidget {
  final Currency currency;
  final Callback<String> callback;
  const CurrentCurrencyItemWidget({super.key, required this.currency, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => callback(currency.key),
      title: Text(currency.name),
      subtitle: Text(currency.exchange.toStringAsFixed(2)),
    );
  }
}