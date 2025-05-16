import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'prompt_leaderboard_model.dart';
export 'prompt_leaderboard_model.dart';

class PromptLeaderboardWidget extends StatefulWidget {
  const PromptLeaderboardWidget({super.key});

  @override
  State<PromptLeaderboardWidget> createState() =>
      _PromptLeaderboardWidgetState();
}

class _PromptLeaderboardWidgetState extends State<PromptLeaderboardWidget> {
  late PromptLeaderboardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PromptLeaderboardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'You can also view the top 10 recyclers in your community here — we\'re excited to see your name on the list! \n\nWe hope you enjoy using Ecommunity.ph',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.karla(
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                fontSize: 16.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
        ),
      ),
    );
  }
}
