import 'package:flutter/material.dart';

class ScaleOnHover extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    bool hover,
  ) builder;

  ScaleOnHover({Key key, this.builder}) : super(key: key);
  @override
  _ScaleOnHoverState createState() => _ScaleOnHoverState();
}

class _ScaleOnHoverState extends State<ScaleOnHover> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (e) => _mouseEnter(true),
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: widget.builder(context, _hovering),
    );
    // return widget.builder(context, _hovering);
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
