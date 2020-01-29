import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando_pokemon/app/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if(homeController.pokemons.error != null) {
            return Center(
              child: Text('Erro'),
            );
          }

          if(homeController.pokemons.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var list = homeController.pokemons.value;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(list[index].name),
              );
            },
          );
        },
      ),
    );
  }
}