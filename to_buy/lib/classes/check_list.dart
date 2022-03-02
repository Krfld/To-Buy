import './signature.dart';

class CheckList implements Comparable<CheckList> {
  String name;
  Signature? deleted;

  CheckList({
    required this.name,
    this.deleted,
  });

  factory CheckList.fromMap(Map checkList) {
    Map? deleted = checkList['deleted'];

    return CheckList(
      name: checkList['name'],
      deleted: deleted != null ? Signature.fromMap(deleted) : null,
    );
  }

  @override
  int compareTo(other) => name.compareTo(other.name);
}
