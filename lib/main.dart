import 'dart:developer';

import 'package:contx/app_bloc.dart';
import 'package:contx/get.dart';
import 'package:contx/rep/repo.dart';
import 'package:contx/searchentriesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contx/app_state.dart';
import 'package:contx/briefview.dart';

import 'app_events.dart';
import 'detailedWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: RepositoryProvider(
      create: (context) => LoadData(),
      child: const HomePageBloc(),
    ));
  }
}

class HomePageBloc extends StatefulWidget {
  const HomePageBloc({Key? key}) : super(key: key);

  @override
  State<HomePageBloc> createState() => _HomePageBlocState();
}

class _HomePageBlocState extends State<HomePageBloc> {
  @override
  late TextEditingController controllerid;
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPhone;
  late TextEditingController controllerCompany;
  late TextEditingController controllerWebsite;
  late TextEditingController controllerAddress;
  late TextEditingController controllerUsername;
  bool modified = false;
  void initState() {
    super.initState();
    controllerid = TextEditingController();
    controllerName = TextEditingController();
    controllerAddress = TextEditingController();
    controllerUsername = TextEditingController();
    controllerPhone = TextEditingController();
    controllerCompany = TextEditingController();
    controllerWebsite = TextEditingController();
    controllerEmail = TextEditingController();
    controllerName.text = "";
    controllerAddress.text = "";
    controllerUsername.text = "";
    controllerPhone.text = "";
    controllerWebsite.text = "";
    controllerCompany.text = "";
    controllerid.text = "";
    controllerEmail.text = "";
  }

