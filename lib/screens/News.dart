import 'package:flutter/material.dart';
import 'package:newsapp/model/Article.dart';
import 'package:newsapp/model/NewsData.dart';
import 'package:newsapp/network/NewsApiService.dart';
import 'package:newsapp/widgets/progressIndicatorWidget.dart';
import 'package:newsapp/widgets/NewsCard.dart';
class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
Future<NewsData> futureData;
  @override
  void initState() {
    super.initState();
        futureData= fetchArticle();
  }
  @override
  Widget build(BuildContext context) {
     final _size = MediaQuery.of(context).size;
      
  
        final _containerHeight = _size.height;
        final _containerWidth =  _size.width;
    return FutureBuilder<NewsData>(
                future: futureData,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    List<Article> items = snapshot.data.articles;
                    return Scaffold(
                        appBar: AppBar(
                           title: Text('News'),
                        ),
                      body: SafeArea(
                            child: Center(
                            child: Container(
                             child: ArticleList(articleList: items,),
                            )
                        ),
                      ),
                    );

                 }else if(snapshot.hasError){
                   return Text("${snapshot.error}");
                 }
              
                return Center(
                
                 child: ProgressWidget(width: _containerWidth,height: _containerHeight,),
              );
              
                },
    );
  }
}
class ArticleList extends StatelessWidget {
  final List<Article> articleList;
  ArticleList({this.articleList});
  
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
                              itemCount: articleList.length,
                              itemBuilder: (BuildContext context,int index){
                                return NewsCard(
                                   author: articleList[index].author ?? "",
                                   urlToImage: articleList[index].urlToImage,
                                   title: articleList[index].title,
                                   description: articleList[index].description ?? "",
                                   content: articleList[index].content ?? "",
                                   name: articleList[index].source.name ?? "",
                                   publishedAt: articleList[index].publishedAt ?? "",
                                   url: articleList[index].url ?? "",
                                   );
                                
                              }
                              );
                          
  }
}



 