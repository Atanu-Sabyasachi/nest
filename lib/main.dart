import 'dart:developer';

import 'package:nest/nest.dart';
import 'package:nest/src/collections/collection_manager.dart';
import 'package:nest/src/collections/schema.dart';

void main() async {
  final Nest db = Nest();
  await db.initialize('this-is-a-secret-key-of-32-lengt');
  try {
    await db.createCollection(
      'users',
      Schema({
        'id': FieldType(type: String, isRequired: true),
        'name': FieldType(type: String),
        'age': FieldType(type: int),
      }),
    );
  } catch (e) {
    log('error creating collection: $e');
  }

  CollectionManager? collection = db.getCollection('users');
  log('collection: $collection');
}
