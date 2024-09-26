import 'package:kdigital_test/src/presentation/bloc/main_bloc.dart';
import 'package:kdigital_test/src/presentation/bloc/main_event.dart';
import 'package:kdigital_test/src/presentation/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kdigital_test/src/presentation/widgets/loading_widget.dart';
import '../../domain/characters.dart';
import '../widgets/failed_widget.dart';
import '../widgets/success_widget.dart';

@immutable
class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MainPageBloc(
          GetIt.I.get<CharactersRepository>(),
        )..add(const GetTestDataOnMainPageEvent()),
        child: BlocBuilder<MainPageBloc, MainPageState>(
          builder: (blocContext, state) {
            final bloc = blocContext.read<MainPageBloc>();
            if (state is LoadingMainPageState && bloc.page == 1 ||
                bloc.fromError) {
              return LoadingWidget();
            } else if (state is SuccessfulMainPageState) {
              return SuccessfulWidget(bloc.characters);
            } else if (state is FailedMainPageState) {
              return FailedWidget('${state.error}');
            } else if (bloc.connectionError) {
              return FailedWidget('lookup');
            } else {
              return SuccessfulWidget(bloc.characters);
            }
          },
        ),
      ),
    );
  }
}