import '/contacto/componente_chat/componente_chat_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_detalles_widget.dart' show ChatDetallesWidget;
import 'package:flutter/material.dart';

class ChatDetallesModel extends FlutterFlowModel<ChatDetallesWidget> {
  ///  Local state fields for this page.

  List<String> cargaimagnes = [];
  void addToCargaimagnes(String item) => cargaimagnes.add(item);
  void removeFromCargaimagnes(String item) => cargaimagnes.remove(item);
  void removeAtIndexFromCargaimagnes(int index) => cargaimagnes.removeAt(index);
  void insertAtIndexInCargaimagnes(int index, String item) =>
      cargaimagnes.insert(index, item);
  void updateCargaimagnesAtIndex(int index, Function(String) updateFn) =>
      cargaimagnes[index] = updateFn(cargaimagnes[index]);

  List<DocumentReference> ultimoMensajeVistoPor = [];
  void addToUltimoMensajeVistoPor(DocumentReference item) =>
      ultimoMensajeVistoPor.add(item);
  void removeFromUltimoMensajeVistoPor(DocumentReference item) =>
      ultimoMensajeVistoPor.remove(item);
  void removeAtIndexFromUltimoMensajeVistoPor(int index) =>
      ultimoMensajeVistoPor.removeAt(index);
  void insertAtIndexInUltimoMensajeVistoPor(
          int index, DocumentReference item) =>
      ultimoMensajeVistoPor.insert(index, item);
  void updateUltimoMensajeVistoPorAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      ultimoMensajeVistoPor[index] = updateFn(ultimoMensajeVistoPor[index]);

  ///  State fields for stateful widgets in this page.

  // Model for ComponenteChat component.
  late ComponenteChatModel componenteChatModel;

  @override
  void initState(BuildContext context) {
    componenteChatModel = createModel(context, () => ComponenteChatModel());
  }

  @override
  void dispose() {
    componenteChatModel.dispose();
  }
}
