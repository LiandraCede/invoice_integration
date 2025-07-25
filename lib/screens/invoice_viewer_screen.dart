import 'package:flutter/material.dart';

class InvoiceViewerScreen extends StatelessWidget {
  const InvoiceViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Recupera el número de factura pasado como argumento
    final String? invoiceNumber =
        ModalRoute.of(context)?.settings.arguments as String?;

    // Simula la lógica para determinar qué imagen mostrar
    String imagePath;
    String imageDescription;
    if (invoiceNumber == '123456') {
      imagePath =
          'assets/images/factura_123456.png'; // Usa la imagen real que hemos añadido
      imageDescription = 'Imagen digitalizada de la factura $invoiceNumber';
    } else if (invoiceNumber != null && invoiceNumber.isNotEmpty) {
      // Para cualquier otro número, usa un placeholder genérico
      imagePath =
          'assets/images/placeholder_invoice.png'; // Necesitarás crear esta imagen
      imageDescription =
          'Imagen digitalizada de la factura $invoiceNumber (Placeholder)';
    } else {
      imagePath =
          'assets/images/placeholder_invoice.png'; // Placeholder si no hay número
      imageDescription = 'No. de Factura no proporcionado';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de Imagen de Factura (App B)'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Visualización de la imagen digitalizada',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'para la factura: ${invoiceNumber ?? "No especificado"}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Container(
                  //   height: 250,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.grey.shade300),
                  //     borderRadius: BorderRadius.circular(8),
                  //     color: Colors.grey.shade200,
                  //   ),
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(8),
                  //     child: Image.asset(
                  //       imagePath,
                  //       fit: BoxFit.contain,
                  //       errorBuilder: (context, error, stackTrace) {
                  //         return Center(
                  //           child: Text(
                  //             'Error al cargar la imagen o imagen no encontrada.\n$imageDescription',
                  //             textAlign: TextAlign.center,
                  //             style: const TextStyle(color: Colors.red),
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Icon(Icons.receipt,size: 120.0,),
                  const SizedBox(height: 10),
                  Text(
                    'En una implementación real, esta sección cargaría la imagen de la factura desde un sistema de gestión documental, utilizando el número de factura como clave. Si ingresas "123456" en la App A, verás una imagen de ejemplo.',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(
                            context); // Vuelve a la pantalla anterior (App A)
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Volver al Registro de Facturas'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
