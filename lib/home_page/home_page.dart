import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _value = 0;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _loadValue();
  }

  Future<void> _loadValue() async {
    final user = _auth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        setState(() {
          _value = doc.data()?['value'];
        });
      }
    }
  }

  Future<void> _incrementValue() async {
    final user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _value++;
      });
      await _firestore.collection('users').doc(user.uid).set({
        'value': _value,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, Routes.login);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Logged Out'),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Value: $_value'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _value++;
                });
                _firestore.collection('users').doc(_auth.currentUser!.uid).set({
                  'value': _value,
                });
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
