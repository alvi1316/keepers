import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(87, 24, 158, 82),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              splashColor: Colors.red,
              onTap: () {
                Navigator.pushNamed(context, '/parentlogin');
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                width: 200,
                height: 200,
                child: Column(
                  children: [
                    Image.asset('assets/main2.jpg'),
                    Text("Parent Login")
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              splashColor: Colors.red,
              onTap: () {
                Navigator.pushNamed(context, '/sitterlogin');
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                width: 200,
                height: 200,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/main1.png',
                      height: 180,
                      width: 200,
                      fit: BoxFit.fitWidth,
                    ),
                    Text("Sitter Login")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
