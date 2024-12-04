import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MensajesRecord extends FirestoreRecord {
  MensajesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  bool hasTexto() => _texto != null;

  // "Imagenes" field.
  String? _imagenes;
  String get imagenes => _imagenes ?? '';
  bool hasImagenes() => _imagenes != null;

  // "Hora_de_Envio" field.
  DateTime? _horaDeEnvio;
  DateTime? get horaDeEnvio => _horaDeEnvio;
  bool hasHoraDeEnvio() => _horaDeEnvio != null;

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "chat" field.
  DocumentReference? _chat;
  DocumentReference? get chat => _chat;
  bool hasChat() => _chat != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  void _initializeFields() {
    _texto = snapshotData['Texto'] as String?;
    _imagenes = snapshotData['Imagenes'] as String?;
    _horaDeEnvio = snapshotData['Hora_de_Envio'] as DateTime?;
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _chat = snapshotData['chat'] as DocumentReference?;
    _video = snapshotData['video'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mensajes');

  static Stream<MensajesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MensajesRecord.fromSnapshot(s));

  static Future<MensajesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MensajesRecord.fromSnapshot(s));

  static MensajesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MensajesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MensajesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MensajesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MensajesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MensajesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMensajesRecordData({
  String? texto,
  String? imagenes,
  DateTime? horaDeEnvio,
  DocumentReference? usuario,
  DocumentReference? chat,
  String? video,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Texto': texto,
      'Imagenes': imagenes,
      'Hora_de_Envio': horaDeEnvio,
      'usuario': usuario,
      'chat': chat,
      'video': video,
    }.withoutNulls,
  );

  return firestoreData;
}

class MensajesRecordDocumentEquality implements Equality<MensajesRecord> {
  const MensajesRecordDocumentEquality();

  @override
  bool equals(MensajesRecord? e1, MensajesRecord? e2) {
    return e1?.texto == e2?.texto &&
        e1?.imagenes == e2?.imagenes &&
        e1?.horaDeEnvio == e2?.horaDeEnvio &&
        e1?.usuario == e2?.usuario &&
        e1?.chat == e2?.chat &&
        e1?.video == e2?.video;
  }

  @override
  int hash(MensajesRecord? e) => const ListEquality().hash(
      [e?.texto, e?.imagenes, e?.horaDeEnvio, e?.usuario, e?.chat, e?.video]);

  @override
  bool isValidKey(Object? o) => o is MensajesRecord;
}
