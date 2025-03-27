// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:fluttertoast/fluttertoast.dart';
// import '../pages/home/home.dart';
// import '../pages/home/UserSelectOffice.dart';
// import '../pages/login/login.dart';

// class AuthService {
// <<<<<<< HEAD
//   Future<void> signup({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     if (email.isEmpty || password.isEmpty) {
//       _showToast('Email or password cannot be empty.');
//       return;
//     }

//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       if (context.mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (BuildContext context) => const Home()),
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       String message = _getSignupErrorMessage(e);
//       _showToast(message);
//     } catch (e) {
//       _showToast('An unexpected error occurred. Please try again.');
//       debugPrint(e.toString()); // Log error for debugging
// =======
//   static final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Stream to listen to auth state changes
//   Stream<User?> get authStateChanges => _auth.authStateChanges();

//   // Method to get current user
//   User? get currentUser => _auth.currentUser;

//   // Wrapper widget to handle auth state
//   static Widget handleAuthState(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.hasData) {
//           return const Home();
//         } else {
//           return Login();
//         }
//       },
//     );
//   }

//   Future<void> signup({
//   required String name,
//   required String email,
//   required String phone,
//   required String password,
//   required String profilePicLink,
//   required String role,
//   required BuildContext context,
// }) async {
//   if (email.isEmpty || password.isEmpty || name.isEmpty) {
//     Fluttertoast.showToast(msg: 'Required fields cannot be empty');
//     return;
//   }

//   try {
//     UserCredential userCredential = await _auth
//         .createUserWithEmailAndPassword(email: email, password: password);

//     // Save additional user data to Firestore
//     await FirebaseFirestore.instance
//         .collection('Users')
//         .doc(userCredential.user?.uid)
//         .set({
//       'name': name,
//       'email': email,
//       'phone': phone,
//       'profilePicLink': profilePicLink,
//       'role': role, // Add role field
//       'createdAt': FieldValue.serverTimestamp(),
//     });

//     // Show success message
//     Fluttertoast.showToast(
//       msg: 'Account created successfully!',
//       backgroundColor: Colors.green,
//       textColor: Colors.white,
//     );

//     // Navigate to login page after successful signup
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => Login()),
//     );

//     } on FirebaseAuthException catch (e) {
//       String message = '';
//       if (e.code == 'weak-password') {
//         message = 'The password provided is too weak.';
//       } else if (e.code == 'email-already-in-use') {
//         message = 'An account already exists with that email.';
//       } else {
//         message = e.message ?? 'An authentication error occurred.';
//       }
//       Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.SNACKBAR,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 14.0,
//       );
//     } catch (e) {
//       Fluttertoast.showToast(
//         msg: 'An unexpected error occurred.',
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.SNACKBAR,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 14.0,
//       );
// >>>>>>> origin/authentication
//     }
//   }

//   Future<void> signin({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     if (email.isEmpty || password.isEmpty) {
// <<<<<<< HEAD
//       _showToast('Email or password cannot be empty.');
// =======
//       Fluttertoast.showToast(
//         msg: 'Email or password cannot be empty.',
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.SNACKBAR,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 14.0,
//       );
// >>>>>>> origin/authentication
//       return;
//     }

//     try {
// <<<<<<< HEAD
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       if (context.mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (BuildContext context) => const Home()),
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       String message = _getSigninErrorMessage(e);
//       _showToast(message);
//     } catch (e) {
//       _showToast('An unexpected error occurred. Please try again.');
//       debugPrint(e.toString()); // Log error for debugging
// =======
//       await _auth.signInWithEmailAndPassword(email: email, password: password);

//       final user = _auth.currentUser;
//       if (user != null) {
//         final userDoc = await FirebaseFirestore.instance
//             .collection('Users')
//             .doc(user.uid)
//             .get();

