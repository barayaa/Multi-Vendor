import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
      String fullname, String email, String password) async {
    try {
      if (fullname.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        UserCredential cred = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await firestore.collection('users').doc(cred.user!.uid).set({
          'fullname': fullname,
          'email': email,
        });
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
}
