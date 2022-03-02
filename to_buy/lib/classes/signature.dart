class Signature implements Comparable<Signature> {
  String user;
  DateTime timestamp;

  Signature({
    required this.user,
    required this.timestamp,
  });

  @override
  int compareTo(Signature other) => timestamp.compareTo(other.timestamp);
}
