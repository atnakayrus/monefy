import 'package:flutter/material.dart';
import 'package:monefy/constants/appstyle.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:monefy/widgets/chatBotDialog.dart';

List<double> spends = [10, 20, 15, 25, 16, 15, 20];
List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
int today = DateTime.now().weekday;

class DailyStats extends StatefulWidget {
  const DailyStats({super.key});

  @override
  State<DailyStats> createState() => _DailyStatsState();
}

class _DailyStatsState extends State<DailyStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.accentOff,
      appBar: AppBar(
        title: Text(
          "Past 7 days",
          style: AppStyle.headingText,
        ),
        backgroundColor: AppStyle.mainColor,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 70),
        child: BarChart(
          BarChartData(
            barTouchData: barTouchData,
            titlesData: titlesData,
            borderData: borderData,
            barGroups: barGroups,
            gridData: const FlGridData(show: false),
            alignment: BarChartAlignment.spaceAround,
            maxY: maxSpend(),
          ),
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

double maxSpend() {
  double max = spends[0];
  for (int i = 1; i < spends.length; i++) {
    if (max < spends[i]) {
      max = spends[i];
    }
  }
  return (max * 1.1);
}

BarTouchData get barTouchData => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 8,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            rod.toY.round().toString(),
            const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  text = days[(value.toInt() + today) % 7];
  if (value.toInt() == 6) {
    text = 'Today';
  } else if (value.toInt() == 5) {
    text = 'Yest';
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}

FlTitlesData get titlesData => const FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: getTitles,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );

FlBorderData get borderData => FlBorderData(
      show: false,
    );

LinearGradient get _barsGradient => const LinearGradient(
      colors: [Colors.cyan, Colors.blue],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

List<BarChartGroupData> get barGroups => [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            toY: spends[0],
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            toY: spends[1],
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            toY: spends[2],
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            toY: spends[3],
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
            toY: spends[4],
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(
            toY: spends[5],
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(
            toY: spends[6],
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      ),
    ];
