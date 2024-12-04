import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CursoRecord extends FirestoreRecord {
  CursoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "NombreCurso" field.
  String? _nombreCurso;
  String get nombreCurso => _nombreCurso ?? '';
  bool hasNombreCurso() => _nombreCurso != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "Profesor" field.
  String? _profesor;
  String get profesor => _profesor ?? '';
  bool hasProfesor() => _profesor != null;

  // "Alumnos" field.
  List<DocumentReference>? _alumnos;
  List<DocumentReference> get alumnos => _alumnos ?? const [];
  bool hasAlumnos() => _alumnos != null;

  void _initializeFields() {
    _nombreCurso = snapshotData['NombreCurso'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _profesor = snapshotData['Profesor'] as String?;
    _alumnos = getDataList(snapshotData['Alumnos']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Curso');

  static Stream<CursoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CursoRecord.fromSnapshot(s));

  static Future<CursoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CursoRecord.fromSnapshot(s));

  static CursoRecord fromSnapshot(DocumentSnapshot snapshot) => CursoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CursoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CursoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CursoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CursoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCursoRecordData({
  String? nombreCurso,
  String? descripcion,
  String? profesor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NombreCurso': nombreCurso,
      'Descripcion': descripcion,
      'Profesor': profesor,
    }.withoutNulls,
  );

  return firestoreData;
}

class CursoRecordDocumentEquality implements Equality<CursoRecord> {
  const CursoRecordDocumentEquality();

  @override
  bool equals(CursoRecord? e1, CursoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombreCurso == e2?.nombreCurso &&
        e1?.descripcion == e2?.descripcion &&
        e1?.profesor == e2?.profesor &&
        listEquality.equals(e1?.alumnos, e2?.alumnos);
  }

  @override
  int hash(CursoRecord? e) => const ListEquality()
      .hash([e?.nombreCurso, e?.descripcion, e?.profesor, e?.alumnos]);

  @override
  bool isValidKey(Object? o) => o is CursoRecord;
}
