import 'package:flutter/material.dart';

class LandingCustommerScreen extends StatelessWidget {
  const LandingCustommerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Create custommer account",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                size: 35,
                color: Colors.cyan,
              ),
              onPressed: () {},
            )
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.cyan,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        14,
                      ),
                      topRight: Radius.circular(
                        14,
                      ),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        14,
                      ),
                      topRight: Radius.circular(
                        14,
                      ),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.photo,
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    ));
  }
}
