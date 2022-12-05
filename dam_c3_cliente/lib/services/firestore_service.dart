import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //obtener noticias
  Stream<QuerySnapshot> noticias() {
    return FirebaseFirestore.instance.collection('noticias').snapshots();
    //return FirebaseFirestore.instance.collection('productos').Where('stock', isLessThan:10).snapshots();
  }

  //agregar noticia
  Future agregar(String titulo, String descripcion) {
    return FirebaseFirestore.instance.collection('noticias').doc().set({
      'titulo': titulo,
      'descripcion': descripcion,
    });
  }
}
