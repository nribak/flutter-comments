import 'package:bloc/bloc.dart';
import 'package:learning_flutter/exchange/data/models.dart';
import 'package:learning_flutter/exchange/di/di_injector.dart';

import '../data/exchange_repository.dart';

class HistoryBlocState {
  final List<Currency> data;
  HistoryBlocState(this.data);

  HistoryBlocState append(Currency currency) {
    final currencies = data;
    currencies.add(currency);
    return HistoryBlocState(currencies);
  }
}

class HistoryBlocEvent {
  final String key;
  HistoryBlocEvent(this.key);
}

class HistoryBloc extends Bloc<HistoryBlocEvent, HistoryBlocState> {
  final ExchangeRepository repository;
  HistoryBloc({required this.repository}): super(HistoryBlocState([]));

  void _init() {
    on<HistoryBlocEvent>((event, emit) async {
      final stream = repository.getHistoryCurrencies(event.key);
      await emit.forEach(
          stream,
          onData: (data) => state.append(data)
      );
    });
  }


  factory HistoryBloc.newInstance() {
    final bloc = HistoryBloc(repository: Injector.instance().repository);
    bloc._init();
    return bloc;
  }
}