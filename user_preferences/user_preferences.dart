import 'package:shared_preferences/shared_preferences.dart';

/*
  Remember install the package:

    shared_preferences:
  Tambien:
  Inicializar en el main
    WidgetsFlutterBinding.ensureInitialized(); 
    final prefs = new PreferenciasUsuario();
    await prefs.initPrefs();
    
    Remember the  main() should be async {...
*/

class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del nombre
  get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre( String value ) {
    _prefs.setString('nombre', value);
  }
  

  // GET y SET de la última página
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina( String value ) {
    _prefs.setString('ultimaPagina', value);
  }

}
