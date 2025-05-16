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

import 'package:flutter_markdown/flutter_markdown.dart'; // Importing flutter_markdown

class TextBold extends StatefulWidget {
  const TextBold({
    super.key,
    this.width,
    this.height,
    this.message,
  });

  final double? width;
  final double? height;
  final String? message;

  @override
  State<TextBold> createState() => _TextBoldState();
}

class _TextBoldState extends State<TextBold> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: MarkdownBody(
        data: widget.message ?? '',
        selectable: true, // Making text selectable
        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
          p: TextStyle(
            fontFamily: FlutterFlowTheme.of(context)
                .bodyText1
                .fontFamily, // Use bodyText1 fontFamily directly
            fontSize: 14, // Font size 14
            fontWeight: FontWeight.w400, // Font weight 400
            color: Color(0xFF3D4F43), // Hex color 3D4F43
            fontStyle: FontStyle.italic, // Italic text
          ),
        ),
      ),
    );
  }
}
