import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'معاهد أبوقير العليا',
      home: MyApp2(),
    );
  }
}

// _launchURL() async {
//   final Uri uri = Uri(
//     scheme: 'https',
//     path: 'www.dahab-informatics.com/test',
//     queryParameters: {'name': 'dahab-informatics', 'about': 'Flutter Dart'},
//   );

//   if (await canLaunch(uri.toString())) {
//     await launch(
//       uri.toString(),
//       forceWebView: true,
//       enableJavaScript: true,
//       enableDomStorage: true,
//     );
//   } else {
//     print('Could not launch url');
//   }
// }

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("\n\nBrowser Created!\n\n");
  }

  @override
  Future onLoadStart(String url) async {
    print("\n\nStarted $url\n\n");
  }

  @override
  Future onLoadStop(String url) async {
    print("\n\nStopped $url\n\n");
  }

  @override
  void onLoadError(String url, int code, String message) {
    print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(int progress) {
    print("Progress: $progress");
  }

  @override
  void onExit() {
    print("\n\nBrowser closed!\n\n");
  }

  @override
  Future<ShouldOverrideUrlLoadingAction> shouldOverrideUrlLoading(
      ShouldOverrideUrlLoadingRequest shouldOverrideUrlLoadingRequest) async {
    print("\n\n override ${shouldOverrideUrlLoadingRequest.url}\n\n");
    return ShouldOverrideUrlLoadingAction.ALLOW;
  }

  @override
  void onLoadResource(LoadedResource response) {
    print("Started at: " +
        response.startTime.toString() +
        "ms ---> duration: " +
        response.duration.toString() +
        "ms " +
        response.url);
  }

  @override
  void onConsoleMessage(ConsoleMessage consoleMessage) {
    print("""
    console output:
      message: ${consoleMessage.message}
      messageLevel: ${consoleMessage.messageLevel.toValue()}
   """);
  }
}

class MyApp2 extends StatefulWidget {
  final MyInAppBrowser browser = new MyInAppBrowser();

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('معاهد أبوقير العليا',
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bookwhite.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Column(children: [
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                widget.browser.openUrl(
                    url: "https://aboukir-institutes.edu.eg/",
                    options: InAppBrowserClassOptions(
                        inAppWebViewGroupOptions: InAppWebViewGroupOptions(
                            crossPlatform: InAppWebViewOptions(
                      useShouldOverrideUrlLoading: true,
                      useOnLoadResource: true,
                    ))));
              },
              child: Image.asset(
                'assets/images/151.png',
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                widget.browser.openUrl(
                    url:
                        "https://quizcis.aboukir-institutes.com/login/index.php",
                    options: InAppBrowserClassOptions(
                        inAppWebViewGroupOptions: InAppWebViewGroupOptions(
                            crossPlatform: InAppWebViewOptions(
                      useShouldOverrideUrlLoading: true,
                      useOnLoadResource: true,
                    ))));
              },
              child: Image.asset(
                'assets/images/HICIS.png',
                width: 350,
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                widget.browser.openUrl(
                    url:
                        "https://quiztour.aboukir-institutes.com/login/index.php",
                    options: InAppBrowserClassOptions(
                        inAppWebViewGroupOptions: InAppWebViewGroupOptions(
                            crossPlatform: InAppWebViewOptions(
                      useShouldOverrideUrlLoading: true,
                      useOnLoadResource: true,
                    ))));
              },
              child: Image.asset(
                'assets/images/HITR.png',
                width: 350,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'E-mail : info@aboukir-institutes.edu.eg',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 15),
            Text(
              'الرقم المختصر : 15549',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 15),
            Text(
              'Telephone number : +203/5625241',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 15),
            Text(
              'Telephone number 2 : +203/5624777',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 15),
            Text(
              'Telephone number 3 : +203/5613070',
              style: TextStyle(color: Colors.white),
            ),
          ])),
        ));
  }
}
