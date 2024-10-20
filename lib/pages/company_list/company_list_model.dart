import '/flutter_flow/flutter_flow_util.dart';
import 'company_list_widget.dart' show CompanyListWidget;
import 'package:flutter/material.dart';

class CompanyListModel extends FlutterFlowModel<CompanyListWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchTextField widget.
  FocusNode? searchTextFieldFocusNode;
  TextEditingController? searchTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchTextFieldFocusNode?.dispose();
    searchTextFieldTextController?.dispose();
  }
}
