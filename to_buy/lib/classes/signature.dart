class Signature implements Comparable<Signature> {
  String user;
  int timestamp;

  Signature({
    required this.user,
    required this.timestamp,
  });

  Signature.fromMap(Map signature)
      : user = signature['user'],
        timestamp = signature['timestamp'];

  @override
  int compareTo(Signature other) => timestamp.compareTo(other.timestamp);
}
