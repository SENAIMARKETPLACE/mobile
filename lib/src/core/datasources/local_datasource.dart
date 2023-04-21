import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final Future<SharedPreferences> pref = SharedPreferences.getInstance();

  Future setString(String value) async {
    final prefs = await pref;
    return prefs.setString('setCnpj', value);
  }

  static Future<void> saveDataAccess({
    required String email,
    required String senha,
    required String telefone,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('setEmail', email);
    await prefs.setString('setSenha', senha);
    await prefs.setString('setTelefone', telefone);
  }

  Future<void> saveInfoInitial({
    required String nomeFantasia,
    required String razaoSocial,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('setNomeFantasia', nomeFantasia);
    await prefs.setString('setRazaoSocial', razaoSocial);
  }

  Future<void> saveCep({
    required String cep,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('setCep', cep);
  }

  Future<void> saveLocalization({
    required String estado,
    required String bairro,
    required String rua,
    required String numero,
    required String complemento,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('setEstado', estado);
    await prefs.setString('setBairro', bairro);
    await prefs.setString('setRua', rua);
    await prefs.setString('setNumero', numero);
    await prefs.setString('setCompleto', complemento);
  }
}
