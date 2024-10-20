import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyRecord extends FirestoreRecord {
  CompanyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "Company_Name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "Logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "InList" field.
  bool? _inList;
  bool get inList => _inList ?? false;
  bool hasInList() => _inList != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _createdDate = snapshotData['created_date'] as DateTime?;
    _companyName = snapshotData['Company_Name'] as String?;
    _logo = snapshotData['Logo'] as String?;
    _description = snapshotData['Description'] as String?;
    _inList = snapshotData['InList'] as bool?;
    _category = snapshotData['Category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('company');

  static Stream<CompanyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyRecord.fromSnapshot(s));

  static Future<CompanyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyRecord.fromSnapshot(s));

  static CompanyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyRecordData({
  DateTime? createdDate,
  String? companyName,
  String? logo,
  String? description,
  bool? inList,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_date': createdDate,
      'Company_Name': companyName,
      'Logo': logo,
      'Description': description,
      'InList': inList,
      'Category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyRecordDocumentEquality implements Equality<CompanyRecord> {
  const CompanyRecordDocumentEquality();

  @override
  bool equals(CompanyRecord? e1, CompanyRecord? e2) {
    return e1?.createdDate == e2?.createdDate &&
        e1?.companyName == e2?.companyName &&
        e1?.logo == e2?.logo &&
        e1?.description == e2?.description &&
        e1?.inList == e2?.inList &&
        e1?.category == e2?.category;
  }

  @override
  int hash(CompanyRecord? e) => const ListEquality().hash([
        e?.createdDate,
        e?.companyName,
        e?.logo,
        e?.description,
        e?.inList,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyRecord;
}
