import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:monefy/constants/appstyle.dart';
import 'package:monefy/widgets/chatBotDialog.dart';

class CategoriesStats extends StatefulWidget {
  const CategoriesStats({super.key});

  @override
  State<CategoriesStats> createState() => _CategoriesStatsState();
}

class _CategoriesStatsState extends State<CategoriesStats> {
  List<String> categories = ['A', 'B', 'C', 'D'];
  List<double> spends = [10, 20, 15, 7];
  List<Color> colors = [Colors.red, Colors.blue, Colors.yellow, Colors.green];

  List<PieChartSectionData> sections() {
    List<PieChartSectionData> data = [];
    for (int i = 0; i < categories.length; i++) {
      data.add(PieChartSectionData(
          color: colors[i],
          value: spends[i],
          radius: 50,
          title: categories[i]));
    }
    return (data);
  }

  List<Widget> legend() {
    List<Widget> data = [];
    for (int i = 0; i < categories.length; i++) {
      data.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 10,
            color: colors[i],
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "${categories[i]} : ${spends[i]}",
            style: AppStyle.mainText,
          )
        ],
      ));
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.accentOff,
      appBar: AppBar(
        title: Text(
          "Category Wise Spends",
          style: AppStyle.headingText,
        ),
        backgroundColor: AppStyle.mainColor,
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1.8,
              child: PieChart(PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 20,
                sections: sections(),
              )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: legend(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => ChatBotDialog());
        },
        child: Icon(Icons.chat_bubble),
        backgroundColor: Colors.red,
      ),
    );
  }
}
