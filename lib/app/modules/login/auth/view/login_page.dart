import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pizza_delivery_app/app/modules/login/auth/controllers/login_controller.dart';
import 'package:pizza_delivery_app/app/modules/splash/splash_page.dart';
import 'package:pizza_delivery_app/shared/components/pizza_delivery_button.dart';
import 'package:pizza_delivery_app/shared/components/pizza_delivery_input.dart';
import 'package:pizza_delivery_app/shared/mixins/loader_mixin.dart';
import 'package:pizza_delivery_app/shared/mixins/messages_mixin.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatelessWidget {
  static const router = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (context) => LoginController(),
            child: LoginContent(),
          ),
        ),
      ),
    );
  }
}

class LoginContent extends StatefulWidget {
  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> with LoaderMixin, MessagesMixin {
  final formKey = GlobalKey<FormState>();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final obscurePasswordValueNotifier = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    final loginController = context.read<LoginController>();
    loginController.addListener(() {
      showLoaderHideHelper(context, loginController.showLoader);
      if(!isNull(loginController.error)){
        showError(message: loginController.error, context: context);
      }

      if(loginController.success){
        Navigator.of(context).pushNamedAndRemoveUntil(SplashPage.router, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Image.asset('assets/images/logo.png', width: 250),
        Container(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  PizzaDeliveryInput('E-mail',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailEditingController,
                    validator: (value){
                      if(!isEmail(value?.toString() ?? '')){
                        return 'Email inválido';
                      }else{
                        return null;
                      }
                    },
                  ),
                  ValueListenableBuilder(
                      valueListenable: obscurePasswordValueNotifier,
                      builder: (BuildContext context, obscurePasswordValueNotifierValue, Widget child) {
                         return PizzaDeliveryInput('Senha',
                              obscureText: obscurePasswordValueNotifierValue,
                              controller: passwordEditingController,
                              suffixIcon: Icon(FontAwesome.key),
                              suffixIconOnPressed: (){
                                obscurePasswordValueNotifier.value = !obscurePasswordValueNotifierValue;
                              },
                              validator: (value) {
                                if(!isLength(value.toString(), 6)){
                                  return 'Senha deve conter no mínimo 6 caracteres';
                                }else{
                                  return null;
                                }
                              },
                            );
                      },
                   ),
                  SizedBox(height: 20),
                  PizzaDeliveryButton(
                    'LOGIN',
                    onPressed: (){
                      if(formKey.currentState.validate()){
                        context.read<LoginController>().login(
                          emailEditingController.text, 
                          passwordEditingController.text,
                        );
                      }
                    },
                    height: 50,
                    labelColor: Colors.white,
                    labelSize: 18,
                    buttonColor: Theme.of(context).primaryColor,
                    width: MediaQuery.of(context).size.width * 0.8, // 80% Larg
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  FlatButton(
                    onPressed: () {  },
                    child: Text('Cadastre-se',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Arial',
                            color: Colors.black54
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// TODO: 1:44:00 -> Bug do Rahman e bug aqui nao saindo do circular