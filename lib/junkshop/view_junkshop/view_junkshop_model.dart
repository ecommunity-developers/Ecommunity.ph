import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'view_junkshop_widget.dart' show ViewJunkshopWidget;
import 'package:flutter/material.dart';

class ViewJunkshopModel extends FlutterFlowModel<ViewJunkshopWidget> {
  ///  Local state fields for this page.

  bool editable = false;

  bool isPlasticTextVisible = false;

  bool isPaperTextVisible = false;

  bool isGlassTextVisible = false;

  bool isEWasteTextVisible = false;

  bool isMetalTextVisible = false;

  bool isOthersTextVisible = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
