import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'comment_card.dart';

class Comments extends StatefulWidget {
  final snap;
  const Comments({super.key, required this.snap});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  Stream? _stream;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stream = FirebaseFirestore.instance
        .collection('post')
        .doc(widget.snap['postId'])
        .collection('comments')
        .orderBy(
          'datePublished',
          descending: true,
        )
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _stream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          print("${snapshot.connectionState}------------------");
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: (snapshot.data as dynamic).docs.length,
              itemBuilder: (context, index) => CommentCard(
                    snap: snapshot.data!.docs[index],
                  ));
        }
      },
    );
  }
}
