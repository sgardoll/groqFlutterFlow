import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/groq_components/model_selector/model_selector_widget.dart';
import 'demo_widget.dart' show DemoWidget;
import 'package:flutter/material.dart';

class DemoModel extends FlutterFlowModel<DemoWidget> {
  ///  Local state fields for this page.

  String? modelSelected;

  FFUploadedFile? uploadedImage;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButton widget.
  String? groqUserEntry;
  // Model for ModelSelector component.
  late ModelSelectorModel modelSelectorModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - sendGroqMessageAdvanced] action in IconButton widget.
  GroqResponseStruct? groqResponseAgentic;
  // Stores action output result for [Custom Action - sendGroqMessage] action in IconButton widget.
  String? groqResponseNonAgentic;
  bool isDataUploading_uploadedPhoto = false;
  FFUploadedFile uploadedLocalFile_uploadedPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]));

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
