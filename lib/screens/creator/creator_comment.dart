import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karmik/providers/comment.dart';
import 'package:provider/provider.dart';

class CreatorCommentScreen extends StatefulWidget {
  const CreatorCommentScreen({Key? key}) : super(key: key);

  @override
  _CreatorCommentScreenState createState() => _CreatorCommentScreenState();
}

class _CreatorCommentScreenState extends State<CreatorCommentScreen> {
  final user = FirebaseAuth.instance.currentUser;

  var _isLoading = false;
  var _isInit = true;

  final comment = TextEditingController();

  @override
  void didChangeDependencies() {
    final args = FirebaseAuth.instance.currentUser!.uid;
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
    }
    Provider.of<CommentProvider>(context).fetch(args).then((value) {
      setState(() {
        _isLoading = false;
        _isInit = false;
      });
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _comments = Provider.of<CommentProvider>(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: _comments.comments.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    _comments.comments[index].imageUrl,
                  ),
                ),
                title: Text(
                  _comments.comments[index].comment,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
