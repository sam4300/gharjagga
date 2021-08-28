import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {

  static const  routeName = '/categoryItems';
  final String imageUrl;
  final String title;
  const CategoryCard(this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          child: Image.asset(imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
