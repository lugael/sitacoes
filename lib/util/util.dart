import 'package:apptexto/model/conteudo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class AppDatabse{
  late Database _db;
  static const String nomeTabela = 'conteudo';
  static const String colunaId = 'id';
  static const String colunaTexto = 'texto';

  criarOuConectar() async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'base.db');
    _db = await openDatabase( path,version: 1, onCreate: (database, version) async{
      await database.execute("CREATE TABLE $nomeTabela($colunaId INTEGER PRIMARY KEY AUTOINCREMENT, $colunaTexto TEXT);");
    });
  }

  salvar(String texto) async{
    Map<String,dynamic> mapa = {colunaTexto: texto};
    await _db.insert(nomeTabela, mapa);
  }

  Future<Conteudo?> ler() async{
    List<Map<String, dynamic>> values = await _db.rawQuery("SELECT * FROM $nomeTabela");
    if(values.length > 0 ){
      Map<String,dynamic> primeiroElemento = values.first;
      return Conteudo(id: primeiroElemento[colunaId], texto: primeiroElemento[colunaTexto]);
    }
  }

  remover() async{
    await _db.delete(nomeTabela);
  }
}