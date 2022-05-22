import 'package:flutter/material.dart';

class ParentProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: Text("Parent Profile"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink[800],
              ),
              child: Text(
                'User Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.pink, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              title: Text('Post Job'),
              onTap: () {
                Navigator.pushNamed(context, '/jobpost');
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.pink, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              title: Text('Edit Profile'),
              onTap: () {},
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.pink, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              title: Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        color: Color.fromRGBO(87, 24, 158, 82),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: 70),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  "Parent Profile Details",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ListTile(
                        title: Text('Name'),
                        subtitle: Text('Name of Parent'),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ListTile(
                        title: Text('Nid'),
                        subtitle: Text('0123456789012'),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ListTile(
                        title: Text('Phone'),
                        subtitle: Text('017XXXXXXXX'),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ListTile(
                        title: Text('No of child'),
                        subtitle: Text('2'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  "Child Details",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ListTile(
                        title: Text('Name'),
                        subtitle: Text('Name of Child'),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ListTile(
                        title: Text('Age'),
                        subtitle: Text('5'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ListTile(
                        title: Text('Name'),
                        subtitle: Text('Name of Child'),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ListTile(
                        title: Text('Age'),
                        subtitle: Text('5'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  "Jobs posted",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/jobdetails');
                    },
                    title: Text(
                      'Posted By',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Child Name:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Child Name"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Age:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("5"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Week Days:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Fr, Sa, Su, Mo, Tu, We, Th"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Time:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("02.00PM - 04.00PM"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Offered Salary:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("200 Per Hour"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/jobdetails');
                    },
                    title: Text(
                      'Posted By',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Child Name:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Child Name"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Age:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("5"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Week Days:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Fr, Sa, Su, Mo, Tu, We, Th"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Time:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("02.00PM - 04.00PM"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Offered Salary:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("200 Per Hour"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
