import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsapp/widgets/progressIndicatorWidget.dart';


class NetworkImageWidget extends StatelessWidget {
  final double imageWidth;
  final double imageHeight;
  final String imageUrl;

  const NetworkImageWidget({Key key, @required this.imageWidth,@required this.imageHeight,@required this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  imageUrl != null ?
     Material(
          child: CachedNetworkImage(
                   placeholder: (context, url) => ProgressWidget(width: imageWidth,height: imageHeight * 3,),
                    errorWidget: (context, url, error) => const Icon(Icons.broken_image),
                   imageUrl: imageUrl,
                   height: imageHeight *3,
                    fit: BoxFit.fill    ),
    
                     clipBehavior: Clip.hardEdge, )
                   : Container(
                   child: Image.asset("images/news.jpg",
                   fit: BoxFit.fill,),
                   height: imageHeight * 3,
                    );
                   
  }
}