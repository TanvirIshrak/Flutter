import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

/// Firestore service for CRUD operations on tasks collection
class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Collection reference
  static const String _tasksCollection = 'tasks';

  CollectionReference<Map<String, dynamic>> get _tasksRef =>
      _firestore.collection(_tasksCollection);

  // ==================== CREATE ====================

  /// Add a new task to Firestore
  /// Returns the document ID of the created task
  Future<String> addTask(Task task) async {
    try {
      final docRef = await _tasksRef.add(task.toFirestore());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw FirestoreServiceException('Failed to add task: ${e.message}');
    }
  }

  /// Add a task with a specific document ID
  Future<void> addTaskWithId(String docId, Task task) async {
    try {
      await _tasksRef.doc(docId).set(task.toFirestore());
    } on FirebaseException catch (e) {
      throw FirestoreServiceException(
          'Failed to add task with ID: ${e.message}');
    }
  }

  // ==================== READ ====================

  /// Get a single task by ID (one-time read)
  Future<Task?> getTask(String taskId) async {
    try {
      final doc = await _tasksRef.doc(taskId).get();
      if (doc.exists) {
        return Task.fromFirestore(doc);
      }
      return null;
    } on FirebaseException catch (e) {
      throw FirestoreServiceException('Failed to get task: ${e.message}');
    }
  }

  /// Get all tasks for a user (one-time read)
  Future<List<Task>> getTasksForUser(String userId) async {
    try {
      final snapshot = await _tasksRef
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList();
    } on FirebaseException catch (e) {
      throw FirestoreServiceException('Failed to get tasks: ${e.message}');
    }
  }

  /// Get all tasks (one-time read)
  Future<List<Task>> getAllTasks() async {
    try {
      final snapshot =
          await _tasksRef.orderBy('createdAt', descending: true).get();

      return snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList();
    } on FirebaseException catch (e) {
      throw FirestoreServiceException('Failed to get all tasks: ${e.message}');
    }
  }

  // ==================== REAL-TIME STREAMS ====================

  /// Stream of all tasks for a specific user (real-time updates)
  Stream<List<Task>> streamTasksForUser(String userId) {
    return _tasksRef
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList());
  }

  /// Stream of a single task (real-time updates)
  Stream<Task?> streamTask(String taskId) {
    return _tasksRef.doc(taskId).snapshots().map((doc) {
      if (doc.exists) {
        return Task.fromFirestore(doc);
      }
      return null;
    });
  }

  /// Stream of completed tasks for a user
  Stream<List<Task>> streamCompletedTasks(String userId) {
    return _tasksRef
        .where('userId', isEqualTo: userId)
        .where('isCompleted', isEqualTo: true)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList());
  }

  /// Stream of pending (incomplete) tasks for a user
  Stream<List<Task>> streamPendingTasks(String userId) {
    return _tasksRef
        .where('userId', isEqualTo: userId)
        .where('isCompleted', isEqualTo: false)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList());
  }

  // ==================== UPDATE ====================

  /// Update an existing task
  Future<void> updateTask(String taskId, Task task) async {
    try {
      final updatedTask = task.copyWith(updatedAt: DateTime.now());
      await _tasksRef.doc(taskId).update(updatedTask.toFirestore());
    } on FirebaseException catch (e) {
      throw FirestoreServiceException('Failed to update task: ${e.message}');
    }
  }

  /// Update specific fields of a task
  Future<void> updateTaskFields(
      String taskId, Map<String, dynamic> fields) async {
    try {
      fields['updatedAt'] = Timestamp.fromDate(DateTime.now());
      await _tasksRef.doc(taskId).update(fields);
    } on FirebaseException catch (e) {
      throw FirestoreServiceException(
          'Failed to update task fields: ${e.message}');
    }
  }

  /// Toggle task completion status
  Future<void> toggleTaskCompletion(String taskId, bool isCompleted) async {
    try {
      await _tasksRef.doc(taskId).update({
        'isCompleted': isCompleted,
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      });
    } on FirebaseException catch (e) {
      throw FirestoreServiceException(
          'Failed to toggle task completion: ${e.message}');
    }
  }

  // ==================== DELETE ====================

  /// Delete a task by ID
  Future<void> deleteTask(String taskId) async {
    try {
      await _tasksRef.doc(taskId).delete();
    } on FirebaseException catch (e) {
      throw FirestoreServiceException('Failed to delete task: ${e.message}');
    }
  }

  /// Delete all tasks for a user
  Future<void> deleteAllTasksForUser(String userId) async {
    try {
      final snapshot =
          await _tasksRef.where('userId', isEqualTo: userId).get();

      final batch = _firestore.batch();
      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
    } on FirebaseException catch (e) {
      throw FirestoreServiceException(
          'Failed to delete all tasks: ${e.message}');
    }
  }

  /// Delete all completed tasks for a user
  Future<void> deleteCompletedTasks(String userId) async {
    try {
      final snapshot = await _tasksRef
          .where('userId', isEqualTo: userId)
          .where('isCompleted', isEqualTo: true)
          .get();

      final batch = _firestore.batch();
      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
    } on FirebaseException catch (e) {
      throw FirestoreServiceException(
          'Failed to delete completed tasks: ${e.message}');
    }
  }

  // ==================== BATCH OPERATIONS ====================

  /// Add multiple tasks in a batch
  Future<void> addTasksBatch(List<Task> tasks) async {
    try {
      final batch = _firestore.batch();
      for (final task in tasks) {
        final docRef = _tasksRef.doc();
        batch.set(docRef, task.toFirestore());
      }
      await batch.commit();
    } on FirebaseException catch (e) {
      throw FirestoreServiceException(
          'Failed to add tasks in batch: ${e.message}');
    }
  }

  /// Update multiple tasks in a batch
  Future<void> updateTasksBatch(Map<String, Task> tasksToUpdate) async {
    try {
      final batch = _firestore.batch();
      for (final entry in tasksToUpdate.entries) {
        final docRef = _tasksRef.doc(entry.key);
        final updatedTask = entry.value.copyWith(updatedAt: DateTime.now());
        batch.update(docRef, updatedTask.toFirestore());
      }
      await batch.commit();
    } on FirebaseException catch (e) {
      throw FirestoreServiceException(
          'Failed to update tasks in batch: ${e.message}');
    }
  }
}

/// Custom exception for Firestore service errors
class FirestoreServiceException implements Exception {
  final String message;

  FirestoreServiceException(this.message);

  @override
  String toString() => 'FirestoreServiceException: $message';
}

