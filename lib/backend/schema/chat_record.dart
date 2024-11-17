import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "hora_creacion" field.
  DateTime? _horaCreacion;
  DateTime? get horaCreacion => _horaCreacion;
  bool hasHoraCreacion() => _horaCreacion != null;

  // "Ultimo_Mensaje" field.
  String? _ultimoMensaje;
  String get ultimoMensaje => _ultimoMensaje ?? '';
  bool hasUltimoMensaje() => _ultimoMensaje != null;

  // "Usuario" field.
  List<DocumentReference>? _usuario;
  List<DocumentReference> get usuario => _usuario ?? const [];
  bool hasUsuario() => _usuario != null;

  // "Envio_Ultimo_Mensaje" field.
  DateTime? _envioUltimoMensaje;
  DateTime? get envioUltimoMensaje => _envioUltimoMensaje;
  bool hasEnvioUltimoMensaje() => _envioUltimoMensaje != null;

  // "usuario_1" field.
  DocumentReference? _usuario1;
  DocumentReference? get usuario1 => _usuario1;
  bool hasUsuario1() => _usuario1 != null;

  // "usuario_2" field.
  DocumentReference? _usuario2;
  DocumentReference? get usuario2 => _usuario2;
  bool hasUsuario2() => _usuario2 != null;

  // "Ultimo_Mensaje_Enviado_por" field.
  DocumentReference? _ultimoMensajeEnviadoPor;
  DocumentReference? get ultimoMensajeEnviadoPor => _ultimoMensajeEnviadoPor;
  bool hasUltimoMensajeEnviadoPor() => _ultimoMensajeEnviadoPor != null;

  // "Ultimo_Mensaje_vist_por" field.
  List<DocumentReference>? _ultimoMensajeVistPor;
  List<DocumentReference> get ultimoMensajeVistPor =>
      _ultimoMensajeVistPor ?? const [];
  bool hasUltimoMensajeVistPor() => _ultimoMensajeVistPor != null;

  // "Chat_Grupal" field.
  int? _chatGrupal;
  int get chatGrupal => _chatGrupal ?? 0;
  bool hasChatGrupal() => _chatGrupal != null;

  void _initializeFields() {
    _horaCreacion = snapshotData['hora_creacion'] as DateTime?;
    _ultimoMensaje = snapshotData['Ultimo_Mensaje'] as String?;
    _usuario = getDataList(snapshotData['Usuario']);
    _envioUltimoMensaje = snapshotData['Envio_Ultimo_Mensaje'] as DateTime?;
    _usuario1 = snapshotData['usuario_1'] as DocumentReference?;
    _usuario2 = snapshotData['usuario_2'] as DocumentReference?;
    _ultimoMensajeEnviadoPor =
        snapshotData['Ultimo_Mensaje_Enviado_por'] as DocumentReference?;
    _ultimoMensajeVistPor =
        getDataList(snapshotData['Ultimo_Mensaje_vist_por']);
    _chatGrupal = castToType<int>(snapshotData['Chat_Grupal']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  DateTime? horaCreacion,
  String? ultimoMensaje,
  DateTime? envioUltimoMensaje,
  DocumentReference? usuario1,
  DocumentReference? usuario2,
  DocumentReference? ultimoMensajeEnviadoPor,
  int? chatGrupal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hora_creacion': horaCreacion,
      'Ultimo_Mensaje': ultimoMensaje,
      'Envio_Ultimo_Mensaje': envioUltimoMensaje,
      'usuario_1': usuario1,
      'usuario_2': usuario2,
      'Ultimo_Mensaje_Enviado_por': ultimoMensajeEnviadoPor,
      'Chat_Grupal': chatGrupal,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.horaCreacion == e2?.horaCreacion &&
        e1?.ultimoMensaje == e2?.ultimoMensaje &&
        listEquality.equals(e1?.usuario, e2?.usuario) &&
        e1?.envioUltimoMensaje == e2?.envioUltimoMensaje &&
        e1?.usuario1 == e2?.usuario1 &&
        e1?.usuario2 == e2?.usuario2 &&
        e1?.ultimoMensajeEnviadoPor == e2?.ultimoMensajeEnviadoPor &&
        listEquality.equals(
            e1?.ultimoMensajeVistPor, e2?.ultimoMensajeVistPor) &&
        e1?.chatGrupal == e2?.chatGrupal;
  }

  @override
  int hash(ChatRecord? e) => const ListEquality().hash([
        e?.horaCreacion,
        e?.ultimoMensaje,
        e?.usuario,
        e?.envioUltimoMensaje,
        e?.usuario1,
        e?.usuario2,
        e?.ultimoMensajeEnviadoPor,
        e?.ultimoMensajeVistPor,
        e?.chatGrupal
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
