import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductCategoryRecord extends FirestoreRecord {
  ProductCategoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "category_name" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  void _initializeFields() {
    _createdDate = snapshotData['created_date'] as DateTime?;
    _categoryName = snapshotData['category_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Product_Category');

  static Stream<ProductCategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductCategoryRecord.fromSnapshot(s));

  static Future<ProductCategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductCategoryRecord.fromSnapshot(s));

  static ProductCategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductCategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductCategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductCategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductCategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductCategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductCategoryRecordData({
  DateTime? createdDate,
  String? categoryName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_date': createdDate,
      'category_name': categoryName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductCategoryRecordDocumentEquality
    implements Equality<ProductCategoryRecord> {
  const ProductCategoryRecordDocumentEquality();

  @override
  bool equals(ProductCategoryRecord? e1, ProductCategoryRecord? e2) {
    return e1?.createdDate == e2?.createdDate &&
        e1?.categoryName == e2?.categoryName;
  }

  @override
  int hash(ProductCategoryRecord? e) =>
      const ListEquality().hash([e?.createdDate, e?.categoryName]);

  @override
  bool isValidKey(Object? o) => o is ProductCategoryRecord;
}
