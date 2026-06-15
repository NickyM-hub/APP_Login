import 'package:flutter/material.dart';
import 'pgLogin.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cursoController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    cursoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Cadastro'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.add_reaction,
                  size: 100,
                  color: Colors.blue,
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: cursoController,
                  decoration: const InputDecoration(
                    labelText: 'Curso',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 18,
                    ),
                  ),
                  onPressed: () {
                    // Verifica campos vazios
                    if (nomeController.text.trim().isEmpty ||
                        emailController.text.trim().isEmpty ||
                        cursoController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Preencha todos os campos'),
                        ),
                      );
                      return;
                    }

                    // Validação do email
                    bool emailValido = RegExp(
                      r'^[\w\.-]+@[\w\.-]+\.\w+$',
                    ).hasMatch(emailController.text.trim());

                    if (!emailValido) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Email inválido'),
                        ),
                      );
                      return;
                    }

                    print('Nome: ${nomeController.text}');
                    print('Email: ${emailController.text}');
                    print('Curso: ${cursoController.text}');

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cadastro realizado com sucesso!'),
                      ),
                    );
                  },
                  child: const Text('Cadastrar'),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 18,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                          (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('Voltar a Tela Inicial'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}