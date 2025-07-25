import '/backend/schema/structs/index.dart';
import '/components/groq_key_widget.dart';
import '/components/model_selector_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'demo_widget.dart' show DemoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DemoModel extends FlutterFlowModel<DemoWidget> {
  ///  Local state fields for this page.

  String? modelSelected;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButton widget.
  String? groqUserEntry;
  // Model for ModelSelector component.
  late ModelSelectorModel modelSelectorModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - sendGroqMessage] action in IconButton widget.
  String? groqResponse;

  @override
  void initState(BuildContext context) {
    modelSelectorModel = createModel(context, () => ModelSelectorModel());
  }

  @override
  void dispose() {
    modelSelectorModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
