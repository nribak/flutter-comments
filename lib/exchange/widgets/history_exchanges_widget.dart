import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/exchange/blocs/history_bloc.dart';
import 'package:learning_flutter/exchange/widgets/history_exchanges_item_widget.dart';

class HistoryExchangeWidget extends StatelessWidget {
  final String currencyKey;
  final HistoryBloc bloc = HistoryBloc.newInstance();
  HistoryExchangeWidget({super.key, required this.currencyKey}) {
    bloc.add(HistoryBlocEvent(currencyKey));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(currencyKey),
        ),
        body: BlocBuilder<HistoryBloc, HistoryBlocState>(
            bloc: bloc,
            builder: (context, snapshot) =>
                ListView.builder(
                    itemBuilder: (context, index) =>
                        HistoryExchangeItemWidget(currency: snapshot.data[index]),
                    itemCount: snapshot.data.length
                )
        )
    );
  }
}