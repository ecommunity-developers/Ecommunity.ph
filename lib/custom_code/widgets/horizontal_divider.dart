// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class HorizontalDivider extends StatefulWidget {
  const HorizontalDivider({
    Key? key,
    this.thickness,
    this.color,
    this.indent,
    this.endIndent,
  }) : super(key: key);

  final double? thickness;
  final Color? color;
  final double? indent;
  final double? endIndent;

  @override
  _HorizontalDividerState createState() => _HorizontalDividerState();
}

class _HorizontalDividerState extends State<HorizontalDivider> {
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: widget.thickness ?? 1.0,
      color: widget.color ?? Colors.black,
      indent: widget.indent ?? 0.0,
      endIndent: widget.endIndent ?? 0.0,
    );
  }
}
