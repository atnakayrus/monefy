import 'package:flutter/material.dart';
import 'package:monefy/constants/appstyle.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:monefy/widgets/chatBotDialog.dart';

List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

class MonthlyStats extends StatefulWidget {
  const MonthlyStats({super.key});

  @override
  State<MonthlyStats> createState() => _MonthlyStatsState();
}

class _MonthlyStatsState extends State<MonthlyStats> {
  List<double> values = [4, 2, 5, 8, 6, 1, 3, 7, 19, 5, 3, 2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.accentOff,
      appBar: AppBar(
        title: Text(
          "Monthly Stats",
          style: AppStyle.headingText,
        ),
        backgroundColor: AppStyle.mainColor,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 100),
        child: LineChart(LineChartData(
          lineTouchData: const LineTouchData(enabled: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, values[0]),
                FlSpot(1, values[1]),
                FlSpot(2, values[2]),
                FlSpot(3, values[3]),
                FlSpot(4, values[4]),
                FlSpot(5, values[5]),
                FlSpot(6, values[6]),
                FlSpot(7, values[7]),
                FlSpot(8, values[8]),
                FlSpot(9, values[9]),
                FlSpot(10, values[10]),
                FlSpot(11, values[11]),
              ],
              isCurved: false,
              barWidth: 2,
              color: AppStyle.mainColor,
              dotData: const FlDotData(
                show: true,
              ),
            ),
          ],
          minY: 0,
          borderData: FlBorderData(
            show: false,
          ),
          titlesData: const FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: bottomTitleWidgets,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: leftTitleWidgets,
                interval: 1,
                reservedSize: 36,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 1,
            checkToShowHorizontalLine: (double value) {
              return value == 1 || value == 6 || value == 4 || value == 5;
            },
          ),
        )),
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

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 15,
  );
  String text = months[value.toInt()];
  if (value.toInt() % 2 == 0) {
    text = '';
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(fontSize: 10);

  return SideTitleWidget(
    space: 8,
    axisSide: meta.axisSide,
    child: Text(
      '${value.floor()}',
      style: style,
    ),
  );
}
