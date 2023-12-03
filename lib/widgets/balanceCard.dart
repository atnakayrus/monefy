import 'package:flutter/material.dart';
import 'package:monefy/constants/appstyle.dart';
import 'package:fl_chart/fl_chart.dart';

class BalanceCard extends StatelessWidget {
  final double total;
  final double spent;
  const BalanceCard({super.key, required this.total, required this.spent});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: PieChart(PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: [
                PieChartSectionData(
                  color: AppStyle.accentColor,
                  value: spent,
                  radius: 20,
                  title: '',
                ),
                PieChartSectionData(
                  color: AppStyle.mainColor,
                  value: (total - spent) > 0 ? (total - spent) : 0,
                  radius: 20,
                  title: '',
                ),
              ],
            )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Balance",
                  style: TextStyle(fontSize: 20, color: AppStyle.mainColor)),
              Text("Rs${total - spent}",
                  style: TextStyle(fontSize: 20, color: AppStyle.mainColor)),
            ],
          )
        ],
      ),
    );
  }
}