  void _navigateToDetailedWidget(int index) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (c) {
      return BlocProvider.value(
        value: BlocProvider.of<UserBloc>(context),
        child: DetailedWidget(index),
      );
    }));

    // Update the modified flag and rebuild the UI
    setState(() {
      modified = true;
    });
  }

  Widget build(BuildContext context) {
    return BlocProvider(
        create: (ctx) => UserBloc(RepositoryProvider.of<LoadData>(context), 0)
          ..add(LoaderUserEvent()),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Contx"),
            actions: [
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        if (state is UserLoadedState) {
                          List<Users> u = state.users;
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (c) {
                            return BlocProvider.value(
                              value: BlocProvider.of<UserBloc>(context),
                              child: SearchPage(),
                            );
                          }));
                        }
                      },
                      icon: Icon(Icons.search));
                },
              )
            ],
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UserLoadedState) {
                List<Users> usr = BlocProvider.of<UserBloc>(context).usrs;
                return Stack(
                  children: [
                    (SizedBox(
                      height: MediaQuery.of(context).size.height - 59,
                      child: (modified == true)
                          ? ListView.builder(
                              itemCount: usr.length,
                              itemBuilder: (_, index) => InkWell(
                                    onTap: () async {
                                      // (int index) async {
                                      //   await Navigator.of(context).push(
                                      //       MaterialPageRoute(builder: (c) {
                                      //     return BlocProvider.value(
                                      //       value: BlocProvider.of<UserBloc>(
                                      //           context),
                                      //       child: DetailedWidget(index),
                                      //     );
                                      //   }));

                                      //   // Update the modified flag and rebuild the UI
                                      //   setState(() {
                                      //     modified = true;
                                      //   });
                                      // };
                                      await Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (c) {
                                        return BlocProvider.value(
                                          value: BlocProvider.of<UserBloc>(
                                              context),
                                          child: DetailedWidget(index),
                                        );
                                      }));
                                      setState(() {
                                        modified = !modified;
                                      });
                                    },
                                    child: Briefview(
                                        usr[index].id,
                                        usr[index].name,
                                        usr[index].username,
                                        usr[index].email),
                                  ))
                          : ListView.builder(
                              itemCount: usr.length,
                              itemBuilder: (_, index) => InkWell(
                                    // onTap: () {
                                    //   // _navigateToDetailedWidget(
                                    //   //     index); // Navigator.of(context)
                                    //   //     .push(MaterialPageRoute(builder: (c) {
                                    //   //   return BlocProvider.value(
                                    //   //     value: BlocProvider.of<UserBloc>(context),
                                    //   //     child: DetailedWidget(index),
                                    //   //   );
                                    //   // }));
                                    //   // setState(() {
                                    //   //   modified = !modified;
                                    //   // });
                                    // },
                                    onTap: () async {
                                      // (int index) async {
                                      //   await Navigator.of(context).push(
                                      //       MaterialPageRoute(builder: (c) {
                                      //     return BlocProvider.value(
                                      //       value: BlocProvider.of<UserBloc>(
                                      //           context),
                                      //       child: DetailedWidget(index),
                                      //     );
                                      //   }));

                                      //   // Update the modified flag and rebuild the UI
                                      //   setState(() {
                                      //     modified = true;
                                      //   });
                                      // };
                                      await Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (c) {
                                        return BlocProvider.value(
                                          value: BlocProvider.of<UserBloc>(
                                              context),
                                          child: DetailedWidget(index),
                                        );
                                      }));
                                      setState(() {
                                        modified = !modified;
                                      });
                                    },
                                    child: Briefview(
                                        usr[index].id,
                                        usr[index].name,
                                        usr[index].username,
                                        usr[index].email),
                                  )),
                    )),
                    Container(
                        alignment: Alignment.bottomRight,
                        padding: (EdgeInsets.all(20)),
                        child: FloatingActionButton(
                          onPressed: () {
                            // List<Users> u = state.users;
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(builder: (c) {
                            //   return BlocProvider.value(
                            //     value: BlocProvider.of<UserBloc>(context),
                            //     child: SearchPage(u),
                            //   );
                            // }));
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.70,
                                        child: SizedBox(
                                          child: Center(
                                            child: Material(
                                              child: SingleChildScrollView(
                                                child: Column(children: [
                                                  const Center(
                                                    child: Text(
                                                      "Enter Details",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    // width: MediaQuery.of(context)
                                                    //         .size
                                                    //         .width *
                                                    //     0.65,
                                                    width: double.infinity,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Text("ID"),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                        ),
                                                        SizedBox(
                                                          width: 16,
                                                        ),
                                                        Expanded(
                                                          child: TextField(
                                                            controller:
                                                                controllerid,
                                                            decoration:
                                                                const InputDecoration(
                                                                    hintText:
                                                                        "Enter your unique id"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    // width: MediaQuery.of(context)
                                                    //         .size
                                                    //         .width *
                                                    //     0.65,
                                                    width: double.infinity,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Text("Name"),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                        ),
                                                        SizedBox(
                                                          width: 16,
                                                        ),
                                                        Expanded(
                                                          child: TextField(
                                                            controller:
                                                                controllerName,
                                                            decoration:
                                                                const InputDecoration(
                                                                    hintText:
                                                                        "Enter your Name"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    // width: MediaQuery.of(context)
                                                    //         .size
                                                    //         .width *
                                                    //     0.65,
                                                    width: double.infinity,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Text("Email"),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                        ),
                                                        SizedBox(
                                                          width: 16,
                                                        ),
                                                        Expanded(
                                                          child: TextField(
                                                            controller:
                                                                controllerEmail,
                                                            decoration:
                                                                const InputDecoration(
                                                                    hintText:
                                                                        "Enter your Email"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    // width: MediaQuery.of(context)
                                                    //         .size
                                                    //         .width *
                                                    //     0.65,
                                                    width: double.infinity,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          child:
                                                              Text("Username"),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                        ),
                                                        SizedBox(
                                                          width: 16,
                                                        ),
                                                        Expanded(
                                                          child: TextField(
                                                            controller:
                                                                controllerUsername,
                                                            decoration:
                                                                const InputDecoration(
                                                                    hintText:
                                                                        "Enter your unique Username"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    // width: MediaQuery.of(context)
                                                    //         .size
                                                    //         .width *
                                                    //     0.65,
                                                    width: double.infinity,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          child:
                                                              Text("Address"),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                        ),
                                                        SizedBox(
                                                          width: 16,
                                                        ),
                                                        Expanded(
                                                          child: TextField(
                                                            controller:
                                                                controllerAddress,
                                                            decoration:
                                                                const InputDecoration(
                                                                    hintText:
                                                                        "Enter your Address"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    // width: MediaQuery.of(context)
                                                    //         .size
                                                    //         .width *
                                                    //     0.65,
                                                    width: double.infinity,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          child:
                                                              Text("Website"),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                        ),
                                                        SizedBox(
                                                          width: 16,
                                                        ),
                                                        Expanded(
                                                          child: TextField(
                                                            controller:
                                                                controllerWebsite,
                                                            decoration:
                                                                const InputDecoration(
                                                                    hintText:
                                                                        "Enter your Website"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    // width: MediaQuery.of(context)
                                                    //         .size
                                                    //         .width *
                                                    //     0.65,
                                                    width: double.infinity,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Text("Phone"),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                        ),
                                                        SizedBox(
                                                          width: 16,
                                                        ),
                                                        Expanded(
                                                          child: TextField(
                                                            controller:
                                                                controllerPhone,
                                                            decoration:
                                                                const InputDecoration(
                                                                    hintText:
                                                                        "Enter your number"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    // width: MediaQuery.of(context)
                                                    //         .size
                                                    //         .width *
                                                    //     0.65,
                                                    width: double.infinity,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          child:
                                                              Text("Company"),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                        ),
                                                        SizedBox(
                                                          width: 16,
                                                        ),
                                                        Expanded(
                                                          child: TextField(
                                                            controller:
                                                                controllerCompany,
                                                            decoration:
                                                                const InputDecoration(
                                                                    hintText:
                                                                        "Enter name of your company"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Center(
                                                    child: ElevatedButton(
                                                        child: Text("Submit"),
                                                        onPressed: () {
                                                          if (idnotunique(
                                                              controllerid.text,
                                                              state.users)) {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder: (_) {
                                                                  Future.delayed(
                                                                      Duration(
                                                                          milliseconds:
                                                                              700),
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(
                                                                            true);
                                                                  });
                                                                  return Dialog(
                                                                      child:
                                                                          SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.05,
                                                                    child:
                                                                        Center(
                                                                      child: Text(
                                                                          "ID not unique"),
                                                                    ),
                                                                  ));
                                                                });
                                                          } else if (controllerid.text.isNotEmpty &&
                                                              controllerName
                                                                  .text
                                                                  .isNotEmpty &&
                                                              controllerUsername
                                                                  .text
                                                                  .isNotEmpty &&
                                                              controllerEmail
                                                                  .text
                                                                  .isNotEmpty &&
                                                              controllerWebsite
                                                                  .text
                                                                  .isNotEmpty &&
                                                              controllerAddress
                                                                  .text
                                                                  .isNotEmpty &&
                                                              controllerCompany
                                                                  .text
                                                                  .isNotEmpty &&
                                                              controllerPhone
                                                                  .text
                                                                  .isNotEmpty) {
                                                            Users us = Users(
                                                                int.parse(
                                                                    controllerid
                                                                        .text),
                                                                controllerName
                                                                    .text,
                                                                controllerUsername
                                                                    .text,
                                                                controllerEmail
                                                                    .text,
                                                                controllerWebsite
                                                                    .text,
                                                                controllerAddress
                                                                    .text,
                                                                controllerCompany
                                                                    .text,
                                                                controllerPhone
                                                                    .text);
                                                            BlocProvider.of<
                                                                        UserBloc>(
                                                                    context)
                                                                .addUsers(us);
                                                            controllerName
                                                                .text = "";
                                                            controllerAddress
                                                                .text = "";
                                                            controllerUsername
                                                                .text = "";
                                                            controllerPhone
                                                                .text = "";
                                                            controllerWebsite
                                                                .text = "";
                                                            controllerCompany
                                                                .text = "";
                                                            controllerid.text =
                                                                "";
                                                            controllerEmail
                                                                .text = "";
                                                            Navigator.pop(
                                                                context);
                                                          } else {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder: (_) {
                                                                  Future.delayed(
                                                                      Duration(
                                                                          milliseconds:
                                                                              700),
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(
                                                                            true);
                                                                  });
                                                                  return Dialog(
                                                                      child:
                                                                          SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.05,
                                                                    child:
                                                                        Center(
                                                                      child: Text(
                                                                          "All are fields are required"),
                                                                    ),
                                                                  ));
                                                                });
                                                          }
                                                        }),
                                                  )
                                                ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: const Icon(Icons.add_outlined),
                        )),
                  ],
                );
              }
              if (state is UserErrorState) {
                return Center(
                  child: Text(state.msg),
                );
              }
              return Container();
            },
          ),
        ));
  }

  bool idnotunique(String text, List<Users> users) {
    int x = users.length;
    for (int i = 0; i < x; i++) {
      if (text == users[i].id.toString()) {
        return true;
      }
    }
    return false;
  }
}
