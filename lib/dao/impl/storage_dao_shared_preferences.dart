import 'package:apptexto/model/conteudo.dart';
import 'package:apptexto/dao/storage_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageDaoShared implements StorageDao{

  static const String key = 'conteudo';
  late final prefs;

  Future<void> criarOuConectar() async{
    prefs = await SharedPreferences.getInstance();
  }

  Future<Conteudo?> ler() async {
    final String? action = prefs.getString(key);
    return Conteudo(id: 1, texto: action);
  }

  Future<void> remover() async {
    await prefs.remove(key);
  }

  Future<void> salvar(String texto) async {
    await prefs.setString(key, texto);
  }

}