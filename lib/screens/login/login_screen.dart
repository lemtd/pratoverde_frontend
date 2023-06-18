import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pockectcheff/screens/login/register_screen.dart';
import 'package:pockectcheff/screens/login/reset_password_screen.dart';
import 'package:pockectcheff/screens/login/perfil_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isSelected = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          10,
          0,
          10,
          0,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/veggie.png', width: 150,)
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Novo por aqui? ",
                      style: TextStyle(
                        color: Color(0XFF3B5137),
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                    InkWell(
                      child: new Text(
                        'Crie uma conta.',
                        style: TextStyle(
                          color: Color(0XFFFC8228),
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        cursorColor: Color(0XFFFC8228),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          labelText: "E-mail", hintText: 'nome@email.com',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        controller: emailController,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        textAlign: TextAlign.center,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return "Digite seu e-mail";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: _isObscure,
                        cursorColor: Color(0XFFFC8228),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          labelText: "Password", hintText: 'Digite sua senha',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                        ),
                        controller: passwordController,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        textAlign: TextAlign.center,
                        validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            return "Digite sua senha";
                          } else if(senha.length<6){
                            return "Digite uma senha mais forte";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          child: Row(
                            children: <Widget>[
                              Transform.scale(
                                scale: 0.8,
                                child: Checkbox(
                                  activeColor: Color(0XFF3B5137),
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.all(
                                    Color(0XFF3B5137),
                                  ),
                                  value: _isSelected,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      _isSelected = newValue!;
                                      print(_isSelected);
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                "Salvar credenciais",
                                style: TextStyle(fontSize: 13),
                              )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ButtonTheme(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            primary: Color(0XFF91C788),
                          ),
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                              }
                              // Simulando uma autenticação bem-sucedida
                bool isAuthenticated = true;

                if (isAuthenticated) {
                  navigateToProfile(context);
                } else { print('errooor');
                  // Exibir mensagem de erro ou realizar outra ação
                }
                            },
                          child: Text("Login"),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Esqueceu senha? ",
                            style: TextStyle(
                              color: Color(0XFF3B5137),
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                          InkWell(
                            child: new Text(
                              'Redefina.',
                              style: TextStyle(
                                color: Color(0XFFFC8228),
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                            onTap: () {}
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        child: new Text(
                          'Cadastro de alimento (temporário)',
                          style: TextStyle(
                            color: Color(0XFF3B5137),
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterFood(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void navigateToProfile(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => ProfileScreen()),
  );
}

void navigateToLogin(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => LoginScreen()),
    (route) => false,
  );
}
}