import 'package:apptexto/dao/storage_dao.dart';
import 'package:apptexto/model/conteudo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StorageDaoFirebase extends StorageDao{
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<void> criarOuConectar() async {}

  @override
  Future<Conteudo?> ler() async{
    await db.collection("conteudo").get().then((event){
      for(var doc in event.docs){
        print("${doc.id} => ${doc.data()}");
      }
    });
  }

  @override
  Future<void> remover() async{
   db.collection("conteudo").doc("texto").delete().then(
     (doc)=> print("Documento deletado"),
     onError: (e) => print("Erro altualizar o documento $e"),
   );
  }

  @override
  Future<void> salvar(String texto) async {
    final user = <String, dynamic>{
      "texto": "$texto"
    };

    db.collection("conteudo").add(user).then((DocumentReference doc) => print("Documento adicionado com id: ${doc.id}") );
  }

}