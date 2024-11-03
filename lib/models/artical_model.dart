class ArticleModel {
  final String? image;
  final String title;
  final String? description;

  ArticleModel({required this.image, required this.title, required this.description});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      image: json['urlToImage'], // تأكد من تطابق اسم الحقل مع هيكل بيانات API
      title: json['title'],
      description: json['description'],
    );
  }
}
