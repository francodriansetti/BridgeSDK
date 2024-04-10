#bridgesdk
-----

###  bridgesdk bridgesdk is a Flutter package that provides access to platform-specific functionality such as opening a web view, accessing the camera, and performing biometric authentication. 

Installation
-----

Installation To use bridgesdk in your Flutter project, add it as a dependency in your pubspec.yaml file. `yaml dependencies: bridgesdk: ^0.0.2`

Then run `flutter pub get` to install the package.

Usage
-----

### Opening a WebView


```
import 'package:flutter/material.dart'; 
import 'package:bridgesdk/bridgesdk.dart'; 

void main() { 
runApp(const MyApp()); 
} 
class MyApp extends StatelessWidget { 
const MyApp({Key? key}) : super(key: key); @override Widget build(BuildContext context) { 

return MaterialApp( title: 'Flutter Demo', theme: ThemeData( primarySwatch: Colors.deepPurple,), home: const MyHomePage(title: 'Flutter Demo Home Page'), 
); 
} 
} class MyHomePage extends StatelessWidget { 
const MyHomePage({Key? key, required this.title}) : super(key: key); final String title; @override Widget build(BuildContext context) { 
final Bridgesdk _bridgesdk = Bridgesdk(); 
return Scaffold( appBar: AppBar( title: Text(title), 
), 
body: Center( child: ElevatedButton( onPressed: () {
 
Navigator.of(context).push(MaterialPageRoute( builder: (context) => _bridgesdk.buildWebView(), 
)); 
}, child: const Text('Open WebView'
), 
), 
), 
); 
} 
}
```

### Platform-Specific Configuration

#### Android

-   Minimum SDK version: Android 4.4 (API level 19)
-   Change the activity in your MainActivity.java file to extend FlutterFragmentActivity:

javaCopy code

```
package com.example.testpackageflutter; 
importio.flutter.embedding.android.FlutterFragmentActivity; 
public class MainActivity extendsFlutterFragmentActivity { // Your MainActivity code here 
}
```

#### iOS

-   Add the following entries to your Info.plist file to request camera and microphone permissions:

```
<key>NSCameraUsageDescription</key> 
<string>For testing the camera</string>
<key>NSMicrophoneUsageDescription
</key> <string>For testing the camera
</string><key>NSPhotoLibraryUsageDescription
</key> <string>For testing the camera</string>
```

License
-------

MIT License

Copyright (c) [year] [fullname]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
