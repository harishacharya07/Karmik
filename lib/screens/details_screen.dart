import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmik/providers/comment.dart';
import 'package:karmik/providers/labour.dart';
import 'package:karmik/widgets/enlarged_image_widget.dart';
import 'package:karmik/widgets/loading_widget.dart';
import 'package:karmik/widgets/machinery_widget.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rating_bar/rating_bar.dart';

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

  String? id;

  @override
  Widget build(BuildContext context) {
    RenderBox? box = context.findRenderObject() as RenderBox;
    id = ModalRoute.of(context)!.settings.arguments as String;
    final comments = Provider.of<CommentProvider>(context);

    final details = Provider.of<Labours>(context).findById(id!);

    final databaseRef = FirebaseDatabase.instance
        .reference()
        .child('migrant')
        .child(details.id)
        .child('comments');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: GestureDetector(
              onTap: () {
                Share.share(
                  'Iam sharing contact with you form Karmik\n'
                  'Name: ${details.name}\n'
                  'Contact: ${details.mobile} ',
                  subject: "Details",
                  sharePositionOrigin:
                      box.localToGlobal(Offset.zero) & box.size,
                );
              },
              child: Icon(
                Icons.share,
                color: Color(
                  0xff003366,
                ),
              ),
            ),
          ),
        ],
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      EnlargedImageWidget.routeName,
                      arguments: details.imageUrl,
                    );
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user.png'),
                    radius: 42,
                    foregroundImage: NetworkImage(
                      details.imageUrl,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              details.name,
              style: GoogleFonts.roboto(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RatingBar(
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              initialRating: 3,
              filledColor: Colors.yellow,
              size: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    launch(
                      'tel://${details.mobile}',
                    );
                  },
                  label: Text(
                    'Call',
                    style: GoogleFonts.roboto(
                      color: Color(
                        0xff003366,
                      ),
                      fontSize: 18,
                    ),
                  ),
                  icon: Icon(
                    Icons.call,
                    color: Color(
                      0xff003366,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                OutlinedButton.icon(
                  label: Text(
                    'Message',
                    style: GoogleFonts.roboto(
                      color: Color(0xff003366),
                      fontSize: 18,
                    ),
                  ),
                  icon: Icon(
                    Icons.message,
                    color: Color(0xff003366),
                  ),
                  onPressed: () {
                  },
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.358,
                child: Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.place,
                          color: Color(
                            0xff003366,
                          ),
                        ),
                        title: Text(details.location),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.work,
                          color: Color(
                            0xff003366,
                          ),
                        ),
                        title: Text('${details.experience} years'),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.currency_rupee,
                          color: Color(
                            0xff003366,
                          ),
                        ),
                        title: Text('${details.price}'),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Divider(
            //   thickness: 1,
            // ),
            // ListTile(
            //   leading: Icon(Icons.person),
            //   title: Text(details.name),
            // ),
            // Divider(
            //   thickness: 1,
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.place,
            //   ),
            //   title: Text(
            //     details.location,
            //   ),
            // ),
            // Divider(
            //   thickness: 1,
            // ),
            // ListTile(
            //   leading: Icon(Icons.work),
            //   title: Text(details.experience),
            // ),
            // Divider(
            //   thickness: 1,
            // ),
            // ListTile(
            //   leading: Icon(Icons.update),
            //   //title: Text(details.age),
            // ),
            // Divider(
            //   thickness: 1,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Comment',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                OutlinedButton.icon(
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
                                    }).then((value) {});
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
              child: comments.comments.isEmpty
                  ? Center(
                      child: Text("No comments"),
                    )
                  : _isLoading
                      ? LoadingWidget()
                      : ListView.builder(
                          itemCount: comments.comments.length,
                          itemBuilder: (context, index) {
                            return comments.comments.isEmpty
                                ? Center(
                                    child:
                                        Image.asset('assets/images/login.png'),
                                  )
                                : Column(
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
