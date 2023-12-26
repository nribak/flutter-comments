import 'package:bloc/bloc.dart';
import 'package:learning_flutter/exchange/data/api_provider.dart';
import 'package:learning_flutter/exchange/data/local_storage_provider.dart';
import 'package:learning_flutter/exchange/data/models.dart';

import '../data/exchange_repository.dart';

sealed class FxEvent {}
final class FxStartEvent extends FxEvent {}
final class FxStopEvent extends FxEvent {}

const interval = 1 ;

class FxState {
  final CurrentCurrencies? currencies;
  final bool running;
  FxState({required this.currencies, required this.running});
}

class FxBloc extends Bloc<FxEvent, FxState> {
  final ExchangeRepository repo;

  FxBloc(this.repo): super(FxState(currencies: null, running: false));


  void _init() {
    on<FxStartEvent>((event, emit) async {
      emit(FxState(currencies: null, running: true));
      final stream = repo.listenForCurrenciesEvery(interval, () => state.running);
      await emit.forEach(stream,
          onData: (data)  {
            return FxState(currencies: data, running: true);
          });
    });
    on<FxStopEvent>((event, emit) {
      emit(FxState(currencies: state.currencies, running: false));
    });
  }



  factory FxBloc.newInstance() {
    final bloc = FxBloc(ExchangeRepository(apiProvider: APIProvider(), localStorageProvider: LocalStorageProvider()));
    bloc._init();
    return bloc;
  }
}