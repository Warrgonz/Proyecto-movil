import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for crearNombre widget.
  FocusNode? crearNombreFocusNode;
  TextEditingController? crearNombreTextController;
  String? Function(BuildContext, String?)? crearNombreTextControllerValidator;
  // State field(s) for crearApellido widget.
  FocusNode? crearApellidoFocusNode;
  TextEditingController? crearApellidoTextController;
  String? Function(BuildContext, String?)? crearApellidoTextControllerValidator;
  // State field(s) for crearCorreo widget.
  FocusNode? crearCorreoFocusNode;
  TextEditingController? crearCorreoTextController;
  String? Function(BuildContext, String?)? crearCorreoTextControllerValidator;
  // State field(s) for crearContrasena widget.
  FocusNode? crearContrasenaFocusNode;
  TextEditingController? crearContrasenaTextController;
  String? Function(BuildContext, String?)?
      crearContrasenaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    crearNombreFocusNode?.dispose();
    crearNombreTextController?.dispose();

    crearApellidoFocusNode?.dispose();
    crearApellidoTextController?.dispose();

    crearCorreoFocusNode?.dispose();
    crearCorreoTextController?.dispose();

    crearContrasenaFocusNode?.dispose();
    crearContrasenaTextController?.dispose();
  }
}
