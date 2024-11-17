import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bandeja_entrada_widget.dart' show BandejaEntradaWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BandejaEntradaModel extends FlutterFlowModel<BandejaEntradaWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> listaMiembros = [];
  void addToListaMiembros(DocumentReference item) => listaMiembros.add(item);
  void removeFromListaMiembros(DocumentReference item) =>
      listaMiembros.remove(item);
  void removeAtIndexFromListaMiembros(int index) =>
      listaMiembros.removeAt(index);
  void insertAtIndexInListaMiembros(int index, DocumentReference item) =>
      listaMiembros.insert(index, item);
  void updateListaMiembrosAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listaMiembros[index] = updateFn(listaMiembros[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, UsersRecord>? listViewPagingController;
  Query? listViewPagingQuery;

  // State field(s) for CheckboxListTile widget.
  Map<UsersRecord, bool> checkboxListTileValueMap = {};
  List<UsersRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatRecord? chaActualizado;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatRecord? nuevaConversacion;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, UsersRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, UsersRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, UsersRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryUsersRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 16,
          isStream: false,
        ),
      );
  }
}
