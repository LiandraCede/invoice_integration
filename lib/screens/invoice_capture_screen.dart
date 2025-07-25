import 'package:flutter/material.dart';

class InvoiceCaptureScreen extends StatefulWidget {
  const InvoiceCaptureScreen({super.key});

  @override
  State<InvoiceCaptureScreen> createState() => _InvoiceCaptureScreenState();
}

class _InvoiceCaptureScreenState extends State<InvoiceCaptureScreen> {
  final _invoiceNumberController = TextEditingController();
  final _termsController = TextEditingController();
  final _customerIdController = TextEditingController();
  final _invoiceDateController = TextEditingController();
  final _amountController = TextEditingController();
  String? _selectedStatus;

  @override
  void dispose() {
    _invoiceNumberController.dispose();
    _termsController.dispose();
    _customerIdController.dispose();
    _invoiceDateController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _invoiceDateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void _submitForm() {
    if (_invoiceNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingrese el número de factura.')),
      );
      return;
    }

    // En una aplicación real, aquí se guardarían los datos de la factura.
    // Para esta demostración, navegamos a la pantalla del visor.
    Navigator.pushNamed(
      context,
      '/invoice_viewer',
      arguments: _invoiceNumberController.text, // Pasamos el número de factura como argumento
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Factura (App A)'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Capture los datos de la factura',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _invoiceNumberController,
                    decoration: const InputDecoration(
                      labelText: 'No. Factura',
                      hintText: 'Ej: 123456',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _termsController,
                    decoration: const InputDecoration(
                      labelText: 'Condiciones de Pago',
                      hintText: 'Ej: Contado, 30 días',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _customerIdController,
                    decoration: const InputDecoration(
                      labelText: 'ID del Cliente',
                      hintText: 'Ej: CLT-00123',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _invoiceDateController,
                    decoration: InputDecoration(
                      labelText: 'Fecha de la Factura',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                    readOnly: true, // Make it read-only so date picker is the only way to set date
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      labelText: 'Monto Total',
                      hintText: 'Ej: 12500.00',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedStatus,
                    decoration: const InputDecoration(
                      labelText: 'Estado',
                      border: OutlineInputBorder(),
                    ),
                    hint: const Text('Seleccione el estado'),
                    items: <String>['Pendiente', 'Pagada'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedStatus = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _submitForm,
                      icon: const Icon(Icons.receipt),
                      label: const Text('Registrar Factura y Ver Imagen'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
