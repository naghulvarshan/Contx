import 'package:contx/briefview.dart';
import 'package:contx/detailedWidget.dart';
import 'package:contx/searchkey.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_bloc.dart';
import 'app_state.dart';
import 'get.dart';

class SearchPage extends StatefulWidget {
  // final List<Users> l;
  //const SearchPage({super.key});
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchkey = TextEditingController();
  //final List<Users> l;
  _SearchPageState();
  List<Users> lst = [];
  var x = 0;
  void submit(String val, l) {
    lst = [];
    if (_site == 'name') {
      lst = l
          .where((m) =>
              m.name.toString().toLowerCase().startsWith(val.toLowerCase()))
          .toList();
    } else if (_site == 'username') {
      lst = l
          .where((m) =>
              m.username.toString().toLowerCase().startsWith(val.toLowerCase()))
          .toList();
    } else if (_site == 'email') {
      lst = l
          .where((m) =>
              m.email.toString().toLowerCase().startsWith(val.toLowerCase()))
          .toList();
    } else {
      lst = l
          .where((m) =>
              m.name.toString().toLowerCase().startsWith(val.toLowerCase()))
          .toList();
    }
    setState(() {
      x = 1;
    });
  }

  var _site = 'name';
  String sometxt = "";
  var selected = " ";
  void changeState(List<Users> user) {
    setState(() {
      x = 1;
    });
    lst = user;
  }

  void changefilter(String val, String v) {
    setState(() {
      _site = v;
      x = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print("HI");

    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<Users> l = BlocProvider.of<UserBloc>(context).usrs;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(title: const Text("Customer Ledger")),
          body: x == 0
              ? Column(children: [
                  Container(
                    child: TextField(
                      decoration: InputDecoration(labelText: "Search key"),
                      // onChanged: ((value) {
                      //   sometxt = value;
                      // }),
                      controller: _searchkey,
                      onChanged: (val) => submit(val, l),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Search by: ",
                            style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.bold),
                          ),
                          DropdownButton<String>(
                            elevation: 10,
                            value: _site,
                            items: <String>['name', 'username', 'email']
                                .map((String val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            }).toList(),
                            onChanged: (value) => setState(() {
                              _site = value!;
                              //submit(_searchkey.text);
                              x = 0;
                              _searchkey.text = "";
                            }),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Sort by:",
                            style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.bold),
                          ),
                          DropdownButton<String>(
                            elevation: 10,
                            value: selected,
                            items: <String>[' ', 'name', 'username', 'email']
                                .map((String val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            }).toList(),
                            onChanged: (n) {
                              setState(() {
                                selected = n!;
                              });
                              if (n == "name") {
                                l.sort((a, b) => (a.name).compareTo(b.name));
                              }
                              if (n == "username") {
                                l.sort((a, b) =>
                                    (a.username).compareTo(b.username));
                              }
                              if (n == "email") {
                                l.sort((a, b) => (a.email).compareTo(b.email));
                              }
                              changeState(l as List<Users>);
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ])
              : Column(children: [
                  Container(
                      child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        suffixIcon: IconButton(
                          onPressed: () {
                            _searchkey.clear();
                            setState(() {
                              x = 0;
                            });
                          },
                          icon: Icon(Icons.clear),
                        )),
                    onSubmitted: ((value) => submit(value, l)),
                    onChanged: (val) => submit(val, l),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Search by: ",
                            style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.bold),
                          ),
                          DropdownButton<String>(
                            elevation: 10,
                            value: _site,
                            items: <String>['name', 'username', 'email']
                                .map((String val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            }).toList(),
                            onChanged: (value) => setState(() {
                              _site = value!;
                              x = 0;
                              _searchkey.text = "";
                            }),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Sort by:",
                            style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.bold),
                          ),
                          DropdownButton<String>(
                            elevation: 10,
                            value: selected,
                            items: <String>[' ', 'name', 'username', 'email']
                                .map((String val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            }).toList(),
                            onChanged: (n) {
                              setState(() {
                                selected = n!;
                              });
                              if (n == "name") {
                                lst.sort((a, b) => (a.name).compareTo(b.name));
                              }
                              if (n == "username") {
                                lst.sort((a, b) =>
                                    (a.username).compareTo(b.username));
                              }
                              if (n == "email") {
                                lst.sort(
                                    (a, b) => (a.email).compareTo(b.email));
                              }

                              changeState(lst as List<Users>);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    child: (lst.isEmpty == true)
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Center(
                                child: Text(
                              "No data Found",
                              style: TextStyle(fontSize: 22),
                            )))
                        : SingleChildScrollView(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: ListView.builder(
                                  itemCount: lst.length,
                                  itemBuilder: (_, index) => InkWell(
                                        onTap: () {
                                          x = cal_index(lst[index], l);
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (c) {
                                            return BlocProvider.value(
                                                value:
                                                    BlocProvider.of<UserBloc>(
                                                        context),
                                                child: DetailedWidget(x));
                                          }));
                                        },
                                        child: Briefview(
                                            lst[index].id,
                                            lst[index].name,
                                            lst[index].username,
                                            lst[index].email),
                                      )),
                            ),
                          ),
                  ),
                ]),
        );
      },
    );
  }

  int cal_index(Users lst, List<Users> l) {
    x = l.length;
    for (int i = 0; i < x; i++) {
      if (l[i] == lst) {
        return i;
      }
    }
    return 0;
  }
}
