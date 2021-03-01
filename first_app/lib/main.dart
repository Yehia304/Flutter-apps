import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: _SizedBoxExample(),
    );
  }
}

class _SizedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('المعهد العالي للحاسب الالي',
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/banner4.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Column(children: [
            SizedBox(height: 15),
            Image.asset('assets/images/logo.png'),
            Text('وزارة التعليم العالي',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('معاهد أبوقير العليا',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            Image.asset('assets/images/CISLOGO.png'),
            SizedBox(height: 15),
            RaisedButton(onPressed: _launchURL, child: Text('Go')),
            SizedBox(height: 15),
            Image.asset('assets/images/HITHR.png'),
            SizedBox(height: 15),
            RaisedButton(onPressed: _launchURL, child: Text('Go')),
            SizedBox(height: 15),
            RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp2()),
                  );
                },
                child: Text('Go'))
          ])),
        ));
  }
}

_launchURL() async {
  final Uri uri = Uri(
    scheme: 'https',
    path: 'www.dahab-informatics.com/test',
    queryParameters: {'name': 'dahab-informatics', 'about': 'Flutter Dart'},
  );

  if (await canLaunch(uri.toString())) {
    await launch(
      uri.toString(),
      forceWebView: true,
      enableJavaScript: true,
      enableDomStorage: true,
    );
  } else {
    print('Could not launch url');
  }
}

class MyApp2 extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('InAppWebView Example'),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
                "CURRENT URL\n${(url.length > 50) ? url.substring(0, 50) + "..." : url}"),
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container()),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: InAppWebView(
                initialUrl: "https://flutter.dev/",
                initialHeaders: {},
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                  debuggingEnabled: true,
                )),
                onWebViewCreated: (InAppWebViewController controller) {
                  webView = controller;
                },
                onLoadStart: (InAppWebViewController controller, String url) {
                  setState(() {
                    this.url = url;
                  });
                },
                onLoadStop:
                    (InAppWebViewController controller, String url) async {
                  setState(() {
                    this.url = url;
                  });
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  if (webView != null) {
                    webView.goBack();
                  }
                },
              ),
              RaisedButton(
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  if (webView != null) {
                    webView.goForward();
                  }
                },
              ),
              RaisedButton(
                child: Icon(Icons.refresh),
                onPressed: () {
                  if (webView != null) {
                    webView.reload();
                  }
                },
              ),
              RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go'))
            ],
          ),
        ])),
      ),
    );
  }
}
