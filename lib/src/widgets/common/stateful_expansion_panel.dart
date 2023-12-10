import 'package:comments_app/src/utils/extensions.dart';
import 'package:flutter/material.dart';

class _ExpansionPanelState extends State<StatefulExpansionPanel> {
  final Map<int, bool> expanded = {};
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            final func = widget.onExpansion;
            if(func != null) {
              func(index, isExpanded);
            }
            setState(() {
              expanded[index] = isExpanded;
            });
          },
          children: widget.childCount.mapUntil<ExpansionPanel>((index) {
            return ExpansionPanel(
                headerBuilder: (_, isExpanded) => widget.headerBuilder(index, isExpanded),
                body: widget.bodyBuilder(index, expanded[index] ?? false),
                isExpanded: expanded[index] ?? false
            );
          })
      ),
    );
  }
}

class StatefulExpansionPanel extends StatefulWidget {
  final Widget Function(int index, bool isExpanded) headerBuilder;
  final Widget Function(int index, bool isExpanded) bodyBuilder;
  final void Function(int index, bool isExpanded)? onExpansion;
  final int childCount;

  const StatefulExpansionPanel({super.key, required this.headerBuilder, required this.bodyBuilder, required this.childCount, this.onExpansion});

  @override
  State<StatefulWidget> createState() => _ExpansionPanelState();
}