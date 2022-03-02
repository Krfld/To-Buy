class Group implements Comparable<Group> {
  String name;
  List<String> users;

  Group({
    required this.name,
    required this.users,
  });

  @override
  int compareTo(other) => name.compareTo(other.name);
}
