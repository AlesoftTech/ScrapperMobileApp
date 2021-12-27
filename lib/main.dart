import 'package:audioplayers/audioplayers.dart';
import 'package:covid_scanner/_qrView.dart';
import 'package:covid_scanner/access_granted.dart';
import 'package:covid_scanner/custom_outlined_button.dart';
import 'package:covid_scanner/info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Escanear carnét de vacunación',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 33, 118, 129),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Al presionar el botón iniciar, deberá escanear el código Qr del certificado.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            child: Center(
              child: Image.asset('assets/scanner.png'),
            ),
          ),
          idForm(),
          Padding(
              padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: CustomOutlinedButton(
                      text: 'Consultar',
                      color: Color.fromARGB(255, 108, 193, 144),
                      textColor: Colors.white,
                      isFilled: true,
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
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: CustomOutlinedButton(
                      text: 'Escanear',
                      color: Color.fromARGB(255, 33, 118, 129),
                      textColor: Colors.white,
                      isFilled: true,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          QRViewExample qr =  QRViewExample();
                          return qr;
                        }));
                      },
                    ),
                  ),
                ],
              )
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
          labelText: "",
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
