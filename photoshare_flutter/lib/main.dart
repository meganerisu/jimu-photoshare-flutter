import 'package:flutter/material.dart';
import 'sharepage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            color: Colors.white,
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            routes: {
              '/': (context) => SignUpScreen(),
              '/welcome': (context) => WelcomeScreen(),
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          // child: Column(
          //   children: [
          //     Card(
          //       child: SignUpForm(),
          //     ),
          //     Text(_auth.currentUser != null
          //         ? "hasdata" //_auth.currentUser.email
          //         : "nodata")
          //   ],
          // ),
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // final _firstNameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _usernameTextController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _formProgress = 0;
  // bool _success;
  // String _userEmail;

  // void _showWelcomeScreen() {
  //   Navigator.of(context).pushNamed('/welcome');
  // }

  void _signInWithEmailAndPassword() async {
    final User user = (await _auth.signInWithEmailAndPassword(
      email: _usernameTextController.text,
      password: _passwordTextController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        // _success = true;
        // _userEmail = user.email;
        // _usernameTextController.clear();
        // _passwordTextController.clear();
        Navigator.of(context).pushReplacementNamed('/welcome');
      });
    } else {
      setState(() {
        // _success = false;
      });
    }
  }

  void _updateFormProgress() {
    var progress = 0.0;
    var controllers = [
      // _firstNameTextController,
      _passwordTextController,
      _usernameTextController
    ];
    for (var controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }
    setState(() {
      _formProgress = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedProgressIndicator(value: _formProgress),
          Text('Sign in', style: Theme.of(context).textTheme.headline4),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: InputDecoration(hintText: 'User name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              controller: _passwordTextController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateColor.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white;
              }),
              backgroundColor:
                  MaterialStateColor.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.blue;
              }),
            ),
            // onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                _signInWithEmailAndPassword();
              }
            },
            child: Text('Sign in'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
        ],
      ),
    );
  }
}

class AnimatedProgressIndicator extends StatefulWidget {
  final double value;

  AnimatedProgressIndicator({
    @required this.value,
  });

  @override
  State<StatefulWidget> createState() {
    return _AnimatedProgressIndicatorState();
  }
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _curveAnimation;

  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1200), vsync: this);

    var colorTween = TweenSequence([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.red, end: Colors.orange),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.orange, end: Colors.yellow),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.yellow, end: Colors.green),
        weight: 1,
      ),
    ]);

    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        var curveAnimation = _curveAnimation;
        return LinearProgressIndicator(
          value: curveAnimation.value,
          valueColor: _colorAnimation,
          backgroundColor: _colorAnimation.value.withOpacity(0.4),
        );
      },
    );
  }
}
