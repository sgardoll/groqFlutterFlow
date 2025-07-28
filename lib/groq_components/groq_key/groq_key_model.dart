import '/flutter_flow/flutter_flow_util.dart';
import 'groq_key_widget.dart' show GroqKeyWidget;
import 'package:flutter/material.dart';

class GroqKeyModel extends FlutterFlowModel<GroqKeyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
