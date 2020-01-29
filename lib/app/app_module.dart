import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando_pokemon/app/app_widget.dart';
import 'package:flutterando_pokemon/app/pages/home/home_controller.dart';
import 'package:flutterando_pokemon/app/pages/home/home_page.dart';
import 'package:flutterando_pokemon/app/shared/repositories/poke_repository.dart';
import 'package:flutterando_pokemon/app/shared/utils/constants.dart';

// extends from MainModule
class AppModule extends MainModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [
    Bind((i) => Dio(BaseOptions(baseUrl: urlBase))),
    Bind((i) => PokeRepository(dio: i.get<Dio>())),
    Bind((i) => HomeController(repository: i.get<PokeRepository>())),
  ];

  // here will be the routes of your module
  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => HomePage()),
  ];

// add your main widget here
  @override
  Widget get bootstrap => AppWidget();
}