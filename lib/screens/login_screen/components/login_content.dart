import 'package:flutter/material.dart';

import 'package:flutter_proje/locator.dart';
import 'package:flutter_proje/services/auth_service.dart';
import 'package:flutter_proje/utils/helper_functions.dart';
import '../../../utils/constants.dart';
import '../animations/change_screen_animation.dart';
import 'bottom_text.dart';
import 'top_text.dart';

enum Screens {
  signUp,
  signIn,
}

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent>
    with TickerProviderStateMixin {
  late final List<Widget> createAccountContent;
  late final List<Widget> loginContent;

  final _tName = TextEditingController();
  final _tEmail = TextEditingController();
  final _tPassword = TextEditingController();

  Widget inputField(TextEditingController controller, String hint, IconData iconData) {
    return SingleChildScrollView(

      physics: BouncingScrollPhysics(),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36 , vertical: 8),
        child: SizedBox(
          height: 50,
          child: Material(
            elevation: 8,
            shadowColor: Colors.black87,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            child: TextField(
              controller: controller,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: hint,
                prefixIcon: Icon(iconData),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget actionButton(String title, {Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: () {
         if (onTap != null) {
           onTap();
         }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14), backgroundColor: kSecondaryColor,
          shape: const StadiumBorder(),
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),

          Flexible(

            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }



  Widget forgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Şifremi Unuttum',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    createAccountContent = [
      inputField(_tName, 'İsim', Icons.person_outline),
      inputField(_tEmail, 'Email', Icons.mail_outline),
      inputField(_tPassword, 'Şifre', Icons.lock),
      actionButton('Kayıt Ol ve Gir', onTap: () => locator.get<AuthService>().signUp(context, name: _tName.text, email: _tEmail.text, password: _tPassword.text),),
      orDivider(),

    ];

    loginContent = [
      inputField(_tEmail, 'Email', Icons.mail_outline),
      inputField(_tPassword, 'Şifre', Icons.lock),
      actionButton('Giriş Yap', onTap: () => locator.get<AuthService>().signIn(context, email: _tEmail.text, password: _tPassword.text),),
      forgotPassword(),
    ];

    ChangeScreenAnimation.initialize(
      vsync: this,
      createAccountItems: createAccountContent.length,
      loginItems: loginContent.length,
    );

    for (var i = 0; i < createAccountContent.length; i++) {
      createAccountContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.createAccountAnimations[i],
        child: createAccountContent[i],
      );
    }

    for (var i = 0; i < loginContent.length; i++) {
      loginContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.loginAnimations[i],
        child: loginContent[i],
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    ChangeScreenAnimation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        const Positioned(
          top: 136,
          left: 24,
          child: TopText(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: createAccountContent,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: loginContent,
              ),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: BottomText(),
          ),
        ),
      ],
    );
  }
}
