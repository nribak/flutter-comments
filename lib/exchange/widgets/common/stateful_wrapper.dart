import 'package:flutter/material.dart';

class StatefulWrapper extends StatefulWidget {
  final Widget _child;
  final void Function()? _onStart;
  final void Function()? _onStop;
  const StatefulWrapper({super.key, required Widget child, void Function()? onStart, void Function()? onStop}):
        _child = child, _onStart = onStart, _onStop = onStop;

  @override
  State<StatefulWidget> createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {

  @override
  void initState() {
    super.initState();
    final func = widget._onStart;
    if(func != null) {
      func();
    }
  }

  @override
  void dispose() {
    super.dispose();
    final func = widget._onStop;
    if(func != null) {
      func();
    }
  }

  @override
  Widget build(BuildContext context) => widget._child;
}