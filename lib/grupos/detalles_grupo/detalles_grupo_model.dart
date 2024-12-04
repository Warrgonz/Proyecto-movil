import '/flutter_flow/flutter_flow_util.dart';
import 'detalles_grupo_widget.dart' show DetallesGrupoWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DetallesGrupoModel extends FlutterFlowModel<DetallesGrupoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
