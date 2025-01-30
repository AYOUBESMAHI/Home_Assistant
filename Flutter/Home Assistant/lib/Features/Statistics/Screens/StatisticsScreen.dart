import 'package:flutter/material.dart';

import '../../../Utils/Constants.dart';
import '../../../Widgets/ReusableText.dart';
import '../Widgets/ChartWidget.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Reusabletext(
              "Statistics",
              FontWeight.w900,
              Constants.primaryColor,
              32,
            ),
            const SizedBox(height: 12),
            Reusabletext(
              "Today's Overview :",
              FontWeight.bold,
              Constants.primaryColor,
              24,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  todayConsomationWidget("Cost Today", "121.4\$"),
                  const Spacer(),
                  todayConsomationWidget("Energy Used", "12.5 kWh")
                ],
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Reusabletext(
                  "Usage Trends :",
                  FontWeight.bold,
                  Constants.primaryColor,
                  24,
                ),
                const SizedBox(width: 8),
                IconButton(
                    onPressed: () {
                      datePicker();
                    },
                    icon: Icon(
                      Icons.date_range,
                      color: Constants.primaryColor,
                    )),
              ],
            ),
            Text(
              "Viewing usage for the week: Jan 1 - Jan 7, 2025",
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            BarChartSample1()
          ],
        ),
      ),
    );
  }

  Widget todayConsomationWidget(title, consomation) {
    return Column(
      children: [
        Reusabletext(
          title,
          FontWeight.bold,
          Constants.accentColor,
          22,
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Reusabletext(
            consomation,
            FontWeight.bold,
            Constants.secondaryColor,
            22,
          ),
        )
      ],
    );
  }

  void datePicker() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }
}
