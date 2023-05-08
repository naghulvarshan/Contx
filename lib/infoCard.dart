import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class InfoCard extends StatelessWidget {
  final int id;
  final String name;
  final String username;
  final String email;
  final String website;
  final String address;
  final String company;
  //final String phone;
  const InfoCard(this.id, this.name, this.username, this.email, this.website,
      this.address, this.company,
      {super.key});
  List function(String name) {
    if (name.contains(" ")) {
      return name.split(" ");
    } else {
      return [name];
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            shadowColor: Colors.black,
            color: Colors.blue,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(children: [
                Expanded(
                    flex: 40,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: ListView.builder(
                                itemCount: function(name).length,
                                itemBuilder: (context, index) => Container(
                                      padding: EdgeInsets.only(
                                          top: constraints.maxHeight * 0.01,
                                          left: constraints.maxWidth * 0.05),
                                      child: Text(
                                        function(name)[index],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      ),
                                    )),
                          ),
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/profile.jpg'),
                            radius: MediaQuery.of(context).size.width * 0.15,
                            //child: Image.asset('assets/images/profile.jpg'),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 60,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.28,
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    child: Text("Username",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  FittedBox(
                                    child: Text("Email",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  FittedBox(
                                    child: Text("Website",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  FittedBox(
                                    child: Text("Address",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  FittedBox(
                                    child: Text("Company",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.20,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    child: Text(username,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  FittedBox(
                                    child: Text(email,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  FittedBox(
                                    child: Text(website,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  FittedBox(
                                    child: Text(address,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  FittedBox(
                                    child: Text(company,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ]),
            ),
          ),
        ),
      );
    });
  }
}
