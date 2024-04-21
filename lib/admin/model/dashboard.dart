import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';

class AdminStatisticsPage extends StatefulWidget {
  const AdminStatisticsPage({super.key});

  @override
  State<AdminStatisticsPage> createState() =>
      _TechnicalSupportStatisticsPageState();
}

class _TechnicalSupportStatisticsPageState extends State<AdminStatisticsPage> {
  User? userId = FirebaseAuth.instance.currentUser;
  int itReportsCount = 0;
  int itReportsReceivedCount = 0;
  int userReportsCount = 0;
  int assetsCount = 0;
  int numberOfUsersEmp = 0;
  int numberOfITEmp = 0;
  Future<void> fetchReportCounts() async {
    final QuerySnapshot itReportsSnapshot =
        await FirebaseFirestore.instance.collection('IT_Reports').get();
    final QuerySnapshot itReportsReceivedSnapshot = await FirebaseFirestore
        .instance
        .collection('IT_Reports_Received')
        .get();

    final QuerySnapshot numberOfAssetsSnapshot =
        await FirebaseFirestore.instance.collection('devices_assets').get();
    final QuerySnapshot userReportsSnapshot =
        await FirebaseFirestore.instance.collection('User_Reports').get();
    final QuerySnapshot numberOfUsersEmpSnapsoht =
        await FirebaseFirestore.instance.collection('Users_Normal').get();
    final QuerySnapshot numberOfITEmpSnapsoht =
        await FirebaseFirestore.instance.collection('Users_Normal').get();
    setState(() {
      itReportsCount = itReportsSnapshot.size;
      itReportsReceivedCount = itReportsReceivedSnapshot.size;
      userReportsCount = userReportsSnapshot.size;
      assetsCount = numberOfAssetsSnapshot.size;
      numberOfUsersEmp = numberOfUsersEmpSnapsoht.size;
      numberOfITEmp = numberOfITEmpSnapsoht.size;
    });
  }

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
        centerTitle: true,
        title: const Text(
          'تقرير حل المشكلة',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Cario',
            color: Colors.white,
            fontSize: 18, //  تغيير هذه القيمة لتكون الحجم
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.teal,
                  Color(0xFF00CCFF),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {
          setState(() {
            fetchReportCounts();
          });
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.refresh,
          color: Colors.teal,
          size: 35,
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Lottie.asset(
              'assets/animation/afterAfect.json',
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Lottie.asset(
              'assets/animation/ppmana.json',
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
              child: const SizedBox(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildMetricCard(
                      title: 'البلاغات المستلمة',
                      value: userReportsCount.toString(),
                      icon: Icons.document_scanner_outlined,
                    ),
                    _buildMetricCard(
                      title: 'البلاغات المغلقة',
                      value: itReportsCount.toString(),
                      icon: Icons.receipt,
                    ),
                    _buildMetricCard(
                      title: 'عدد البلاغات المستلمة',
                      value: '$itReportsReceivedCount',
                      icon: Icons.receipt,
                    ),
                    _buildMetricCard(
                      title: 'موظفين الدعم',
                      value: '${(numberOfITEmp)}',
                      icon: Icons.paragliding,
                    ),
                    _buildMetricCard(
                      title: 'عدد المستفيدين',
                      value: '${(numberOfUsersEmp)}',
                      icon: Icons.person,
                    ),
                    _buildMetricCard(
                      title: 'عدد الاصول المسجلة',
                      value: assetsCount.toString(),
                      icon: Icons.devices,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCardRate({required String title, required String value}) {
    return SafeArea(
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Colors.teal,
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Lottie.asset(
                'assets/animation/like1.json',
                height: 65,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(
      {required String title, required String value, required IconData icon}) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Colors.teal,
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              size: 40, // Adjust the size of the icon as needed
              color: Colors.teal, // Customize the color of the icon
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
