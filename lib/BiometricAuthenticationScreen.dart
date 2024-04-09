import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuthenticationScreen extends StatefulWidget {
  @override
  _BiometricAuthenticationScreenState createState() => _BiometricAuthenticationScreenState();
}

class _BiometricAuthenticationScreenState extends State<BiometricAuthenticationScreen> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  String _authStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biometric Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _authStatus,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text('Authenticate with Biometrics'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: 'Authenticate to access the app',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } catch (e) {
      print('Error authenticating: $e');
    }

    if (authenticated) {
      setState(() {
        _authStatus = 'Biometric authentication successful!';
      });
    } else {
      setState(() {
        _authStatus = 'Biometric authentication failed!';
      });
    }
  }
}
