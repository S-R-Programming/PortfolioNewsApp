class NewsModel {
  final String title,
      name,
      newsImage,
      detail,
      id,
      date; //idはFirebaseで割り当てられるランダムの文字列

  NewsModel({
    required this.id,
    required this.name,
    required this.newsImage,
    required this.date,
    required this.title,
    required this.detail,
  });
}
