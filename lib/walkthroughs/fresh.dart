import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthrough_components/prompt_collection_date/prompt_collection_date_widget.dart';
import '/walkthrough_components/prompt_schedules/prompt_schedules_widget.dart';
import '/walkthrough_components/prompt_junkshop/prompt_junkshop_widget.dart';
import '/walkthrough_components/prompt_eco_reports/prompt_eco_reports_widget.dart';
import '/walkthrough_components/prompt_leaderboard/prompt_leaderboard_widget.dart';

// Focus widget keys for this walkthrough
final container9i2ilxfj = GlobalKey();
final containerXkqkq8gl = GlobalKey();
final containerHj0ckidk = GlobalKey();
final containerE9tp6pza = GlobalKey();
final columnCm96y4hw = GlobalKey();

/// fresh
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: container9i2ilxfj,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => PromptCollectionDateWidget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: containerXkqkq8gl,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => PromptSchedulesWidget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: containerHj0ckidk,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => PromptJunkshopWidget(),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: containerE9tp6pza,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => PromptEcoReportsWidget(),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: columnCm96y4hw,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => PromptLeaderboardWidget(),
          ),
        ],
      ),
    ];
