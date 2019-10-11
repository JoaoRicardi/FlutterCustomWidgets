import 'package:flutter/material.dart';
import 'package:poc_ripple/src/pages/new_page.dart';
import 'package:poc_ripple/src/router/fade_router.dart';
import 'package:rect_getter/rect_getter.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final Duration animationDuration = Duration(milliseconds: 300);
  final Duration delay = Duration(milliseconds: 300);
  GlobalKey rectGetterKey = RectGetter.createGlobalKey(); //<--Create a key
  Rect rect;

  void _onTap() async {
    setState(() => rect = RectGetter.getRectFromKey(rectGetterKey));  //<-- set rect to be size of fab
    WidgetsBinding.instance.addPostFrameCallback((_) {                //<-- on the next frame...
      setState(() =>
      rect = rect.inflate(1.3 * MediaQuery.of(context).size.longestSide)); //<-- set rect to be big
      Future.delayed(animationDuration + delay, _goToNextPage); //<-- after delay, go to next page
    });
  }

  void _goToNextPage() {
    Navigator.of(context)
        .push(FadeRouteBuilder(page: NewPage()))
        .then((_) => setState(() => rect = null));
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
              title: Text('Fab overlay transition')),
          body: Center(child: Text('This is first page')),
          floatingActionButton: RectGetter(           //<-- Wrap Fab with RectGetter
            key: rectGetterKey,                       //<-- Passing the key
            child: FloatingActionButton(
              onPressed: _onTap,
              child: Icon(Icons.mail_outline),
            ),
          ),
        ),
        _ripple(),
      ],
    );
  }


  Widget _ripple() {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: animationDuration,
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.height - rect.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
      ),
    );
  }
}