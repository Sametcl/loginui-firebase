// ignore_for_file: unused_import, unused_field, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore =  FirebaseFirestore.instance;

    Future<User?> singIn(String email, String password)async{
      var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return user.user;

    }

    singOut()async{
      return await _auth.signOut();
    }


    Future<User?> creatPerson(String name ,String email ,String password) async{
      var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);


      await _firestore.collection("person")
      .doc(user.user?.uid)
      .set({
        "userName" : name,
        "email" : email ,
        "password" : password
      });
      return user.user;
    }

}