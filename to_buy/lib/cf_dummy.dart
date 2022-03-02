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
  'unit': String, //?
  'flag': int, // 0 - Discount | >0 - Important //?
  'added': signature,
  'bought': signature, //?
  'removed': signature, //?
};

Map signature = {
  'user': String,
  'timestamp': int,
};
