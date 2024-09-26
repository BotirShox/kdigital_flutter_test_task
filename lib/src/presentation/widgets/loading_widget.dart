import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 35,
        height: 35,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}