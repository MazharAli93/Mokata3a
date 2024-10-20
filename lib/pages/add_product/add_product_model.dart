import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_product_widget.dart' show AddProductWidget;
import 'package:flutter/material.dart';

class AddProductModel extends FlutterFlowModel<AddProductWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ProductNameTextField widget.
  FocusNode? productNameTextFieldFocusNode;
  TextEditingController? productNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      productNameTextFieldTextControllerValidator;
  String? _productNameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'y1ol3a3m' /* Field is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for CompanyNameTextField widget.
  FocusNode? companyNameTextFieldFocusNode;
  TextEditingController? companyNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      companyNameTextFieldTextControllerValidator;
  // State field(s) for CategoryDropDown widget.
  String? categoryDropDownValue;
  FormFieldController<String>? categoryDropDownValueController;
  // State field(s) for DescriptionTextField widget.
  FocusNode? descriptionTextFieldFocusNode;
  TextEditingController? descriptionTextFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionTextFieldTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  var barodescan = '';
  // Stores action output result for [Firestore Query - Query a collection] action in SaveButton widget.
  int? barcodeCheck;

  @override
  void initState(BuildContext context) {
    productNameTextFieldTextControllerValidator =
        _productNameTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    productNameTextFieldFocusNode?.dispose();
    productNameTextFieldTextController?.dispose();

    companyNameTextFieldFocusNode?.dispose();
    companyNameTextFieldTextController?.dispose();

    descriptionTextFieldFocusNode?.dispose();
    descriptionTextFieldTextController?.dispose();
  }
}
