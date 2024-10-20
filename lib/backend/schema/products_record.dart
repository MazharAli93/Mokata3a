import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "CompanyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "Product_Name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "Barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  bool hasBarcode() => _barcode != null;

  // "InList" field.
  bool? _inList;
  bool get inList => _inList ?? false;
  bool hasInList() => _inList != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Product_Image" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  bool hasProductImage() => _productImage != null;

  // "Alternatives" field.
  List<String>? _alternatives;
  List<String> get alternatives => _alternatives ?? const [];
  bool hasAlternatives() => _alternatives != null;

  void _initializeFields() {
    _createdDate = snapshotData['created_date'] as DateTime?;
    _companyName = snapshotData['CompanyName'] as String?;
    _productName = snapshotData['Product_Name'] as String?;
    _barcode = snapshotData['Barcode'] as String?;
    _inList = snapshotData['InList'] as bool?;
    _description = snapshotData['Description'] as String?;
    _productImage = snapshotData['Product_Image'] as String?;
    _alternatives = getDataList(snapshotData['Alternatives']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  DateTime? createdDate,
  String? companyName,
  String? productName,
  String? barcode,
  bool? inList,
  String? description,
  String? productImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_date': createdDate,
      'CompanyName': companyName,
      'Product_Name': productName,
      'Barcode': barcode,
      'InList': inList,
      'Description': description,
      'Product_Image': productImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdDate == e2?.createdDate &&
        e1?.companyName == e2?.companyName &&
        e1?.productName == e2?.productName &&
        e1?.barcode == e2?.barcode &&
        e1?.inList == e2?.inList &&
        e1?.description == e2?.description &&
        e1?.productImage == e2?.productImage &&
        listEquality.equals(e1?.alternatives, e2?.alternatives);
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.createdDate,
        e?.companyName,
        e?.productName,
        e?.barcode,
        e?.inList,
        e?.description,
        e?.productImage,
        e?.alternatives
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
