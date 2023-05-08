// ignore: file_names
import 'InfoCard.dart';
import 'package:contx/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contx/app_bloc.dart';
import 'package:contx/app_events.dart';

import 'get.dart';

class DetailedWidget extends StatefulWidget {
  final int ind;
  const DetailedWidget(this.ind, {super.key});

  @override
  State<DetailedWidget> createState() => _DetailedWidgetState(ind);
}

class _DetailedWidgetState extends State<DetailedWidget> {
  final int ind;
  _DetailedWidgetState(this.ind);
  late TextEditingController controllerid;
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPhone;
  late TextEditingController controllerCompany;
  late TextEditingController controllerWebsite;
  late TextEditingController controllerAddress;
  late TextEditingController controllerUsername;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contx")),
      body: BlocConsumer<UserBloc, UserState>(
        listener: ((context, state) {}),
        builder: (_, state) {
          if (state is UserLoadedState) {
            return Stack(children: [
              InfoCard(
                state.users[ind].id,
                state.users[ind].name,
                state.users[ind].username,
                state.users[ind].email,
                state.users[ind].website,
                state.users[ind].address,
                state.users[ind].company,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(
                    bottom: 50, left: MediaQuery.of(context).size.width * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      heroTag: 0,
                      onPressed: () {
                        controllerid.text = state.users[ind].id.toString();
                        controllerAddress.text = state.users[ind].address;
                        controllerName.text = state.users[ind].name;
                        controllerPhone.text = state.users[ind].phone;
                        controllerCompany.text = state.users[ind].company;
                        controllerEmail.text = state.users[ind].email;
                        controllerWebsite.text = state.users[ind].website;
                        controllerUsername.text = state.users[ind].username;
                        showDialog(
                            context: context,
                            builder: (_) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.70,
                                    child: SizedBox(
                                      child: Center(
                                        child: Material(
                                          child: SingleChildScrollView(
                                            child: Column(children: [
                                              const Center(
                                                child: Text(
                                                  "Edit Details",
                                                  style:
                                                      TextStyle(fontSize: 20),
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
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                    ),
                                                    SizedBox(
                                                      width: 16,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        controllerid.text,
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
                                                      child: Text("Username"),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                    ),
                                                    SizedBox(
                                                      width: 16,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        controllerUsername.text,
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
                                                      width:
                                                          MediaQuery.of(context)
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
                                                      width:
                                                          MediaQuery.of(context)
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
                                                      child: Text("Address"),
                                                      width:
                                                          MediaQuery.of(context)
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
                                                      child: Text("Website"),
                                                      width:
                                                          MediaQuery.of(context)
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
                                                      width:
                                                          MediaQuery.of(context)
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
                                                      child: Text("Company"),
                                                      width:
                                                          MediaQuery.of(context)
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
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Center(
                                                child: ElevatedButton(
                                                    child: Text("Submit"),
                                                    onPressed: () {
                                                      if (controllerid
                                                              .text.isNotEmpty &&
                                                          controllerName
                                                              .text.isNotEmpty &&
                                                          controllerUsername
                                                              .text
                                                              .isNotEmpty &&
                                                          controllerEmail.text
                                                              .isNotEmpty &&
                                                          controllerWebsite.text
                                                              .isNotEmpty &&
                                                          controllerAddress.text
                                                              .isNotEmpty &&
                                                          controllerCompany.text
                                                              .isNotEmpty &&
                                                          controllerPhone.text
                                                              .isNotEmpty) {
                                                        Users us = Users(
                                                            int.parse(
                                                                controllerid
                                                                    .text),
                                                            controllerName.text,
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
                                                            .modifyUsers(us);
                                                        Navigator.pop(context);
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder: (_) {
                                                              Future.delayed(
                                                                  Duration(
                                                                      milliseconds:
                                                                          700),
                                                                  () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(true);
                                                              });
                                                              return Dialog(
                                                                  child:
                                                                      SizedBox(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.05,
                                                                child: Center(
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
                      child: Icon(Icons.edit),
                    ),
                    FloatingActionButton(
                      heroTag: 1,
                      onPressed: () {
                        BlocProvider.of<UserBloc>(context)
                            .removeUser(state.users[ind]);
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.delete_rounded),
                    ),
                  ],
                ),
              )
            ]);
          } else {
            return (Text("Some error occured!!!"));
          }
        },
      ),
    );
  }
}
// import 'package:customer_ledger/blocs/app_state.dart';
// import 'blocs/app_blocs.dart';

// class DetailedWidget extends StatelessWidget {
//   final id;
//   const DetailedWidget(this.id, {super.key});
//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider(
//       create: (context) => LoadData(),
//       child: BlocProvider(
//         create: (context) =>
//             UserBloc(RepositoryProvider.of<LoadData>(context), id, 0)
//               ..add(LoaderUserEvent()),
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text("Details"),
//           ),
//           body: BlocBuilder<UserBloc, UserState>(
//             builder: (context, state) {
//               if (state is UserDetailsLoadingState) {
//                 return const CircularProgressIndicator();
//               }
//               if (state is UserDetailsLoadedState) {
//                 return InfoCard(
//                   id,
//                   state.users.name,
//                   state.users.username,
//                   state.users.email,
//                   state.users.website,
//                   state.users.address,
//                   state.users.company,
//                 );
//               }
//               return Container();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
