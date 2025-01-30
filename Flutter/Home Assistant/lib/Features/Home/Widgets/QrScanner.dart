// import 'package:flutter/material.dart';
// import 'package:home_assistant/Utils/Constants.dart';
// import 'package:home_assistant/Widgets/ReusableText.dart';
// import 'package:lottie/lottie.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class QrScanner extends StatefulWidget {
//   const QrScanner({super.key});

//   @override
//   State<QrScanner> createState() => _QrScannerState();
// }

// class _QrScannerState extends State<QrScanner> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   QRViewController? controller;

//   Future<PermissionStatus> _checkCameraPermission() async {
//     var status = await Permission.camera.status;
//     if (status.isDenied) {
//       status = await Permission.camera.request();
//     }
//     return status;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _checkCameraPermission(),
//       builder: (context, snapshot) {
//         if (snapshot.data != null) {
//           return (snapshot.data!.isDenied || snapshot.data!.isPermanentlyDenied)
//               ? cameraNotAllowed()
//               : qrScan();
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }

//   Widget cameraNotAllowed() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Reusabletext("Camera access not allowed", FontWeight.bold,
//               Constants.primaryColor, 19),
//           const SizedBox(height: 8),
//           Image.asset(
//             "Assets/Images/camera.png",
//             scale: 5,
//           ),
//           const SizedBox(height: 8),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               "Go to your system settings and turn on  the permission",
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           const SizedBox(height: 8),
//           ElevatedButton(
//             onPressed: () async {
//               await Permission.camera.onDeniedCallback(() {
//                 openAppSettings();
//                 setState(() {});
//               }).onPermanentlyDeniedCallback(() {
//                 openAppSettings();
//                 setState(() {});
//               }).request();
//               setState(() {});
//             },
//             child: const Text("ENABLE CAMERA PERMISSION"),
//           )
//         ],
//       ),
//     );
//   }

//   // Widget qrScan() {
//   //   return Stack(
//   //     children: <Widget>[
//   //       Expanded(
//   //         flex: 5,
//   //         child: QRView(
//   //           key: qrKey,
//   //           onQRViewCreated: _onQRViewCreated,
//   //         ),
//   //       ),
//   //       Positioned(
//   //         top: 90,
//   //         left: 70,
//   //         child: Lottie.network(
//   //           'https://lottie.host/2aad288d-60d9-44da-972d-b65fe8db4aab/izcbktKCc7.json',
//   //           height: 250,
//   //           width: 250,
//   //         ),
//   //       )
//   //     ],
//   //   );
//   // }
//   Widget qrScan() {
//     return Stack(
//       children: <Widget>[
//         Positioned(
//           top: 0,
//           bottom: 0,
//           left: 0,
//           right: 0,
//           child: QRView(
//             key: qrKey,
//             onQRViewCreated: _onQRViewCreated,
//           ),
//         ),
//         Positioned(
//           top: 90,
//           left: 70,
//           child: Lottie.network(
//             'https://lottie.host/2aad288d-60d9-44da-972d-b65fe8db4aab/izcbktKCc7.json',
//             height: 250,
//             width: 250,
//           ),
//         )
//       ],
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
