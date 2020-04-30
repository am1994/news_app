import 'package:flutter/material.dart';
import 'package:newsapp/widgets/NetworkImageWidget.dart';


class NewsDetails extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String name;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const NewsDetails({Key key, this.author, this.description, this.name, this.url, this.urlToImage, this.publishedAt, this.content, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
       body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: height * 0.4,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                child: Text(title,style: TextStyle(fontSize: 14),)),
              background:  Stack(
                             fit: StackFit.passthrough,
                           children:<Widget>[
                             
                              NetworkImageWidget(imageWidth: width, 
                            imageHeight: height *0.4, imageUrl: urlToImage),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(author,style: TextStyle(color: Colors.black,
                              fontSize: 10,fontWeight: FontWeight.bold),)),
                              ]
              ),
              ),
              
            ),
          
           
           SliverFillRemaining(
           child: Container(
            // margin: EdgeInsets.only(top:10),
              decoration: BoxDecoration(
                  color: Color(0xffE8E8E8), ),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
                children:<Widget>[
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(publishedAt.substring(0,10),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                        Container(
                            margin: EdgeInsets.only(left: 6,top:5),                           
                           child: Text(description,style: TextStyle(fontWeight: FontWeight.bold
                          ),),
                        ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text("content: ",style: TextStyle(color: Colors.cyan,fontSize: 20,fontWeight: FontWeight.bold),)),
                                                    

                           Text(content),
                            Align(
                        
                                 alignment: Alignment.bottomLeft,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget>[ 
                                    Text("source: ",style: TextStyle(color: Colors.cyan,fontSize: 15,fontWeight: FontWeight.bold),),
                                 

                            Text(url,style: TextStyle(color: Colors.blueAccent),)
                         ]),
                               ),
                ],
                
                
                ),
           ) 
             ),


          ],
    
    
      )
    );


    
  }
}


 /*List<int>.generate(1, (index) => index).map((index) => Container(
                      //height: 40,
                      margin: EdgeInsets.symmetric(vertical: 10),
                       color: Colors.grey[300],
                      alignment: Alignment.center,*/