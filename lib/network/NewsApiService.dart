import 'package:http/http.dart' as http;
import 'package:newsapp/model/NewsData.dart';
import 'dart:convert';




Future<NewsData> fetchArticle() async{
final response = await http.get('http://newsapi.org/v2/everything?q=bitcoin&from=2020-03-29&sortBy=publishedAt&apiKey=961978e91855470788518de8c5369768');

if(response.statusCode == 200){
  return NewsData.fromJson(json.decode(response.body));
  } else{
    throw Exception('Failed to load article');
  }
}