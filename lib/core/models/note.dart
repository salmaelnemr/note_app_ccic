class Note {
  String title;
  String subtitle;
  String id;


  Note({
    required this.id,
    required this.title,
    required this.subtitle,

  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['_id'],
      title: json['title'],
      subtitle: json['subtitle'] ?? '',
    );
  }
}
