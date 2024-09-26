import 'package:kdigital_test/src/data/repository/characters_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:kdigital_test/src/presentation/bloc/main_bloc.dart';
import '../domain/characters.dart';

class MainDI {
  void configure(GetIt getIt) {
    final httpClient = Client();

    getIt.registerLazySingleton<CharactersRepository>(
          () => CharactersRepositoryImpl(httpClient),
    );

    getIt.registerFactory(() => MainPageBloc(getIt()));
  }
}