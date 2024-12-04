import '/backend/backend.dart';
import '/contacto/hilo_chat/hilo_chat_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'componente_chat_widget.dart' show ComponenteChatWidget;
import 'package:flutter/material.dart';

class ComponenteChatModel extends FlutterFlowModel<ComponenteChatWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> vistopor = [];
  void addToVistopor(DocumentReference item) => vistopor.add(item);
  void removeFromVistopor(DocumentReference item) => vistopor.remove(item);
  void removeAtIndexFromVistopor(int index) => vistopor.removeAt(index);
  void insertAtIndexInVistopor(int index, DocumentReference item) =>
      vistopor.insert(index, item);
  void updateVistoporAtIndex(int index, Function(DocumentReference) updateFn) =>
      vistopor[index] = updateFn(vistopor[index]);

  List<String> imagenesUploaded = [];
  void addToImagenesUploaded(String item) => imagenesUploaded.add(item);
  void removeFromImagenesUploaded(String item) => imagenesUploaded.remove(item);
  void removeAtIndexFromImagenesUploaded(int index) =>
      imagenesUploaded.removeAt(index);
  void insertAtIndexInImagenesUploaded(int index, String item) =>
      imagenesUploaded.insert(index, item);
  void updateImagenesUploadedAtIndex(int index, Function(String) updateFn) =>
      imagenesUploaded[index] = updateFn(imagenesUploaded[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  List<MensajesRecord>? listViewPreviousSnapshot;
  // Models for HiloChat dynamic component.
  late FlutterFlowDynamicModels<HiloChatModel> hiloChatModels;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  MensajesRecord? nuevChat;

  @override
  void initState(BuildContext context) {
    hiloChatModels = FlutterFlowDynamicModels(() => HiloChatModel());
  }

  @override
  void dispose() {
    hiloChatModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
