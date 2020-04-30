import 'Article.dart';

class NewsData{
final String status;
final double totalResult;
final List<Article> articles;

NewsData({this.status,this.totalResult,this.articles});


factory NewsData.fromJson(Map<String,dynamic> json){
  var list = json['articles'] as List;
List<Article> articleList = list.map((i) =>
Article.fromJson(i)).toList();

  return NewsData(
       status: json['status'],
       totalResult: json['totalResult'],
        articles: articleList
  );
}
}