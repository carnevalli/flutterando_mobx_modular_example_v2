import 'package:flutterando_pokemon/app/shared/models/pokemon_model.dart';
import 'package:flutterando_pokemon/app/shared/repositories/poke_repository.dart';
import 'package:mobx/mobx.dart';
import "package:meta/meta.dart";
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokeRepository repository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemons;

  _HomeControllerBase({@required this.repository}) {
    pokemons = repository.getAllPokemons().asObservable();
  } 
}