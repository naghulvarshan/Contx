import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class detailedWidget extends StatelessWidget {
  final int id;
  final String name;
  final int age;
  final int contact;
  //final String company;
  detailedWidget(this.id, this.name, this.age, this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 150),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Card(
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.black,
          shadowColor: Colors.blue,
          child: Column(children: [
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "ID:              $id",
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.blue,
                              fontFamily: 'Roboto'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Name:       $name",
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.blue,
                              fontFamily: 'Roboto'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Age:           $age",
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.blue,
                              fontFamily: 'Roboto'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text(
                          "Contact:    " + "987654321",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.blue,
                              fontFamily: 'Roboto'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text(
                          "Company: " + "CIT",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.blue,
                              fontFamily: 'Roboto'),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset("assets/images/profile.jpg",
                        fit: BoxFit.cover),
                  )
                ],
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
