import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  // final String password;
  final String postId;
  final DateTime datePublished;
  // final Uint8List file;
  final String postUrl;
  final String profileImage;
  final likes;

  const Post({
    required this.description,
    required this.uid,
    required this.username,
    // required this.password,
    required this.datePublished,
    required this.likes,
    required this.postId,
    required this.postUrl,
    required this.profileImage,
  });
  Map<String, dynamic> toJson() => {
        'username': username,
        "uid": uid,
        "description": description,
        "likes": likes,
        "datePublished": datePublished,
        "postId": postId,
        "postUrl": postUrl,
        "profileImage": profileImage,
      };
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data as Map<String, dynamic>;
    print(snapshot);
    return Post(
      description: snapshot['description'],
      uid: snapshot['uid'],
      username: snapshot['username'],
      likes: snapshot['likes'],
      datePublished: snapshot['datePublished'],
      postId: snapshot['postId'],
      postUrl: snapshot['postUrl'],
      profileImage: snapshot['profileImage'],
    );
  }
}
