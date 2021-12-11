import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Container(
            //   width: 200,
            //   height: 200,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(100),
            //     image: DecorationImage(
            //       image: AssetImage("images/profile/ball.png"),
            //     ),
            //   ),
            //   alignment: Alignment.center,
            //   child: Text("BALL"),
            // ),
            Row(
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage("images/profile/ball.png"),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pattarapon Lertratananont",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[700],
                        ),
                        overflow: TextOverflow.fade,
                        // softWrap: false,
                      ),
                      SizedBox(height: 8),
                      Text("0849742150"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
