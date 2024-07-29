class Experience {
  int idex;
  String? title;
  String? company;
  String? duration;
  String? description;

  Experience({
    required this.idex,
    this.title,
    this.company,
    this.duration,
    this.description,
  });

  Map<String, Object?> toMap() {
    return {
      'idex' : idex,
      'title': title,
      'company': company,
      'duration': duration,
      'description': description,
    };
  }

}
