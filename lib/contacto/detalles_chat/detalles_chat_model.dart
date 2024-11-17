import '/contacto/eliminar_chat/eliminar_chat_widget.dart';
import '/contacto/usuariolista/usuariolista_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detalles_chat_widget.dart' show DetallesChatWidget;
import 'package:flutter/material.dart';

class DetallesChatModel extends FlutterFlowModel<DetallesChatWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for Usuariolista dynamic component.
  late FlutterFlowDynamicModels<UsuariolistaModel> usuariolistaModels;
  // Model for Eliminar_Chat component.
  late EliminarChatModel eliminarChatModel;

  @override
  void initState(BuildContext context) {
    usuariolistaModels = FlutterFlowDynamicModels(() => UsuariolistaModel());
    eliminarChatModel = createModel(context, () => EliminarChatModel());
  }

  @override
  void dispose() {
    usuariolistaModels.dispose();
    eliminarChatModel.dispose();
  }
}
