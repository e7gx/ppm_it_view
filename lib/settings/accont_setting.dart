import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الاعدادات',
          style: TextStyle(
            fontFamily: 'Cario',

            color: Colors.white,
            fontSize: 24, //  تغيير هذه القيمة لتكون الحجم
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
        child: ListView(
          children: [
            // قائمة الإشعارات
            ListTile(
              leading: const Icon(Icons.notifications), // أيقونة الإشعارات
              title: const Text('الإشعارات'),
              trailing: const Icon(Icons
                  .arrow_forward_ios), // أيقونة الانتقال للصفحة الخاصة بالإشعارات إذا كان هناك
              onTap: () async {
                await launchUrl(Uri.parse(
                    'https://youtu.be/o0RI8frF524?si=djz8hWeK_ldljTlN'));
              },
            ),
            const Divider(), // خط فاصل بين القوائم

            // قائمة تعديل كلمة المرور
            ListTile(
              leading: const Icon(Icons.lock), // أيقونة تعديل كلمة المرور
              title: const Text('تعديل كلمة المرور'),
              trailing: const Icon(Icons
                  .arrow_forward_ios), // أيقونة الانتقال لصفحة تعديل كلمة المرور إذا كان هناك
              onTap: () async {
                await launchUrl(Uri.parse(
                    'https://youtu.be/o0RI8frF524?si=djz8hWeK_ldljTlN'));
              },
            ),
            const Divider(),

            // قائمة اللغة
            ListTile(
              leading: const Icon(Icons.language), // أيقونة اللغة
              title: const Text('اللغة'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () async {
                await launchUrl(Uri.parse(
                    'https://youtu.be/o0RI8frF524?si=djz8hWeK_ldljTlN'));
              },
            ),
            const Divider(),

            // قائمة التقييم وتعديل الصور
            ListTile(
              leading: const Icon(Icons.rate_review), // أيقونة التقييم
              title: const Text('التقييم وتعديل الصور'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () async {
                await launchUrl(Uri.parse(
                    'https://youtu.be/o0RI8frF524?si=djz8hWeK_ldljTlN'));
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
