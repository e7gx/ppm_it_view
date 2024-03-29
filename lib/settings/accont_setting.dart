import 'package:first_time/Auth/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool abdullahSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'الاعدادات',
          style: TextStyle(
            fontFamily: 'Cario',

            color: Colors.white,
            fontSize: 22, //  تغيير هذه القيمة لتكون الحجم
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 105, 142, 255),
                  Color(0xFF00CCFF),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        toolbarHeight: 50,
        automaticallyImplyLeading: true,
      ), //AppBar
      body: ListView(
        children: [
          // قائمة الإشعارات
          ListTile(
            leading: const Icon(
              Icons.notifications,
              color: Colors.blue,
            ), // أيقونة الإشعارات
            title: const Text(
              'الإشعارات',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cario',
              ),
            ),
            trailing: Switch(
              value: abdullahSwitch,
              onChanged: (value) {
                setState(() {
                  abdullahSwitch = value;
                });
              },
            ),

            onTap: () async {
              await launchUrl(Uri.parse('https://github.com/e7gx'));
            },
          ),
          const Divider(), // خط فاصل بين القوائم

          // قائمة تعديل كلمة المرور
          ListTile(
            leading: const Icon(
              Icons.lock,
              color: Colors.blue,
            ), // أيقونة تعديل كلمة المرور
            title: const Text(
              'تعديل كلمة المرور',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cario',
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
            ), // أيقونة الانتقال لصفحة تعديل كلمة المرور إذا كان هناك
            onTap: () {
              Navigator.push(
                context,
                // ignore: prefer_const_constructors
                MaterialPageRoute(
                  builder: (context) => const ForgetPasswordPage(),
                ),
              );
            },
          ),
          const Divider(),

          // قائمة اللغة
          ListTile(
            leading: const Icon(
              Icons.language,
              color: Colors.blue,
            ), // أيقونة اللغة
            title: const Text(
              'اللغة',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cario',
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
            ),
            onTap: () async {
              await launchUrl(Uri.parse('https://github.com/e7gx'));
            },
          ),
          const Divider(),

          // قائمة التقييم وتعديل الصور
          ListTile(
            leading: const Icon(
              Icons.rate_review,
              color: Colors.blue,
            ), // أيقونة التقييم
            title: const Text(
              'التقييم وتعديل الصور',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cario',
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
            ),
            onTap: () async {
              await launchUrl(Uri.parse('https://github.com/e7gx'));
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
