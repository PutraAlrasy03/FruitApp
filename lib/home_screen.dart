import 'package:aiqal/item.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dbRef = FirebaseDatabase.instance.reference().child('Posts');

  @override
  Widget build(BuildContext context) {
    List<Item> searchList = ITEM_LIST
        .where((element) =>
            element.name.toLowerCase().contains(text.toLowerCase()))
        .toList();
    return Scaffold(
      backgroundColor: Colors.green,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: FirebaseAnimatedList(
                      query: dbRef.child('History'),
                      itemBuilder: (BuildContext context, DataSnapshot snapshot,
                          Animation<double> _, int index) {
                        return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: FadeInImage.assetNetwork(
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .25,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          placeholder: 'assets/images/load.png',
                                          image: snapshot
                                              .child('pImage')
                                              .value
                                              .toString()),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )));
                      }),
                )
              ])),
    );
  }
}
