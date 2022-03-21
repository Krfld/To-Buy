typedef ID = String;

class Signature implements Comparable<Signature> {
  ID user;
  int timestamp;

  Signature({
    required this.user,
    required this.timestamp,
  });

  Signature.fromMap(Map signature)
      : user = signature['user'],
        timestamp = signature['timestamp'].millisecondsSinceEpoch;

  @override
  int compareTo(Signature other) => timestamp.compareTo(other.timestamp);
}
