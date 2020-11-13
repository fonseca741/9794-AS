import 'package:flutter/material.dart';
import 'package:iclothes/routes/app_routes.dart';

class ViewLogin extends StatefulWidget {
  @override
  _ViewLoginState createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  final _form = GlobalKey<FormState>();
  //final Map<String, Object> _formData = {};

  void verificarLogin() {
    // if (_form.currentState.validate()) {
    //   Navigator.pushReplacementNamed(context, AppRoutes.HOME);
    // }
    Navigator.pushReplacementNamed(context, AppRoutes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage('lib/assets/foto_login.jpeg'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Digite o Email',
                      border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(20)))),
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Insira um email para login';
                    } else if (!value.contains('@') ||
                        !value.endsWith('.com')) {
                      return 'Insira um email válido';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Digite a senha',
                      border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(20)))),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Insira uma senha para login';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(fontSize: 20),
                      ),
                      textColor: Colors.white,
                      color: Color.fromRGBO(95, 140, 245, 1),
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () => {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.CADASTRO_USUARIO)
                      },
                    ),
                    RaisedButton(
                      child: Text(
                        'Entrar',
                        style: TextStyle(fontSize: 20),
                      ),
                      textColor: Colors.white,
                      color: Color(0xff1d3557),
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () => verificarLogin(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
