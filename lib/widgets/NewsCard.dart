import 'package:flutter/material.dart';
import 'package:newsapp/screens/NewsDetails.dart';
import 'package:newsapp/widgets/NetworkImageWidget.dart';

class NewsCard extends StatefulWidget {
   final String name;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const NewsCard({Key key, this.name, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content}) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {

  @override
  Widget build(BuildContext context) {
        final _size = MediaQuery.of(context).size;
      
  
        final _imageHeight = _size.height * 0.1;
        final _imageWidth =  _size.width;


    return GestureDetector(
          onTap: () {
                 Navigator.push(context,
                 MaterialPageRoute(builder: (context) => NewsDetails(
                   author: widget.author,
                   title: widget.title,
                   description: widget.description,
                   name: widget.name,
                   url: widget.url,
                   urlToImage: widget.urlToImage,
                   publishedAt: widget.publishedAt,
                    content: widget.content,
                 )), );
          },
          child: Stack(
        fit: StackFit.passthrough,
        children:<Widget>[ 
             ///News Image
                 NetworkImageWidget(imageHeight: _imageHeight,imageWidth: _imageWidth,imageUrl: widget.urlToImage,),

                   ///news Title
                    Container(
                      color: Colors.black.withOpacity(0.8),
              
                     margin: EdgeInsets.only(top: _imageHeight * 3,bottom: 0),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                    
                        children: <Widget>[
                           Icon(Icons.arrow_drop_down_circle,color: Colors.red,),
                    
                         widget.title != null ?
                        Expanded(child: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)):
                        Container(),
                      
                        ],
                      ),
                    ),                 
        ]),

      
    );
  }
}