import 'package:shared_preferences/shared_preferences.dart';

class Register {
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

  Future setCnpj(String cnpj) async {
    final prefs = await pref;
    return prefs.setString('setCnpj', cnpj);
  }

  Future setEmail(String email) async {
    final prefs = await pref;
    return prefs.setString('setEmail', email);
  }

  Future setSenha(String senha) async {
    final prefs = await pref;
    return prefs.setString('setSenha', senha);
  }

  Future setTelefone(String telefone) async {
    final prefs = await pref;
    return prefs.setString('setTelefone', telefone);
  }

  Future setNomeFantasia(String nomeFant) async {
    final prefs = await pref;
    return prefs.setString('setNomeFantasia', nomeFant);
  }

  Future setRazaoSocial(String razao) async {
    final prefs = await pref;
    return prefs.setString('setRazaoSocial', razao);
  }

  Future saveCep(String cep) async {
    final prefs = await pref;
    prefs.setString('setCep', cep);
  }

  Future saveRua(String rua) async {
    final prefs = await pref;
    prefs.setString('setRua', rua);
  }

  Future saveBairro(String bairro) async {
    final prefs = await pref;
    prefs.setString('setBairro', bairro);
  }

  Future saveCidade(String cidade) async {
    final prefs = await pref;
    prefs.setString('setCidade', cidade);
  }

  Future saveEstado(String estado) async {
    final prefs = await pref;
    prefs.setString('setEstado', estado);
  }

  Future saveNumero(String numero) async {
    final prefs = await pref;
    prefs.setString('setNumero', numero);
  }

  Future saveComplemento(String compl) async {
    final prefs = await pref;
    prefs.setString('setCompl', compl);
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
      'compto': p.getString('setCompl') ?? '',
    };
  }
}
