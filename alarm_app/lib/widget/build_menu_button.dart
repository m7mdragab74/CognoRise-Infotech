import 'package:flutter/material.dart';

class BuildMenuButton extends StatelessWidget {
  BuildMenuButton({
    super.key,
    this.image,
    this.title,
  });
  String? title, image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: MaterialButton(
        onPressed: () {},
        child: Column(
          children: [
            Image.asset(
              image!,
              scale: 1.5,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              title ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'avenir',
              ),
            )
          ],
        ),
      ),
    );
  }
}
