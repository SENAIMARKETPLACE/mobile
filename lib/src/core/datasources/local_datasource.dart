import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final Future<SharedPreferences> pref = SharedPreferences.getInstance();

  Map<String, String> mapController({
    String? cnpj,
    String? email,
    String? senha,
    String? telefone,
    String? nomeFantasia,
    String? razaoSocial,
    String? cep,
    String? rua,
    String? numero,
    String? estado,
    String? bairro,
    String? cidade,
    String? compto,
  }) {
    return {
      'cnpj': cnpj ?? '',
      'email': email ?? '',
      'senha': senha ?? '',
      'telefone': telefone ?? '',
      'nomeFantasia': nomeFantasia ?? '',
      'razaoSocial': razaoSocial ?? '',
      'cep': cep ?? '',
      'rua': rua ?? '',
      'numero': numero ?? '',
      'estado': estado ?? '',
      'bairro': bairro ?? '',
      'cidade': cidade ?? '',
      'compto': compto ?? '',
    };
  }

  Future setCnpj(Map<String, String> map) async {
    final prefs = await pref;
    return prefs.setString('setCnpj', map['cnpj']!);
  }

  Future<void> saveDataAccess(Map<String, String> map) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('setEmail', map['email']!);
    await prefs.setString('setSenha', map['senha']!);
    await prefs.setString('setTelefone', map['telefone']!);
  }

  Future<void> saveInfoInitial(Map<String, String> map) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('setNomeFantasia', map['nomeFantasia']!);
    await prefs.setString('setRazaoSocial', map['razaoSocial']!);
  }

  Future<void> saveCep(Map<String, String> map) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('setCep', map['cep']!);
  }

  Future<void> saveLocalization(Map<String, String> map) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('setEstado', map['estado']!);
    await prefs.setString('setBairro', map['bairro']!);
    await prefs.setString('setRua', map['rua']!);
    await prefs.setString('setNumero', map['numero']!);
    await prefs.setString('setCompleto', map['complemento']!);
    await prefs.setString('setCidade', map['cidade']!);
  }

  Future<Map<String, String>> loadDate() async {
    final SharedPreferences p = await SharedPreferences.getInstance();


    return {
      'cnpj': p.getString('setCnpj') ?? '',
      'email': p.getString('setEmail') ?? '',
      'senha': p.getString('setSenha') ?? '',
      'telefone': p.getString('setTelefone') ?? '',
      'nomeFantasia': p.getString('setNomeFantasia') ?? '',
      'razaoSocial': p.getString('setRazaoSocial') ?? '',
      'cep': p.getString('setCep') ?? '',
      'rua': p.getString('setRua') ?? '',
      'numero': p.getString('setNumero') ?? '',
      'estado': p.getString('setEstado') ?? '',
      'bairro': p.getString('setBairro') ?? '',
      'cidade': p.getString('setCidade') ?? '',
      'compto': p.getString('setCompleto') ?? '',
    };
  }
}
