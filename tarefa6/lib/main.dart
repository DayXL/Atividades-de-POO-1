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
  String _selectedGender = 'Homem';
  String selecionarEstado = 'Solteiro';
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite uma senha';
    }
    if (value.length < 8) {
      return 'Senha deve ter pelo menos 8 caracteres';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirme sua senha';
    }
    if (value != _passwordController.text) {
      return 'Senhas não coincidem';
    }
    return null;
  }

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

          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              icon: Icon(Icons.people),
              hintText: 'Selecione seu gênero',
              labelText: 'Gênero',
            ),
            value: _selectedGender,
            onChanged: (newValue) {
              setState(() {
                _selectedGender = newValue!;
              });
            },
            items: <String>['Homem', 'Mulher', 'Outro']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),

          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              icon: Icon(Icons.people),
              hintText: 'Selecione seu estado civil',
              labelText: 'Estado civil',
            ),

            value: selecionarEstado,
            onChanged: (newValue) {
              setState(() {
                selecionarEstado = newValue!;
              });
            },

            items: <String>['Solteiro', 'Casado', 'Divorciado', 'Viúvo', 'Outro']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),

          TextFormField(
            decoration: const InputDecoration(  
              icon: Icon(Icons.lock),  
              hintText: 'Digite sua senha',  
              labelText: 'Senha',  
            ),  

            obscureText: true, 
            controller: _passwordController,
            validator: _validatePassword,   
          ),

          TextFormField(
            decoration: const InputDecoration(  
              icon: Icon(Icons.lock),  
              hintText: 'Confirme sua senha',  
              labelText: 'Confirme a senha',  
            ),  

            obscureText: true, 
            controller: _confirmPasswordController,
            validator: _validateConfirmPassword,   
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