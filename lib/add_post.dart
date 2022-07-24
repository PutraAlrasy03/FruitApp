import 'dart:io';

import 'package:aiqal/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool showSpinner = false;
  final postref = FirebaseDatabase.instance.reference().child('Posts');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _image;
  final picker = ImagePicker();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image Selected');
      }
    });
  }

  Future getCameraImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image Selected');
      }
    });
  }

  void dialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Container(
              height: 70,
              child: Column(children: [
                InkWell(
                  onTap: () {
                    getImageGallery();
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Gallery'),
                  ),
                ),
              ]),
            ),
          );
        });
  }

  void goToHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return new MyHomePage(
        title: '',
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Upload',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    dialog(context);
                  },
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * 1,
                      child: _image != null
                          ? ClipRect(
                              child: Image.file(_image!.absolute,
                                  width: 100, height: 100, fit: BoxFit.fill),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              width: 100,
                              height: 100,
                              child: Icon(
                                Icons.camera_alt,
                                color: Color.fromARGB(255, 22, 36, 82),
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                    child: Text("Upload"),
                    textColor: Color.fromARGB(255, 22, 36, 82),
                    color: Colors.green,
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        int date = DateTime.now().microsecondsSinceEpoch;
                        firebase_storage.Reference ref = firebase_storage
                            .FirebaseStorage.instance
                            .ref('/bopiapp$date');
                        firebase_storage.UploadTask uploadTask =
                            ref.putFile(_image!.absolute);
                        await Future.value(uploadTask);
                        var newUrl = await ref.getDownloadURL();

                        postref.child("History").child(date.toString()).set({
                          'pId': date.toString(),
                          'pImage': newUrl.toString(),
                          'pTime': date.toString(),
                        }).then((value) {
                          toastMessage('Post Published');
                          setState(() {
                            showSpinner = false;
                          });
                        }).onError((error, stackTrace) {
                          toastMessage(error.toString());
                          setState(() {
                            showSpinner = false;
                          });
                        });
                      } catch (e) {
                        setState(() {
                          showSpinner = false;
                        });
                        toastMessage(e.toString());
                      }
                    }),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
