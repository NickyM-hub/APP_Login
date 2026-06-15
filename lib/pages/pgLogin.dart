import 'package:flutter/material.dart';
import 'pgHome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController CPFController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Cadastro'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.person,
              size: 150,
              color: Colors.blue,
            ),

            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: CPFController,
              decoration: const InputDecoration(labelText: 'CPF'),
              keyboardType: TextInputType.number,
              maxLength: 11,
            ),

            const SizedBox(height: 16),

            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
              obscuringCharacter: '*',
            ),

            const SizedBox(height: 32),

            ElevatedButton(

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),

              onPressed: () {
                if (nomeController.text.isEmpty ||
                    passwordController.text.isEmpty || CPFController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Preencha todos os campos'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
                else if (CPFController.text.length != 11 || !RegExp(r'^\d{11}$').hasMatch(CPFController.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('CPF inválido'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
                else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );

                  print('Nome: ${nomeController.text}');
                  print ('CPF: ${CPFController.text}');
                  print('Senha: ${passwordController.text}');
                }
              },

              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
