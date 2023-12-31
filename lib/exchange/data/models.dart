class Currency {
  final String key;
  final String name;
  final double exchange;
  final int? timestamp;

  Currency(this.key, this.name, this.exchange, this.timestamp);

  factory Currency.fromMap(Map<String, dynamic> map) =>
      Currency(map['key'], map['name'], map['exchange'], map['timestamp']);
}

class CurrentCurrencies {
  final int timestamp;
  final List<Currency> currencies;
  CurrentCurrencies(this.timestamp, this.currencies);

  factory CurrentCurrencies.fromMap(Map<String, dynamic> map) {
    final List<dynamic> currencies = map['currencies'];
    return  CurrentCurrencies(
        map['timestamp'],
        currencies.map((el) => Currency.fromMap(el)).toList(growable: false)
    );
  }

}