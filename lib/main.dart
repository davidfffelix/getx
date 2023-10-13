import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'value_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final textController = TextEditingController();

  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Valor
            GetX<ValueController>(
              init: valueController,
              builder: (control) {
                return Text('Valor definido: ${control.definedValue}');
              },
            ),

            // Campo
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: TextField(
                controller: textController,
              ),
            ),

            // Botão
            GetX<ValueController>(
              init: valueController,
              builder: (control) {
                return control.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          String value = textController.text;

                          valueController.setValue(value);
                        },
                        child: const Text('Confirmar'),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
