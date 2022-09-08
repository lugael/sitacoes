import 'package:apptexto/model/conteudo.dart';
import 'package:dio/dio.dart';
import 'package:apptexto/dao/storage_dao.dart';

class StorageDaoApi implements StorageDao {

  Future<void> criarOuConectar() async{

  }

  Future<Conteudo?> ler() async{
    var response = await Dio().get('http://192.168.0.49:8080/conteudo');
    return response.data['texto'];
  }

  @override
  Future<void> remover() async{
    var response = await Dio().delete('http://192.168.0.49:8080/conteudo');
  }

  @override
  Future<void> salvar(String texto) async{
    var conteudo = {"texto": texto};
    var response = await Dio().post('/conteudo', data: {'$texto'});
  }

}