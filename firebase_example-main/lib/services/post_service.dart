import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post_model.dart';

/// Firestore service for CRUD operations on posts collection
class PostService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Collection reference
  static const String _postsCollection = 'posts';

  CollectionReference<Map<String, dynamic>> get _postsRef =>
      _firestore.collection(_postsCollection);

  // ==================== CREATE ====================

  /// Add a new post to Firestore
  /// Returns the document ID of the created post
  Future<String> addPost(Post post) async {
    try {
      final docRef = await _postsRef.add(post.toFirestore());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw PostServiceException('Failed to add post: ${e.message}');
    }
  }

  /// Add a post with a specific document ID
  Future<void> addPostWithId(String docId, Post post) async {
    try {
      await _postsRef.doc(docId).set(post.toFirestore());
    } on FirebaseException catch (e) {
      throw PostServiceException('Failed to add post with ID: ${e.message}');
    }
  }

  // ==================== READ ====================

  /// Get a single post by ID (one-time read)
  Future<Post?> getPost(String postId) async {
    try {
      final doc = await _postsRef.doc(postId).get();
      if (doc.exists) {
        return Post.fromFirestore(doc);
      }
      return null;
    } on FirebaseException catch (e) {
      throw PostServiceException('Failed to get post: ${e.message}');
    }
  }

  /// Get all posts for a user (one-time read)
  Future<List<Post>> getPostsByUser(String userId) async {
    try {
      final snapshot = await _postsRef
          .where('authorId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs.map((doc) => Post.fromFirestore(doc)).toList();
    } on FirebaseException catch (e) {
      throw PostServiceException('Failed to get posts: ${e.message}');
    }
  }

  /// Get all published posts (one-time read)
  Future<List<Post>> getAllPublishedPosts() async {
    try {
      final snapshot = await _postsRef
          .where('isPublished', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs.map((doc) => Post.fromFirestore(doc)).toList();
    } on FirebaseException catch (e) {
      throw PostServiceException('Failed to get all posts: ${e.message}');
    }
  }

  /// Get posts by tag
  Future<List<Post>> getPostsByTag(String tag) async {
    try {
      final snapshot = await _postsRef
          .where('tags', arrayContains: tag)
          .where('isPublished', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs.map((doc) => Post.fromFirestore(doc)).toList();
    } on FirebaseException catch (e) {
      throw PostServiceException('Failed to get posts by tag: ${e.message}');
    }
  }

  // ==================== REAL-TIME STREAMS ====================

  /// Stream of all posts for a specific user (real-time updates)
  Stream<List<Post>> streamPostsByUser(String userId) {
    return _postsRef
        .where('authorId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Post.fromFirestore(doc)).toList());
  }

  /// Stream of all published posts (real-time updates)
  Stream<List<Post>> streamAllPublishedPosts() {
    return _postsRef
        .where('isPublished', isEqualTo: true)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Post.fromFirestore(doc)).toList());
  }

  /// Stream of a single post (real-time updates)
  Stream<Post?> streamPost(String postId) {
    return _postsRef.doc(postId).snapshots().map((doc) {
      if (doc.exists) {
        return Post.fromFirestore(doc);
      }
      return null;
    });
  }

  /// Stream of posts by tag
  Stream<List<Post>> streamPostsByTag(String tag) {
    return _postsRef
        .where('tags', arrayContains: tag)
        .where('isPublished', isEqualTo: true)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Post.fromFirestore(doc)).toList());
  }

  /// Stream of trending posts (most liked)
  Stream<List<Post>> streamTrendingPosts({int limit = 10}) {
    return _postsRef
        .where('isPublished', isEqualTo: true)
        .orderBy('likesCount', descending: true)
        .limit(limit)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Post.fromFirestore(doc)).toList());
  }

  // ==================== UPDATE ====================

  /// Update an existing post
  Future<void> updatePost(String postId, Post post) async {
    try {
      final updatedPost = post.copyWith(updatedAt: DateTime.now());
      await _postsRef.doc(postId).update(updatedPost.toFirestore());
    } on FirebaseException catch (e) {
      throw PostServiceException('Failed to update post: ${e.message}');
    }
  }

  /// Update specific fields of a post
  Future<void> updatePostFields(
      String postId, Map<String, dynamic> fields) async {
    try {
      fields['updatedAt'] = Timestamp.fromDate(DateTime.now());
      await _postsRef.doc(postId).update(fields);
    } on FirebaseException catch (e) {
      throw PostServiceException('Failed to update post fields: ${e.message}');
    }
  }

  /// Toggle like on a post
  Future<void> toggleLike(String postId, String userId) async {
    try {
      final doc = await _postsRef.doc(postId).get();
      if (!doc.exists) return;

      final post = Post.fromFirestore(doc);
      final isLiked = post.likedBy.contains(userId);

      if (isLiked) {
        // Unlike
        await _postsRef.doc(postId).update({
          'likedBy': FieldValue.arrayRemove([userId]),
          'likesCount': FieldValue.increment(-1),
          'updatedAt': Timestamp.fromDate(DateTime.now()),
        });
      } else {
        // Like
        await _postsRef.doc(postId).update({
          'likedBy': FieldValue.arrayUnion([userId]),
          'likesCount': FieldValue.increment(1),
          'updatedAt': Timestamp.fromDate(DateTime.now()),
        });
      }
    } on FirebaseException catch (e) {
      throw PostServiceException('Failed to toggle like: ${e.message}');
    }
  }

  /// Toggle publish/draft status
  Future<void> togglePublishStatus(String postId, bool isPublished) async {
    try {
      await _postsRef.doc(postId).update({
        'isPublished': isPublished,
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      });
    } on FirebaseException catch (e) {
      throw PostServiceException(
          'Failed to toggle publish status: ${e.message}');
    }
  }

  /// Increment comments count
  Future<void> incrementCommentsCount(String postId) async {
    try {
      await _postsRef.doc(postId).update({
        'commentsCount': FieldValue.increment(1),
      });
    } on FirebaseException catch (e) {
      throw PostServiceException(
          'Failed to increment comments count: ${e.message}');
    }
  }

  /// Decrement comments count
  Future<void> decrementCommentsCount(String postId) async {
    try {
      await _postsRef.doc(postId).update({
        'commentsCount': FieldValue.increment(-1),
      });
    } on FirebaseException catch (e) {
      throw PostServiceException(
          'Failed to decrement comments count: ${e.message}');
    }
  }

  // ==================== DELETE ====================

  /// Delete a post by ID
  Future<void> deletePost(String postId) async {
    try {
      await _postsRef.doc(postId).delete();
    } on FirebaseException catch (e) {
      throw PostServiceException('Failed to delete post: ${e.message}');
    }
  }

  /// Delete all posts for a user
  Future<void> deleteAllPostsByUser(String userId) async {
    try {
      final snapshot =
          await _postsRef.where('authorId', isEqualTo: userId).get();

      final batch = _firestore.batch();
      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
    } on FirebaseException catch (e) {
      throw PostServiceException('Failed to delete all posts: ${e.message}');
    }
  }

  /// Delete all draft posts for a user
  Future<void> deleteDraftPosts(String userId) async {
    try {
      final snapshot = await _postsRef
          .where('authorId', isEqualTo: userId)
          .where('isPublished', isEqualTo: false)
          .get();

      final batch = _firestore.batch();
      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
    } on FirebaseException catch (e) {
      throw PostServiceException('Failed to delete draft posts: ${e.message}');
    }
  }

  // ==================== BATCH OPERATIONS ====================

  /// Add multiple posts in a batch
  Future<void> addPostsBatch(List<Post> posts) async {
    try {
      final batch = _firestore.batch();
      for (final post in posts) {
        final docRef = _postsRef.doc();
        batch.set(docRef, post.toFirestore());
      }
      await batch.commit();
    } on FirebaseException catch (e) {
      throw PostServiceException('Failed to add posts in batch: ${e.message}');
    }
  }

  /// Update multiple posts in a batch
  Future<void> updatePostsBatch(Map<String, Post> postsToUpdate) async {
    try {
      final batch = _firestore.batch();
      for (final entry in postsToUpdate.entries) {
        final docRef = _postsRef.doc(entry.key);
        final updatedPost = entry.value.copyWith(updatedAt: DateTime.now());
        batch.update(docRef, updatedPost.toFirestore());
      }
      await batch.commit();
    } on FirebaseException catch (e) {
      throw PostServiceException(
          'Failed to update posts in batch: ${e.message}');
    }
  }
}

/// Custom exception for Post service errors
class PostServiceException implements Exception {
  final String message;

  PostServiceException(this.message);

  @override
  String toString() => 'PostServiceException: $message';
}

