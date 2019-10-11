import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RadialAnimation extends StatefulWidget {

  final AnimationController controller;
  final Animation<double> rotation;
  final Animation<double> translation;
  final Animation<double> scale;


  //Setta valores
  RadialAnimation({ Key key, this.controller }) :
        translation = Tween<double>(begin: 0.0, end: 100.0,).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.elasticOut
          ),
        ),
        scale = Tween<double>(begin: 1.5, end: 0.0,).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.fastOutSlowIn
          ),
        ),
        rotation = Tween<double>(begin: 0.0, end: 360.0,).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0, 0.7,
              curve: Curves.decelerate,
            ),
          ),
        ),
        super(key: key);

  @override
  _RadialAnimationState createState() => _RadialAnimationState();
}

class _RadialAnimationState extends State<RadialAnimation> {

  bool close;

  @override
  void initState() {
    super.initState();
    close = false;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: close ==true ?400 : 800),
      bottom: close == true ? MediaQuery.of(context).size.height/2 -50 : 50,
      right: close == true ? MediaQuery.of(context).size.width/2 -30 : 40,
      child: AnimatedBuilder(
          animation: widget.controller,
          builder: (context, snapshot) {
            return Transform.rotate(
                angle: radians(widget.rotation.value),
                child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      _buildButton(0, color: Colors.red, icon: FontAwesomeIcons.thumbtack),
                      _buildButton(45, color: Colors.green, icon:FontAwesomeIcons.sprayCan),
                      _buildButton(90, color: Colors.orange, icon: FontAwesomeIcons.fire),
                      _buildButton(135, color: Colors.blue, icon:FontAwesomeIcons.kiwiBird),
                      _buildButton(180, color: Colors.black, icon:FontAwesomeIcons.cat),
                      _buildButton(225, color: Colors.indigo, icon:FontAwesomeIcons.paw),
                      _buildButton(270, color: Colors.pink, icon: FontAwesomeIcons.bong),
                      _buildButton(315, color: Colors.yellow, icon:FontAwesomeIcons.bolt),
                      Transform.scale(
                        scale: widget.scale.value - 1,
                        child: FloatingActionButton(child: Icon(FontAwesomeIcons.timesCircle), onPressed: _close, backgroundColor: Colors.red),
                      ),
                      Transform.scale(
                        scale: widget.scale.value,
                        child: FloatingActionButton(child: Icon(FontAwesomeIcons.solidDotCircle), onPressed: _open),
                      )

                    ])
            );
          }),
    );
  }

  _open() {
    setState(() {
      close = true;
    });
    widget.controller.forward();
  }

  _close() {
    widget.controller.reverse();
    setState(() {
      close = false;
    });

  }

  _buildButton(double angle, { Color color, IconData icon }) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()..translate(
            (widget.translation.value) * cos(rad),
            (widget.translation.value) * sin(rad)
        ),

        child: FloatingActionButton(
            child: Icon(icon), backgroundColor: color, onPressed: _close, elevation: 0)
    );
  }
}