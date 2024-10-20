import '/flutter_flow/flutter_flow_util.dart';
import 'frogot_password_widget.dart' show FrogotPasswordWidget;
import 'package:flutter/material.dart';

class FrogotPasswordModel extends FlutterFlowModel<FrogotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();
  }
}
