import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SocialMediaRecord extends FirestoreRecord {
  SocialMediaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  void _initializeFields() {
    _createdDate = snapshotData['created_date'] as DateTime?;
    _name = snapshotData['Name'] as String?;
    _link = snapshotData['Link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SocialMedia');

  static Stream<SocialMediaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SocialMediaRecord.fromSnapshot(s));

  static Future<SocialMediaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SocialMediaRecord.fromSnapshot(s));

  static SocialMediaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SocialMediaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SocialMediaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SocialMediaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SocialMediaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SocialMediaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSocialMediaRecordData({
  DateTime? createdDate,
  String? name,
  String? link,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_date': createdDate,
      'Name': name,
      'Link': link,
    }.withoutNulls,
  );

  return firestoreData;
}

class SocialMediaRecordDocumentEquality implements Equality<SocialMediaRecord> {
  const SocialMediaRecordDocumentEquality();

  @override
  bool equals(SocialMediaRecord? e1, SocialMediaRecord? e2) {
    return e1?.createdDate == e2?.createdDate &&
        e1?.name == e2?.name &&
        e1?.link == e2?.link;
  }

  @override
  int hash(SocialMediaRecord? e) =>
      const ListEquality().hash([e?.createdDate, e?.name, e?.link]);

  @override
  bool isValidKey(Object? o) => o is SocialMediaRecord;
}
