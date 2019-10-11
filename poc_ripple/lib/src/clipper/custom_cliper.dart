import 'package:flutter/cupertino.dart';

class MyCustomClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height-100); //inicia ele no ponto zero
    path.quadraticBezierTo(size.width/4, size.height/2-100, size.width/2, size.height-100);
    path.quadraticBezierTo(size.width -( size.width/4), size.height +100, size.width, size.height-100);
    path.lineTo(size.width, 0);
    path.close(); //fecha ele
    


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return null;
  }


}