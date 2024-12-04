import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GruposRecord extends FirestoreRecord {
  GruposRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombreGrupo" field.
  String? _nombreGrupo;
  String get nombreGrupo => _nombreGrupo ?? '';
  bool hasNombreGrupo() => _nombreGrupo != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "dia" field.
  String? _dia;
  String get dia => _dia ?? '';
  bool hasDia() => _dia != null;

  // "hora" field.
  String? _hora;
  String get hora => _hora ?? '';
  bool hasHora() => _hora != null;

  // "miembros" field.
  List<DocumentReference>? _miembros;
  List<DocumentReference> get miembros => _miembros ?? const [];
  bool hasMiembros() => _miembros != null;

  // "urlPhotoGrupo" field.
  String? _urlPhotoGrupo;
  String get urlPhotoGrupo => _urlPhotoGrupo ?? '';
  bool hasUrlPhotoGrupo() => _urlPhotoGrupo != null;

  void _initializeFields() {
    _nombreGrupo = snapshotData['nombreGrupo'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _dia = snapshotData['dia'] as String?;
    _hora = snapshotData['hora'] as String?;
    _miembros = getDataList(snapshotData['miembros']);
    _urlPhotoGrupo = snapshotData['urlPhotoGrupo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('grupos');

  static Stream<GruposRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GruposRecord.fromSnapshot(s));

  static Future<GruposRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GruposRecord.fromSnapshot(s));

  static GruposRecord fromSnapshot(DocumentSnapshot snapshot) => GruposRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GruposRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GruposRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GruposRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GruposRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGruposRecordData({
  String? nombreGrupo,
  String? descripcion,
  String? dia,
  String? hora,
  String? urlPhotoGrupo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombreGrupo': nombreGrupo,
      'descripcion': descripcion,
      'dia': dia,
      'hora': hora,
      'urlPhotoGrupo': urlPhotoGrupo,
    }.withoutNulls,
  );

  return firestoreData;
}

class GruposRecordDocumentEquality implements Equality<GruposRecord> {
  const GruposRecordDocumentEquality();

  @override
  bool equals(GruposRecord? e1, GruposRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombreGrupo == e2?.nombreGrupo &&
        e1?.descripcion == e2?.descripcion &&
        e1?.dia == e2?.dia &&
        e1?.hora == e2?.hora &&
        listEquality.equals(e1?.miembros, e2?.miembros) &&
        e1?.urlPhotoGrupo == e2?.urlPhotoGrupo;
  }

  @override
  int hash(GruposRecord? e) => const ListEquality().hash([
        e?.nombreGrupo,
        e?.descripcion,
        e?.dia,
        e?.hora,
        e?.miembros,
        e?.urlPhotoGrupo
      ]);

  @override
  bool isValidKey(Object? o) => o is GruposRecord;
}
