
import 'package:audioplayers/audioplayers.dart';
import 'package:covid_scanner/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  static const flashOn = 'FLASH ON';
  static const flashOff = 'FLASH OFF';
  static const frontCamera = 'FRONT CAMERA';
  static const backCamera = 'BACK CAMERA';
  var qrText = '';
  var flashState = flashOn;
  var cameraState = frontCamera;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  static AudioCache player = new AudioCache();
  static const  alarmAudioPath = "beep-07.mp3";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Color.fromARGB(255, 108, 193, 144),
              borderRadius: 10,
              borderLength: 150,
              borderWidth: 5,
              cutOutSize: 300,
            )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    iconSize: 40,
                    icon: Icon(
                        Icons.flash_on_outlined,
                      color: Color.fromARGB(255, 108, 193, 144),
                    ),
                    onPressed: () {
                      if (controller != null) {
                        controller.toggleFlash();
                        if (_isFlashOn(flashState)) {
                          setState(() {
                            flashState = flashOff;
                          });
                        } else {
                          setState(() {
                            flashState = flashOn;
                          });
                        }
                      }
                    },
                  ),
                  IconButton(
                    iconSize: 40,
                    icon: Icon(
                      Icons.flip_camera_android_outlined,
                      color: Color.fromARGB(255, 108, 193, 144),
                    ),
                    onPressed: () {
                      if (controller != null) {
                        controller.flipCamera();
                        if (_isBackCamera(cameraState)) {
                          setState(() {
                            cameraState = frontCamera;
                          });
                        } else {
                          setState(() {
                            cameraState = backCamera;
                          });
                        }
                      }
                    },
                  ),
                  IconButton(
                    iconSize: 40,
                    icon: Icon(
                      Icons.pause_circle_filled_outlined,
                      color: Color.fromARGB(255, 108, 193, 144),
                    ),
                    onPressed: () {
                      controller?.pauseCamera();
                    },
                  ),
                  IconButton(
                    iconSize: 40,
                    icon: Icon(
                      Icons.play_circle_fill_outlined,
                      color: Color.fromARGB(255, 108, 193, 144),
                    ),
                    onPressed: () {
                      controller?.resumeCamera();
                    },
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  bool _isFlashOn(String current) {
    return flashOn == current;
  }

  bool _isBackCamera(String current) {
    return backCamera == current;
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
      player.play(alarmAudioPath);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return new MyHomePage(scanData);
      }));
      dispose();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

