import 'package:flutter/material.dart';
import 'package:monefy/constants/appstyle.dart';
import 'package:monefy/pages/categoriesstats.dart';
import 'package:monefy/pages/dailystats.dart';
import 'package:monefy/pages/homepage.dart';
import 'package:monefy/pages/monthlystats.dart';
import 'package:monefy/widgets/addTransDialog.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.shifting,
        backgroundColor: AppStyle.mainColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: AppStyle.mainColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Week",
            backgroundColor: AppStyle.mainColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.add,
              size: 0,
            ),
            label: " ",
            backgroundColor: AppStyle.mainColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ssid_chart),
            label: "Monthly",
            backgroundColor: AppStyle.mainColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline),
            label: "Categories",
            backgroundColor: AppStyle.mainColor,
          ),
        ],
        onTap: (int newPage) {
          if (newPage != 2) {
            setState(() {
              currentPage = newPage;
            });
          }
        },
        currentIndex: currentPage,
        selectedFontSize: 16,
        selectedItemColor: AppStyle.accentOff,
        unselectedFontSize: 14,
        unselectedItemColor: AppStyle.accentColor,
      ),
      body: currentPage == 0
          ? HomePage()
          : currentPage == 1
              ? DailyStats()
              : currentPage == 3
                  ? MonthlyStats()
                  : CategoriesStats(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context, builder: (context) => AddTransDialog());
            },
            shape: CircleBorder(),
            backgroundColor: AppStyle.accentColor,
            foregroundColor: Colors.white,
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
