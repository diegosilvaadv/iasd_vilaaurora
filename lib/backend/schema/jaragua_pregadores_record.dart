import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'jaragua_pregadores_record.g.dart';

abstract class JaraguaPregadoresRecord
    implements Built<JaraguaPregadoresRecord, JaraguaPregadoresRecordBuilder> {
  static Serializer<JaraguaPregadoresRecord> get serializer =>
      _$jaraguaPregadoresRecordSerializer;

  @nullable
  String get nome;

  @nullable
  DateTime get data;

  @nullable
  String get img;

  @nullable
  String get igreja;

  @nullable
  double get whatsapp;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(JaraguaPregadoresRecordBuilder builder) =>
      builder
        ..nome = ''
        ..img = ''
        ..igreja = ''
        ..whatsapp = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jaragua_pregadores');

  static Stream<JaraguaPregadoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<JaraguaPregadoresRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  JaraguaPregadoresRecord._();
  factory JaraguaPregadoresRecord(
          [void Function(JaraguaPregadoresRecordBuilder) updates]) =
      _$JaraguaPregadoresRecord;

  static JaraguaPregadoresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createJaraguaPregadoresRecordData({
  String nome,
  DateTime data,
  String img,
  String igreja,
  double whatsapp,
}) =>
    serializers.toFirestore(
        JaraguaPregadoresRecord.serializer,
        JaraguaPregadoresRecord((j) => j
          ..nome = nome
          ..data = data
          ..img = img
          ..igreja = igreja
          ..whatsapp = whatsapp));
