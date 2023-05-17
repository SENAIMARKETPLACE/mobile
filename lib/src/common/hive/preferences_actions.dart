// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep/src/common/hive/access.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesActions {
  static Future<void> save(Access acess) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', acess.nome);
    await prefs.setString('name_p', acess.nomeProprietario);
    await prefs.setString('photo', acess.foto);
    await prefs.setString('id', acess.id);
  }

  static Future<Access> load() async {
    final prefs = await SharedPreferences.getInstance();
    return Access(
      nome: prefs.getString('name') ?? '',
      nomeProprietario: prefs.getString('name_p') ?? '',
      foto: prefs.getString('photo') ?? '',
      id: prefs.getString('id') ?? '',
    );
  }
}