//         if (!userDoc.data()!.containsKey('state')) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (_) => const ProfileCompletion()),
//           );
//         } else {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (_) => const Home()),
//           );
//         }
//       }
//     } on FirebaseAuthException catch (e) {
//       String message = '';
//       if (e.code == 'invalid-email') {
//         message = 'No user found for that email.';
//       } else if (e.code == 'invalid-credential') {
//         message = 'Wrong password provided for that user.';
//       } else {
//         message = e.message ?? 'An authentication error occurred.';
//       }
//       Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.SNACKBAR,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 14.0,
//       );
//     } catch (e) {
//       Fluttertoast.showToast(
//         msg: 'An unexpected error occurred.',
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.SNACKBAR,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 14.0,
//       );
// >>>>>>> origin/authentication
//     }
//   }

//   Future<void> signout({required BuildContext context}) async {
// <<<<<<< HEAD
//     try {
//       await FirebaseAuth.instance.signOut();

//       if (context.mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (BuildContext context) => Login()),
//         );
//       }
//     } catch (e) {
//       _showToast('Error signing out. Please try again.');
//       debugPrint(e.toString()); // Log error for debugging
//     }
//   }

//   String _getSignupErrorMessage(FirebaseAuthException e) {
//     switch (e.code) {
//       case 'weak-password':
//         return 'The password provided is too weak (minimum 6 characters).';
//       case 'email-already-in-use':
//         return 'An account already exists with that email.';
//       case 'invalid-email':
//         return 'The email address is not valid.';
//       case 'operation-not-allowed':
//         return 'Email/password accounts are not enabled.';
//       default:
//         return 'An error occurred during signup. Please try again.';
//     }
//   }

//   String _getSigninErrorMessage(FirebaseAuthException e) {
//     switch (e.code) {
//       case 'invalid-email':
//         return 'The email address is not valid.';
//       case 'user-disabled':
//         return 'This user account has been disabled.';
//       case 'user-not-found':
//         return 'No user found with this email.';
//       case 'wrong-password':
//         return 'Wrong password provided.';
//       case 'invalid-credential':
//         return 'Invalid email or password.';
//       case 'too-many-requests':
//         return 'Too many failed login attempts. Please try again later.';
//       default:
//         return 'An error occurred during login. Please try again.';
//     }
//   }

//   void _showToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       backgroundColor: Colors.black87,
//       textColor: Colors.white,
//       fontSize: 16.0,
//     );
//   }
// =======
//     await _auth.signOut();
//     // Navigate to login page after signout
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (context) => Login()),
//       (route) => false,
//     );
//   }
// >>>>>>> origin/authentication
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../pages/home/home.dart';
import '../pages/home/UserSelectOffice.dart';
import '../pages/login/login.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream to listen to auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Method to get current user
  User? get currentUser => _auth.currentUser;

  // Wrapper widget to handle auth state
  static Widget handleAuthState(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const Home();
        } else {
          return Login();
        }
      },
    );
  }

  Future<void> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String profilePicLink,
    required String role,
    required BuildContext context,
  }) async {
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      Fluttertoast.showToast(msg: 'Required fields cannot be empty');
      return;
    }

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Save additional user data to Firestore
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user?.uid)
          .set({
        'name': name,
        'email': email,
        'phone': phone,
        'profilePicLink': profilePicLink,
        'role': role,
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Show success message
      Fluttertoast.showToast(
        msg: 'Account created successfully!',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      // Navigate to login page after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      } else {
        message = e.message ?? 'An authentication error occurred.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'An unexpected error occurred.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Email or password cannot be empty.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
      return;
    }

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      final user = _auth.currentUser;
      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .get();

        if (!userDoc.data()!.containsKey('state')) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const ProfileCompletion()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const Home()),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'No user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.message ?? 'An authentication error occurred.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'An unexpected error occurred.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  Future<void> signout({required BuildContext context}) async {
    await _auth.signOut();
    // Navigate to login page after signout
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Login()),
      (route) => false,
    );
  }
}
