import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karmik/widgets/category_item_widget.dart';

class EngineerCategoryScreen extends StatelessWidget {
  static final routeName = '/engineer_category';

  const EngineerCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20),
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryItemWidget(),
                CategoryItemWidget(),
                CategoryItemWidget(),
                CategoryItemWidget(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryItemWidget(),
                CategoryItemWidget(),
                CategoryItemWidget(),
                CategoryItemWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}