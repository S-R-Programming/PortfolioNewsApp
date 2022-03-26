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

/*List<NewsModel> newsList = [
  NewsModel(
      id: "123",
      title: "The Burning Snow The Burning Snow The Burning Snow",
      detail: "Swollen glands,Dry Cough,Restlessness",
      date: "2020年",
      gameName: "qw",
      newsImage:
          "https://firebasestorage.googleapis.com/v0/b/naturalherbapp.appspot.com/o/a_herb%2F2nNIN4CxVz1achHl7JGP?alt=media&token=78be0737-e148-4e28-b4a5-6f3103fc73ba",
      logoImage:
          "https://firebasestorage.googleapis.com/v0/b/naturalherbapp.appspot.com/o/a_herb%2F2nNIN4CxVz1achHl7JGP?alt=media&token=78be0737-e148-4e28-b4a5-6f3103fc73ba"),
  NewsModel(
      id: "123",
      title: "The Burning Snow",
      detail: "Swollen glands,Dry Cough,Restlessness",
      date: "2020年",
      gameName: "qw",
      newsImage:
          "https://firebasestorage.googleapis.com/v0/b/naturalherbapp.appspot.com/o/a_herb%2F2nNIN4CxVz1achHl7JGP?alt=media&token=78be0737-e148-4e28-b4a5-6f3103fc73ba",
      logoImage:
          "https://firebasestorage.googleapis.com/v0/b/naturalherbapp.appspot.com/o/a_herb%2F2nNIN4CxVz1achHl7JGP?alt=media&token=78be0737-e148-4e28-b4a5-6f3103fc73ba"),
  NewsModel(
      id: "123",
      title: "The Burning Snow",
      detail: "Swollen glands,Dry Cough,Restlessness",
      date: "2020年",
      gameName: "qw",
      newsImage:
          "https://firebasestorage.googleapis.com/v0/b/naturalherbapp.appspot.com/o/a_herb%2F2nNIN4CxVz1achHl7JGP?alt=media&token=78be0737-e148-4e28-b4a5-6f3103fc73ba",
      logoImage:
          "https://firebasestorage.googleapis.com/v0/b/naturalherbapp.appspot.com/o/a_herb%2F2nNIN4CxVz1achHl7JGP?alt=media&token=78be0737-e148-4e28-b4a5-6f3103fc73ba"),
  NewsModel(
      id: "123",
      title: "The Burning Snow The Burning Snow The Burning Snow",
      detail: "Swollen glands,Dry Cough,Restlessness",
      date: "2020年",
      gameName: "qw",
      newsImage:
          "https://firebasestorage.googleapis.com/v0/b/naturalherbapp.appspot.com/o/a_herb%2F2nNIN4CxVz1achHl7JGP?alt=media&token=78be0737-e148-4e28-b4a5-6f3103fc73ba",
      logoImage:
          "https://firebasestorage.googleapis.com/v0/b/naturalherbapp.appspot.com/o/a_herb%2F2nNIN4CxVz1achHl7JGP?alt=media&token=78be0737-e148-4e28-b4a5-6f3103fc73ba"),
  NewsModel(
      id: "123",
      title: "The Burning Snow The Burning Snow The Burning Snow",
      detail: "Swollen glands,Dry Cough,Restlessness",
      date: "2020年",
      gameName: "qw",
      newsImage:
          "https://firebasestorage.googleapis.com/v0/b/naturalherbapp.appspot.com/o/a_herb%2F2nNIN4CxVz1achHl7JGP?alt=media&token=78be0737-e148-4e28-b4a5-6f3103fc73ba",
      logoImage:
          "https://firebasestorage.googleapis.com/v0/b/naturalherbapp.appspot.com/o/a_herb%2F2nNIN4CxVz1achHl7JGP?alt=media&token=78be0737-e148-4e28-b4a5-6f3103fc73ba"),
];
*/
