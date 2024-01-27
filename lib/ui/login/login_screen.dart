import 'package:flutter/material.dart';
import 'package:socialappflutter/custom/base_scaffold.dart';
import 'package:socialappflutter/ui/forget_password/forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  bool rememberPassword = false;

  void setCheckBoxRememberPassword(bool value) {
    setState(() {
      rememberPassword = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      baseBody: Container(
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: MediaQuery.of(context).size.height * 0.25),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Đăng nhập',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 5,
            ),
            const Text('Nhập tài khoản và mật khẩu của bạn'),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: emailTextController,
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.left,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Nhập tài khoản...',
                  contentPadding: const EdgeInsets.all(18),
                  isDense: true,
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordTextController,
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.left,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Nhập mật khẩu...',
                  contentPadding: const EdgeInsets.all(18),
                  isDense: true,
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(mainAxisSize: MainAxisSize.max, children: [
              Checkbox(
                  value: rememberPassword,
                  onChanged: (value) {
                    setCheckBoxRememberPassword(value ?? false);
                  }),
              const Text(
                'Ghi nhớ đăng nhập',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const Expanded(
                child: Text(
                  'Quên mật khẩu?',
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.lightBlue, fontSize: 16),
                ),
              ),
            ]),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    Navigator.of(context).pushNamed(ForgetPasswordScreen.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Chưa có tài khoản? Đăng ký ngay',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
