import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/providers/comment.dart';
import 'package:karmik/providers/labour.dart';
import 'package:karmik/widgets/comments_widget.dart';
import 'package:karmik/widgets/loading_widget.dart';
import 'package:karmik/widgets/machinery_widget.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  static final routeName = '/detailsScreen';


  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final user = FirebaseAuth.instance.currentUser;

  var _isLoading = false;
  var _isInit = true;

  final comment = TextEditingController();

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments.toString();
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
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final comments = Provider.of<CommentProvider>(context);

    final details = Provider.of<Labours>(context).findById(id);

    final databaseRef = FirebaseDatabase.instance
        .reference()
        .child('migrant')
        .child(details.id)
        .child('comments');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Details',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Color(
              0xff003366,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: Hero(
                tag: details.id,
                child: CircleAvatar(
                  radius: 42,
                  foregroundImage: NetworkImage(
                    details.imageUrl,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(details.name),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.place,
              ),
              title: Text(
                details.location,
              ),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(details.mobile),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text(details.experience),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text(details.age),
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Comment',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                    20,
                                  ),
                                  child: TextFormField(
                                    controller: comment,
                                    keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(
                                      filled: true,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    databaseRef.push().set({
                                      'user': user!.photoURL,
                                      'name': user!.displayName,
                                      'comment': comment.text,
                                    }).then((value) {
                                    });
                                  },
                                  child: Text('Submit'),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  label: Text(
                    'New Comment',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 200,
              child: _isLoading
                  ? LoadingWidget()
                  : ListView.builder(
                      itemCount: comments.comments.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 18,
                                foregroundImage: NetworkImage(
                                  comments.comments[index].imageUrl,
                                ),
                              ),
                              title: Text(
                                comments.comments[index].comment,
                              ),
                            ),
                            Divider(
                              thickness: 1,
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      // body: CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       floating: true,
      //       expandedHeight: 160.0,
      //       flexibleSpace: FlexibleSpaceBar(
      //         background: Hero(
      //           tag: details.id,
      //           child: Image(
      //             fit: BoxFit.cover,
      //             image: NetworkImage(
      //               details.imageUrl,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     SliverList(
      //       delegate: SliverChildListDelegate(
      //         [
      //           Text(details.name),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
