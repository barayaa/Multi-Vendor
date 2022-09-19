import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  //Function to upload Image to the Storage Controller
  _uplaodImageToStorage(Uint8List? image) async {
    Reference ref =
        _firebaseStorage.ref().child('profiles').child(auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(image!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //Function to pick Image from Galery and Camera
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print("No Image Selected");
    }
  }

  String res = "Somme error";
  Future<String> sigUpUsers(
      String fullname, String email, String password, Uint8List? image) async {
    try {
      if (fullname.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await _uplaodImageToStorage(image);
        await firestore.collection('users').doc(cred.user!.uid).set(
          {
            'fullname': fullname,
            'email': email,
            'image': downloadUrl,
          },
        );
        print(cred.user!.email);
        print('hello');
        res = "success";
        print('Accoutn created');
      } else {
        res = "please field can not be empty";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUsers(String email, String password) async {
    String res = "some error occured";

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";
        print('Successfully logged in');
      } else {
        res = "please field can not be empty";
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
