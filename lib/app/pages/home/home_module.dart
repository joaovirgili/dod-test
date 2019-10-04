import 'package:dodvision/app/app_module.dart';
import 'package:dodvision/app/pages/home/home_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dodvision/app/shared/repositories/alimentos_repository.dart';
import 'package:flutter/material.dart';
import 'package:dodvision/app/pages/home/home_page.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc(AppModule.to.getDependency<AlimentosRepository>())),
      ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => AlimentosRepository())
  ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
