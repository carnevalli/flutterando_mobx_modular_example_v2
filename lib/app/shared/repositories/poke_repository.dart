import 'package:dio/dio.dart';
import 'package:flutterando_pokemon/app/shared/models/pokemon_model.dart';
import "package:meta/meta.dart";

class PokeRepository {
  final Dio dio;

  PokeRepository({@required this.dio});

  Future<List<PokemonModel>> getAllPokemons() async {
    var response = await dio.get('/pokemon');
    List<PokemonModel> list = [];
    for(var json in (response.data['results'] as List)){
      PokemonModel model = PokemonModel(name: json["name"]);
      list.add(model);
    }
    return list;
  }
}