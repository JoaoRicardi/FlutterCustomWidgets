import 'package:flutter/material.dart';
import 'package:flutter_architecture_rx/src/bloc/drawer_bloc.dart';
import 'package:provider/provider.dart';

class CustomDrawerContainer extends StatelessWidget {

  final Widget child;
  final Animation placeAnimation;
  final Animation sizeAnimation;
  final Animation borderAnimation;
  final AnimationController animationController;
  final DrawerBloc drawerBloc;

  const CustomDrawerContainer({Key key, this.placeAnimation, this.sizeAnimation, this.borderAnimation, this.animationController, this.drawerBloc, this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Transform.scale(
      scale: sizeAnimation.value,
      child: StreamBuilder<bool>(
          stream: drawerBloc.isClosed,
          builder: (context, snapshot) {
            return Container(
                transform: Matrix4.identity()
                  ..translate(placeAnimation.value, 0.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(borderAnimation.value),
                    child: GestureDetector(
                      onTap: (){
                        if(snapshot.data == true){
                          drawerBloc.toggle(animationController);
                        } else{
                          drawerBloc.toggle(animationController);
                        }
                      },
                      child: Material(
                        child: AbsorbPointer(
                          absorbing: snapshot.data == true ? true  : false,
                          child: child,
                        ),
                      ),
                    )
                )
            );
          }
      ),
    );
  }
}