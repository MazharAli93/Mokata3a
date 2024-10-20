import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyCategoryRecord extends FirestoreRecord {
  CompanyCategoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_Date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "categoryName" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  void _initializeFields() {
    _createdDate = snapshotData['created_Date'] as DateTime?;
    _categoryName = snapshotData['categoryName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('company_category');

  static Stream<CompanyCategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyCategoryRecord.fromSnapshot(s));

  static Future<CompanyCategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyCategoryRecord.fromSnapshot(s));

  static CompanyCategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyCategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyCategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyCategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyCategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyCategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyCategoryRecordData({
  DateTime? createdDate,
  String? categoryName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_Date': createdDate,
      'categoryName': categoryName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyCategoryRecordDocumentEquality
    implements Equality<CompanyCategoryRecord> {
  const CompanyCategoryRecordDocumentEquality();

  @override
  bool equals(CompanyCategoryRecord? e1, CompanyCategoryRecord? e2) {
    return e1?.createdDate == e2?.createdDate &&
        e1?.categoryName == e2?.categoryName;
  }

  @override
  int hash(CompanyCategoryRecord? e) =>
      const ListEquality().hash([e?.createdDate, e?.categoryName]);

  @override
  bool isValidKey(Object? o) => o is CompanyCategoryRecord;
}
