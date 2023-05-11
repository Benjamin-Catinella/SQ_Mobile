import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingCircle extends StatefulWidget {
  const LoadingCircle({super.key});

  @override
  State<LoadingCircle> createState() => _LoadingCircleState();
}

class _LoadingCircleState extends State<LoadingCircle> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      heightFactor: 100,
      child: LoadingAnimationWidget.discreteCircle(
        color: Colors.red,
        size: 37,
        secondRingColor: Colors.blue,
        thirdRingColor: Colors.green,
      ),
    );
  }
}
