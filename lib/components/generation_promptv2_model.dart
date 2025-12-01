import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'generation_promptv2_widget.dart' show GenerationPromptv2Widget;
import 'package:flutter/material.dart';

class GenerationPromptv2Model
    extends FlutterFlowModel<GenerationPromptv2Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for promptField widget.
  FocusNode? promptFieldFocusNode;
  TextEditingController? promptFieldTextController;
  String? Function(BuildContext, String?)? promptFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (GenAI image)] action in confirm widget.
  ApiCallResponse? genImageResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    promptFieldFocusNode?.dispose();
    promptFieldTextController?.dispose();
  }
}
