class Experience {
  final String title;
  final String company;
  final String duration;
  final String description;

  Experience({
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
  });

  Map<String, Object> toMap() {
    return {
      'title' : title,
      'company': company,
      'duration': duration,
      'description': description,
    };
  }

}
