import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContenidoCursoRecord extends FirestoreRecord {
  ContenidoCursoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "CursoRef" field.
  DocumentReference? _cursoRef;
  DocumentReference? get cursoRef => _cursoRef;
  bool hasCursoRef() => _cursoRef != null;

  void _initializeFields() {
    _titulo = snapshotData['Titulo'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _cursoRef = snapshotData['CursoRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ContenidoCurso');

  static Stream<ContenidoCursoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContenidoCursoRecord.fromSnapshot(s));

  static Future<ContenidoCursoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContenidoCursoRecord.fromSnapshot(s));

  static ContenidoCursoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContenidoCursoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContenidoCursoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContenidoCursoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContenidoCursoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContenidoCursoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContenidoCursoRecordData({
  String? titulo,
  String? descripcion,
  DocumentReference? cursoRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Titulo': titulo,
      'Descripcion': descripcion,
      'CursoRef': cursoRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContenidoCursoRecordDocumentEquality
    implements Equality<ContenidoCursoRecord> {
  const ContenidoCursoRecordDocumentEquality();

  @override
  bool equals(ContenidoCursoRecord? e1, ContenidoCursoRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.descripcion == e2?.descripcion &&
        e1?.cursoRef == e2?.cursoRef;
  }

  @override
  int hash(ContenidoCursoRecord? e) =>
      const ListEquality().hash([e?.titulo, e?.descripcion, e?.cursoRef]);

  @override
  bool isValidKey(Object? o) => o is ContenidoCursoRecord;
}
