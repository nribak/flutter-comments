import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/exchange/blocs/fx_bloc.dart';
import 'package:learning_flutter/exchange/widgets/common/stateful_wrapper.dart';
import 'package:learning_flutter/exchange/widgets/current_currency_item_widget.dart';
import 'package:learning_flutter/exchange/widgets/history_exchanges_widget.dart';

class CurrentCurrenciesWidget extends StatelessWidget {
  final bloc = FxBloc.newInstance();
  CurrentCurrenciesWidget({super.key});

  void _onStart() {
    bloc.add(FxStartEvent());
  }

  void _onStop() {
    bloc.add(FxStopEvent());
  }

  void _navigateTo(BuildContext context, String key) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HistoryExchangeWidget(currencyKey: key))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("EX")),
        body: StatefulWrapper(
          onStart: _onStart,
          onStop: _onStop,
          child: BlocBuilder<FxBloc, FxState>(
            bloc: bloc,
            builder: (context, snapshot) =>
                ListView.separated(
                  separatorBuilder: (ctx, index) => const Divider(),
                  itemCount: snapshot.currencies?.currencies.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = snapshot.currencies!.currencies[index];
                    return CurrentCurrencyItemWidget(currency: item, callback: (key) => _navigateTo(context, key));
                  },
                )
          ),
        )
    );
  }
}