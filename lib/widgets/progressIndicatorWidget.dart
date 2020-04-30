
import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final double width;
  final double height;
  ProgressWidget({@required this.height,@required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
       child: CircularProgressIndicator(
         backgroundColor: Colors.blueGrey,
         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
       ),
        alignment: Alignment.center,

       width: width,
       height: height,
      
       decoration: BoxDecoration(
         color: Color(0xffE8E8E8),
        
         borderRadius: BorderRadius.all(
           Radius.circular(8.0),
          
         ),
         
       ),
    );
  }
}