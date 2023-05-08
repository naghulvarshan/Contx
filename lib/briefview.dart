import 'package:flutter/material.dart';

class Briefview extends StatelessWidget {
  final int id;
  final String name;
  final String username;
  final String email;
  const Briefview(this.id, this.name, this.username, this.email, {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 7.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            flex: 15,
            child: Container(
              height: 50,
              padding: const EdgeInsets.only(right: 5),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(27), // Image radius
                  child: Image.asset('assets/images/profile.jpg',
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(username)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 35,
            child: Center(
                child: Text(
              email,
              style: TextStyle(fontSize: 9),
            )),
          )
        ]),
      ),
    );
  }
}
