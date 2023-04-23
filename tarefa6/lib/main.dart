import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Formulário'),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(  
              icon: Icon(Icons.person),  
              hintText: 'Escreva seu nome',  
              labelText: 'Name',  
            ),  

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Escreva algo válido';
              }
              return null;
            },
      
          ),

          TextFormField(
            decoration: const InputDecoration(  
              icon: Icon(Icons.phone),  
              hintText: 'Digite seu número de telefone',  
              labelText: 'Telefone',    
            ),  

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Escreva algo válido';
              }
              return null;
            },
      
          ),

          GestureDetector(
            onTap: () {
              DatePicker.showDatePicker(
                context,
                onConfirm: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              );
            },

            child: AbsorbPointer(
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  hintText: 'Data de nascimento',
                  labelText: 'Data de nascimento',
                ),
                controller: TextEditingController(
                  text: _selectedDate != null
                      ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                      : '',
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Escolha uma data';
                  }
                  return null;
                },

              ),
            ),
          ),
         
    
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
      
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
      
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processando')),
                  );
                }
              },
      
              child: const Text('Enviar'),
      
            ),
          ),
        ],


      ),
    );
  }
}