import '/flutter_flow/flutter_flow_util.dart';
import 'nuevo_anuncio_parroquial_widget.dart' show NuevoAnuncioParroquialWidget;
import 'package:flutter/material.dart';

class NuevoAnuncioParroquialModel
    extends FlutterFlowModel<NuevoAnuncioParroquialWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for FechaEvento widget.
  FocusNode? fechaEventoFocusNode;
  TextEditingController? fechaEventoTextController;
  String? Function(BuildContext, String?)? fechaEventoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    fechaEventoFocusNode?.dispose();
    fechaEventoTextController?.dispose();
  }
}
