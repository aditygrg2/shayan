import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/chart_provider.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/loadingStateCreator.dart';
import 'package:provider/provider.dart';

class WeeklySleepAnalysis extends StatefulWidget {
  @override
  State<WeeklySleepAnalysis> createState() => _WeeklySleepAnalysisState();
}

class _WeeklySleepAnalysisState extends State<WeeklySleepAnalysis> {
  bool once = true;
  bool loading = true;
  bool data_available = false;

  void getData(ChartProvider c) {
    c.getData().then((value) {
      setState(() {
        data_available = c.data_NA_checker();
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final chartProvider = Provider.of<ChartProvider>(context);

    if (once) {
      once = false;
      getData(chartProvider);
    }

    return Column(
      children: [
        HomeScreenText(
          text: "Weekly Sleep Analysis",
        ),
        const SizedBox(
          height: 10,
        ),
        loading
            ? LoadingStateCreator()
            : !data_available? 
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width - 20,
                    height: 300,
                    child: BarChart(
                      BarChartData(
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(show: false),
                        minY: 0,
                        titlesData: FlTitlesData(
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              reservedSize: 30,
                              getTitlesWidget: (value, meta) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    chartProvider.getChartData
                                        .firstWhere((ele) {
                                      return ele.id == value;
                                    }).name,
                                  ),
                                );
                              },
                              showTitles: true,
                            ),
                          ),
                        ),
                        maxY: 11,
                        groupsSpace: 12,
                        backgroundColor: Theme.of(context).primaryColor,
                        barTouchData: BarTouchData(
                            enabled: true,
                            touchTooltipData: BarTouchTooltipData(
                              getTooltipItem:
                                  (group, groupIndex, rod, rodIndex) {
                                var y =
                                    chartProvider.getChartData[groupIndex].y;
                                return BarTooltipItem(y.toString(),
                                    TextStyle(color: Theme.of(context).primaryColor));
                              },
                            )),
                        barGroups: chartProvider.getChartData.map(
                          (e) {
                            return BarChartGroupData(x: e.id, barRods: [
                              BarChartRodData(
                                toY: e.y,
                                fromY: 0,
                                color: e.color,
                                width: 30,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(2),
                                  topRight: Radius.circular(2),
                                ),
                              ),
                            ]);
                          },
                        ).toList(),
                      ),
                    ),
                  )
                  :
                  const Padding(
                    padding:  EdgeInsets.all(32),
                    child:  Center(
                      child: Text(
                        "Fill out the sleep tracker to see the data here!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  
              )
      ],
    );
  }
}
