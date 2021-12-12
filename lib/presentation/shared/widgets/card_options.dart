import 'package:flutter/material.dart';

class CardOptionsWidget extends StatelessWidget {
  final String titleService;
  final String subTitleService;
  final IconData icon;
  final Function() function;
  final Color colorBackground;
  final String imageDirectory;

  CardOptionsWidget({
    required this.titleService,
    required this.subTitleService,
    required this.icon,
    required this.colorBackground,
    required this.function,
    required this.imageDirectory,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        //height: 150,
        //width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorBackground,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              child: Image.asset(
                imageDirectory,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                titleService,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(subTitleService),
            )
          ],
        ),
      ),
    );
  }
}
