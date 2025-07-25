import 'package:flutter/material.dart';
import 'package:flutter_invoice_project/screens/invoice_capture_screen.dart';
import 'package:flutter_invoice_project/screens/invoice_viewer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integración de Facturas',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InvoiceCaptureScreen(),
        '/invoice_viewer': (context) => const InvoiceViewerScreen(),
      },
    );
  }
}
