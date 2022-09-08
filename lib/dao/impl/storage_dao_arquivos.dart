import 'dart:io';

import 'package:apptexto/model/conteudo.dart';
import 'package:apptexto/dao/storage_dao.dart';
import 'package:path_provider/path_provider.dart';

class StorageDaoFile implements StorageDao{


  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<File> writeTexto(String texto) async {
    final file = await _localFile;

    return file.writeAsString('Conteúdo: $texto');
  }

  Future<String> readTexto() async {
    try {
      final file = await _localFile;
      // Read the file
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return '';
    }
  }

  Future<void> deleteFile() async{
    try{
      final file = await _localFile;

      await file.delete();
    }catch(e){
      print('Deu ruim');
    }
  }

  Future<void> criarOuConectar() async {
    await _localPath;
    await _localFile;
  }

  Future<Conteudo?> ler() async {
    String texto = await readTexto();
    if(texto.isNotEmpty){
      return Conteudo(id: 1,texto: texto);
    }
    return null;
  }

  Future<void> remover() async {
    deleteFile();
  }

  Future<void> salvar(String texto) async {
    writeTexto(texto);
  }

}