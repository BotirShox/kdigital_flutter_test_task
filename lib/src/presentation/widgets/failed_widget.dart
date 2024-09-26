import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/presentation/bloc/main_bloc.dart';
import 'package:kdigital_test/src/presentation/bloc/main_event.dart';

class FailedWidget extends StatelessWidget {
  final String error;
  const FailedWidget(this.error, {key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            error.contains('lookup')
                ? 'Подключите к Интернету и попробуйте еще раз'
                : error,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          if (!error.contains('lookup')) Text('- или нажмите -\n'),
          TextButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
            onPressed: () {
              final bloc = context.read<MainPageBloc>();
              bloc.fromError = true;
              bloc.add(GetTestDataOnMainPageEvent());
            },
            child: Text('Обновить страницу', style: TextStyle(color: Colors.yellowAccent),),
          )
        ],
      ),
    );
  }
}