import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/controller/home_page.dart';
import 'signup_page.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "تسجيل الدخول",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(7000),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 146, 239),
        automaticallyImplyLeading: false,
      ), //AppBar
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 169, 223, 255),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Lottie.asset(
                  'assets/animation/ppmana.json', // تأكد من مسار الـ asset الصحيح للتحريك
                  width: 500.0,
                  height: 230.0,
                ),
                const SizedBox(height: 40.0),
                TextField(
                  controller: emailController,
                  cursorColor: Colors.cyan,
                  decoration: const InputDecoration(
                    labelText: 'البريد الإلكتروني',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(
                            255, 15, 146, 239)), // Cyan color for label text
                    prefixIcon: Icon(Icons.email_outlined,
                        color: Color.fromARGB(
                            255, 15, 146, 239)), // Cyan color for icon

                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.cyan), // Consistent border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 15, 146, 239)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 15, 146, 239)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 25.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  cursorColor: Colors.cyan,
                  decoration: const InputDecoration(
                    labelText: 'كلمة المرور',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(
                            255, 15, 146, 239)), // Cyan color for label text
                    prefixIcon: Icon(Icons.lock_outline,
                        color: Color.fromARGB(
                            255, 15, 146, 239)), // Cyan color for icon
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(
                              255, 15, 146, 239)), // Consistent border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 15, 146, 239)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 15, 146, 239)),
                    ),
                  ),
                ),
                const SizedBox(height: 74.0),
                ElevatedButton(
                  onPressed: () async {
                    final String email = emailController.text.trim();
                    final String password = passwordController.text.trim();
                    if (email.isEmpty || password.isEmpty) {
                      // عرض رسالة الخطأ مع صورة
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              'خطأ في الإدخال',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Lottie.asset('assets/animation/WOR.json',
                                    height:
                                        200), // يجب أن تكون الصورة موجودة في مجلد الـ assets
                                const SizedBox(
                                  height: 10,
                                ),
                                const Center(
                                  child: Text(
                                    'يرجى ملء كل من حقول البريد \n       الإلكتروني وكلمة المرور',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'موافق',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                      return; // لإيقاف تنفيذ الكود في حال كان أحد الحقول فارغ
                    }
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const WelcomePage(),
                        ),
                      );
                    } on FirebaseAuthException catch (e) {
                      String message =
                          '       كلمة المرور او البريد الإلكتروني       \n          غير صحيح حاول مرة اخرى ';
                      String lottieAsset =
                          'assets/animation/WOR.json'; // مسار ملف تحريك Lottie للخطأ

                      if (e.code == 'user-not-found') {
                        message = 'لم يتم العثور على المستخدم!';
                      } else if (e.code == 'wrong-password') {
                        message = 'كلمة المرور غير صحيحة!';
                      }

                      // عرض رسالة الخطأ مع تحريك Lottie
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              'خطأ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.cyan),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Lottie.asset(lottieAsset,
                                    width: 150, height: 150), // تحريك Lottie
                                const SizedBox(height: 10),
                                Text(
                                  message,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'موافق',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 60.0),
                    backgroundColor: const Color.fromARGB(255, 15, 146, 239),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'تسجيل الدخول',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'سجل الآن',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 15, 146, 239)),
                      ),
                    ),
                    const Text(
                      'ليس لديك حساب؟',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
