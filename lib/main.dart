import 'package:covid_scanner/_qrView.dart';
import 'package:covid_scanner/access_granted.dart';
import 'package:covid_scanner/info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(""),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String data = "";
  MyHomePage(this.data);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  _MyHomePageState createState() => _MyHomePageState(data);
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _nameController =  TextEditingController();
  TextEditingController _idController =  TextEditingController();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String data = "";

  _MyHomePageState(this.data);


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
            "VacChecker",
          style: TextStyle(
            color: Colors.lightBlueAccent
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          idForm(),
          Container(
            margin: EdgeInsets.all(10),
            child: OutlinedButton(
              child: Text("Consultar"),
              onPressed: (){
                if(data.isEmpty){
                  Get.snackbar("error", "vacìo");
                }else{
                  InfoController cont = Get.put(InfoController());
                  cont.fetchInfo(data);
                  Get.to(AccessGranted());
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: scann(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget idForm(){
    _idController.value = TextEditingValue(text: data);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: TextFormField(
        controller: _idController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          fillColor: Colors.lightBlueAccent,
          labelText: "Credentials",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
  Widget scann(){
    return FloatingActionButton(
      backgroundColor: Colors.lightBlueAccent,
      child: Icon(
        Icons.qr_code_scanner_rounded,
      ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          QRViewExample qr =  QRViewExample();
          return qr;
        }));
      },
    );
  }

}
