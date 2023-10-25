import 'package:cloud_firestore/cloud_firestore.dart';

class GetIds {
  Future<String?> fetchPostIdByTitle(String postTitle) async {
    String? postId;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .where('title', isEqualTo: postTitle)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      postId = querySnapshot.docs.first.id;
    }

    return postId;
  }

  /*
  Future<List<DocumentSnapshot>> fetchCombinedData(String userId, String postId) async {
    final userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    final postSnapshot =
        await FirebaseFirestore.instance.collection('posts').doc(postId).get();

    return [userSnapshot, postSnapshot];
  }
  */
}
