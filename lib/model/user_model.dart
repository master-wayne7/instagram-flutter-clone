import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String username;
  // final String password;
  final String bio;
  final String photoUrl;
  // final Uint8List file;
  final List followers;
  final List following;

  const User({
    required this.email,
    required this.uid,
    required this.username,
    // required this.password,
    required this.bio,
    required this.photoUrl,
    required this.followers,
    required this.following,
  });
  Map<String, dynamic> toJson() => {
        'username': username,
        "uid": uid,
        "email": email,
        "bio": bio,
        "followers": followers,
        "following": following,
        "photoUrl": photoUrl,
      };
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data as Map<String, dynamic>;
    print(snapshot);
    return User(
      email: snapshot['email'],
      uid: snapshot['uid'],
      username: snapshot['username'],
      bio: snapshot['bio'],
      photoUrl: snapshot['photoUrl'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}
