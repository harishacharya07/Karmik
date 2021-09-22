import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/engineer_category_screen.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.2,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                EngineerCategoryScreen.routeName,
              );
            },
            child: Card(
              color: Color(0xfff1f3f6),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.egg,
                ),
              ),
            ),
          ),
        ),
        Text('Engineer'),
      ],
    );
  }
}
