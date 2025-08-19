class Show {
  final String id;
  final String title;
  final String description;
  final String posterUrl;
  final int totalEpisodes;
  int watchedEpisodes;

  Show({
    required this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.totalEpisodes,
    this.watchedEpisodes = 0,
  });
}