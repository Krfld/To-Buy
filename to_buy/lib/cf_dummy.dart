Map group = {
  'name': String,
  'users': List<String>,
};

Map list = {
  'name': String,
  'deleted': signature, //?
};

Map product = {
  'name': String,
  // 'brand': String, //?
  // 'store': String, //?
  'description': String, //?
  // 'quantity': String, //?
  // 'amount': String, //?
  'flag': int, // 0 - Discount | >0 - Important //?
  'added': signature,
  'bought': signature, //?
  'removed': signature, //?
};

Map signature = {
  'user': String,
  'timestamp': int,
};
