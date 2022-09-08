import 'package:apptexto/model/conteudo.dart';

abstract class StorageDao{

  Future<void> criarOuConectar();
  Future<void> salvar(String texto);
  Future<Conteudo?> ler();
  Future<void> remover();

}