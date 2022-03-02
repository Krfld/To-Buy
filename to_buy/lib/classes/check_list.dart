import './signature.dart';

class CheckList implements Comparable<CheckList> {
  String name;
  Signature? deleted;

  CheckList({
    required this.name,
    this.deleted,
  });

  @override
  int compareTo(other) => name.compareTo(other.name);
}
