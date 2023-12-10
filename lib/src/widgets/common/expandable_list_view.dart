import 'package:comments_app/src/utils/extensions.dart';
import 'package:flutter/material.dart';

class ExpandableListViewCompoundElement<T> {
  final T item;
  List<T> children;
  ExpandableListViewCompoundElement(this.item, [List<T>? children]) : children = children ?? [];
}

class ExpandableListView<E> extends StatelessWidget {
  final List<ExpandableListViewCompoundElement<E>> list;
  final Widget Function(BuildContext context, E item) headerBuilder;
  final void Function(E item, bool expand) ? expansionFunction;

  const ExpandableListView({super.key, required this.list, required this.headerBuilder, this.expansionFunction});

  Widget _buildList(BuildContext context, ExpandableListViewCompoundElement<E> element) {
    final header = headerBuilder(context, element.item);
    return ExpansionTile(
        title: header,
        onExpansionChanged: (expand) {
          final function = expansionFunction;
          if(function != null) {
            function(element.item, expand);
          }
        },
        children: element.children.fixedListMap((child) => _buildList(context, ExpandableListViewCompoundElement(child)))
    );

    // if(element.children.isEmpty) {
    //   return Builder(builder: (context) => ListTile(title: header));
    // } else {
    // return Builder(builder: (context) =>
    //     ExpansionTile(
    //         title: header,
    //         onExpansionChanged: (expand) {
    //           final function = expansionFunction;
    //           if(function != null) {
    //             function(element.item, expand);
    //           }
    //         },
    //         children: element.children.fixedListMap((item) {
    //           final childHeader = headerBuilder(context, item);
    //           return ExpansionTile(
    //               title: childHeader
    //           );
    //         })
    //     ));
    // }
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => _buildList(context, list[index])
    );
  }
}