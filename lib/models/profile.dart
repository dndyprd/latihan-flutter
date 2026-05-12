class Profile {
  int id;
  String name;
  String profesi64;
  String nomorTelpon64;
  String domisili64;

  Profile({
    required this.id,
    required this.name,
    required this.profesi64,
    required this.nomorTelpon64,
    required this.domisili64,
  });

  Profile copyWith({
    int? id,
    String? name,
    String? profesi64,
    String? nomorTelpon64,
    String? domisili64,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      profesi64: profesi64 ?? this.profesi64,
      nomorTelpon64: nomorTelpon64 ?? this.nomorTelpon64,
      domisili64: domisili64 ?? this.domisili64,
    );
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      name: map['name'],
      profesi64: map['profesi64'],
      nomorTelpon64: map['nomorTelpon64'],
      domisili64: map['domisili64'],
    );
  }

  Map<String, dynamic> toMap() {
    final map = {
      'id': id,
      'name': name,
      'profesi64': profesi64,
      'nomorTelpon64': nomorTelpon64,
      'domisili64': domisili64,
    };

    return map;
  }
}
