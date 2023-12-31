import 'package:flutter/material.dart';
import 'package:first_time/reports/it_reports/submited_it_reports/it_display_reports_page.dart';
import 'package:first_time/device_table/device_table_page.dart';
import 'package:first_time/reports/user_reports/device_display_reports.dart';
import 'package:first_time/reports/it_reports/write_it_reports/it_write_solution_report.dart';
import 'package:lottie/lottie.dart';
import 'package:first_time/settings/accont_setting.dart';
import 'package:first_time/settings/it_settings.dart';
import 'package:first_time/user_info/technical_support_statistics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_time/page/display_slide_homepage.dart';
import 'package:first_time/register_assets/register_assets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _selectedIndex = 0; // Set the initial index to 0
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.center,
          '       الصفحة الرئيسية',
          style: TextStyle(
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
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
        toolbarHeight: 50,
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(117, 255, 255, 255),
                Color.fromARGB(185, 0, 204, 255),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 105, 142, 255),
                      Color(0xFF00CCFF),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Text(
                    '              PTM\n For Excelent Assets',
                    style: TextStyle(
                        fontSize: 29,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              ListTile(
                title: const Text(
                  'أضافة أصول تقنية',
                  style: TextStyle(
                    color: Color.fromARGB(195, 37, 37, 37),
                    fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                    fontWeight: FontWeight.bold,
                  ),
                ),
                selected: _selectedIndex == 0,
                onTap: () {
                  // Update the state of the app

                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterDevice()),
                  );
                },
              ),

              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 105, 142, 255),
                      Color(0xFF00CCFF),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Divider(
                  height: 2,
                  // color: Colors.white,
                ),
              ), // خط فاصل بين القوائم
              ListTile(
                title: const Text(
                  'البيانات الشخصية',
                  style: TextStyle(
                    color: Color.fromARGB(195, 37, 37, 37),
                    fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Update the state of the app

                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDataPage()),
                  );
                },
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 105, 142, 255),
                      Color(0xFF00CCFF),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Divider(
                  height: 2,
                  // color: Colors.white,
                ),
              ), // خط فاصل بين القوائ/ خط فاصل بين القوائم
              ListTile(
                title: const Text(
                  ' مؤشر الاداء العام',
                  style: TextStyle(
                    color: Color.fromARGB(195, 37, 37, 37),
                    fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                    fontWeight: FontWeight.bold,
                  ),
                ),
                selected: _selectedIndex == 2,
                onTap: () {
                  // Update the state of the app

                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const TechnicalSupportStatisticsPage()),
                  );
                },
              ),

              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 105, 142, 255),
                      Color(0xFF00CCFF),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Divider(
                  height: 2,
                  // color: Colors.white,
                ),
              ), // خط فاصل بين القوائ/ خط فاصل بين القوائم
              ListTile(
                title: const Text(
                  'اعدادات البرنامج',
                  style: TextStyle(
                    color: Color.fromARGB(195, 37, 37, 37),
                    fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                    fontWeight: FontWeight.bold,
                  ),
                ),
                selected: _selectedIndex == 3,
                onTap: () {
                  // Update the state of the app

                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                },
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 105, 142, 255),
                      Color(0xFF00CCFF),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Divider(
                  height: 2,
                  // color: Colors.white,
                ),
              ), // خط فاصل بين القوائ
            ],
          ),
        ),
      ),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Lottie.asset('assets/animation/ppmana.json',
                width: 400, height: 400),
            // const SizedBox(height: 10),
            const Text('أهلا وسهلا بك',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 50,
                    fontWeight: FontWeight.bold)),
            const Text('اليك بلاغات اليوم',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            buildSlideView(),
          ],
        ),
      ),
    );
  }

  SizedBox buildSlideView() {
    return SizedBox(
      height: 400,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('User_Reports')
            .orderBy('date',
                descending: true) // فرز البيانات بالترتيب العكسي للتاريخ
            .limit(3) // الحصول على آخر ثلاثة بلاغات فقط
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('لا توجد بلاغات'));
          }

          // تحويل البيانات إلى قائمة من SlideData
          final slides = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return SlideData(
              image:
                  'assets/images/uqu.png', // يمكنك تغييرها إلى مسار الصورة الحقيقية إذا وجدت في البيانات
              title: data['location'] ?? 'جهاز غير معروف',
              content: data['problem'] ?? 'مشكلة غير معروفة',
            );
          }).toList();

          return PageView.builder(
            controller: _pageController,
            itemCount: slides.length,
            itemBuilder: (context, index) {
              return SlideWidget(
                image: slides[index].image,
                title: slides[index].title,
                content: slides[index].content,
              );
            },
          );
        },
      ),
    );
  }

//the bottumbar here<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.cyan,
      unselectedItemColor: Colors.grey[750],
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
        navigateToSelectedPage(index);
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.important_devices_rounded), label: 'الأجهزة'),
        BottomNavigationBarItem(
          icon: Icon(Icons.paste_outlined),
          label: 'تقديم تقرير',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_post_office_outlined), label: 'التقارير'),
        BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts_outlined), label: 'جميع البلاغات'),
      ],
    );
  }

  void navigateToSelectedPage(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DeviceTablePage(),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ReportSolutionPage(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ReportsPage(),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DeviceReports(),
          ),
        );
        break;
    }
  }
}
