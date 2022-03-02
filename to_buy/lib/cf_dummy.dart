import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;

// Map user = {
//   'name': String, //?
// };

Map group = {
  'name': String,
  'users': List<String>,
};

Map checkList = {
  'name': String,
  'deleted': signature, //?
};

Map product = {
  'name': String,
  'brand': String, //?
  'store': String, //?
  'description': String, //?
  'quantity': double, //?
  'units': String, //?
  'flag': int, // 0 - Discount | >0 - Important //?
  'added': signature,
  'bought': signature, //?
  'removed': signature, //?
};

Map signature = {
  'user': String,
  'timestamp': Timestamp,
};
