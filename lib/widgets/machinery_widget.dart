import 'package:flutter/material.dart';
import 'package:karmik/screens/details_screen.dart';

class MachineryWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;

  MachineryWidget({
    required this.id,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size.width;
    final _mediaQueryHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: 100,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            DetailsScreen.routeName,
            arguments: id,
          );
        },
        child: Card(
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  width: _mediaQuery * 0.28,
                  height: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageUrl),
                      placeholder: AssetImage(
                        'assets/images/login.png',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        child: Text(title),
                      ),
                      Text(id),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
