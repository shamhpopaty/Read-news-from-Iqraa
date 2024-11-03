class ArticleModel{
  String? image;
  String title;
  String description;
  ArticleModel({required this.title, required this.image, required this.description});
  factory ArticleModel.fromjson(json){
    return ArticleModel(title: json['title'], image: json['urlimage'], description: json['description']);
  }
}