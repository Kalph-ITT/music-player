class Music {
  final int id;
  final String title;
  final String artist;
  final String url;
  final double duration;

  Music({
    required this.id,
    required this.title,
    required this.artist,
    required this.url,
    required this.duration,
  });

  Music copyWith({
    String? title,
    String? url,
    double? duration,
    String? artist,
    int? id,
  }) {
    return Music(
      title: title ?? this.title,
      url: url ?? this.url,
      duration: duration ?? this.duration,
      artist: artist ?? this.artist,
      id: id ?? this.id,
    );
  }
}
