import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/note.dart';

class FirestoreNoteService {
  FirestoreNoteService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _notesCollection {
    return _firestore.collection('notes');
  }

  Stream<List<Note>> watchNotes() {
    return _notesCollection.orderBy('title').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Note.fromMap(id: doc.id, map: doc.data()))
          .toList();
    });
  }

  Future<void> createNote({
    required String title,
    required String description,
  }) async {
    await _notesCollection.add({'title': title, 'description': description});
  }

  Future<void> updateNote({
    required String id,
    required String title,
    required String description,
  }) async {
    await _notesCollection.doc(id).update({
      'title': title,
      'description': description,
    });
  }

  Future<void> deleteNote({required String id}) async {
    await _notesCollection.doc(id).delete();
  }
}
