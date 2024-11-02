import 'package:firebase_auth/firebase_auth.dart';
import 'package:florist/app/modules/navigation_bar/views/navigation_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

const users = {
  'surya@gmail.com': '12345',
  'rezky@gmail.com': 'hunter',
};

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);


Future<String?> _signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return 'Sign in aborted';
    }
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = 
      await FirebaseAuth.instance.signInWithCredential(credential);
    
    // Now we have access to the user data
    final User? user = userCredential.user;
    if (user != null) {
      // You can store additional user data in your database here if needed
      return null;
    }
    return 'Failed to get user data';
  } catch (e) {
    return 'Error occurred during Google Sign-In: $e';
  }
}

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "null";
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      theme: LoginTheme(
        primaryColor: const Color.fromARGB(255, 87, 218, 91),
        accentColor: Colors.yellow,
        errorColor: Colors.deepOrange,
        titleStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            letterSpacing: 4,
            fontWeight: FontWeight.bold),
        bodyStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
        textFieldStyle: const TextStyle(
          color: Colors.green,
          shadows: [Shadow(color: Colors.green, blurRadius: 2)],
        ),
        buttonStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      title: 'Florist',
      logo: const AssetImage('lib/app/data/assets/icons/plant.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          callback: _signInWithGoogle
        ),
        LoginProvider(
          icon: FontAwesomeIcons.facebookF,
          label: 'Facebook',
          callback: () async {
            debugPrint('start facebook sign in');
            await Future.delayed(loginTime);
            debugPrint('stop facebook sign in');
            return null;
          },
        ),
      ],
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const NavigationBarView(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
