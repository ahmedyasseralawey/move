import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/presentation/screens/character_details.dart';
import 'package:move_app/presentation/screens/characters_screen.dart';

import 'business_logic/characters_cubit.dart';
import 'constants/strings.dart';
import 'data/repository/characters_repository.dart';

import 'data/web_services/characters_web_services.dart';

import 'presentation/screens/characters_screen.dart';

import 'data/models/characters.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charactersCubit,
            child: CharactersScreen(),
          ),
        );

      case characterDetailsScreen:
        final character = settings.arguments as Character;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),
            child: CharacterDetailsScreen(
              character: character,
            ),
          ),
        );
    }
  }
}
