import 'package:flutter/material.dart';
import 'package:socialappflutter/custom/base_scaffold.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  static String routeName = '/forget_password';

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        baseBody: Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.3, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quên mật khẩu?',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Nhập email bạn đã sử dụng để đăng ký tài khoản',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: emailController,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(18),
              isDense: true,
              hintStyle: const TextStyle(color: Colors.grey),
              label: const Text('Nhập email'),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(18)),
              hintText: 'Nhập email',
            ),
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Gửi yêu cầu',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ))),
        ],
      ),
    ));
  }
}
