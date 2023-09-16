import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carbonfootprint/widgets/bottomModalSheet2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carbonfootprint/themes/fontStyle.dart';

class savedScreen extends StatefulWidget {
  int index;
  savedScreen({super.key, required this.index});

  @override
  State<savedScreen> createState() => _savedScreenState();
}

class _savedScreenState extends State<savedScreen> {
  _launchURL() async {
    final Uri url = Uri.parse("https://flutter.io");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = Hive.box('usersData').getAt(widget.index);
    var size = MediaQuery.of(context).size;
    double score = data[8];
    double electricityBill = data[0];
    double monthlyGas = data[1];
    double oilBill = data[2];
    double carMileage = data[3];
    double filghtsGreaterThanFourHours = data[4];
    double flightsLessThanFourHours = data[5];
    bool isRecycleNewspaper = data[6];
    bool isRecycleAluminium = data[7];
    return Scaffold(
      backgroundColor: Color(0xfff191919),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 50, 15, 15),
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.xmark),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                      ),
                      Center(
                        child: Container(
                          child: AutoSizeText(
                            "Viewing Data ${data[9]}",
                            style: fontStyle.fontstyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        AutoSizeText(
                                          "${score} ",
                                          style: TextStyle(
                                              fontFamily: "nunito",
                                              color: score != null &&
                                                      score! > 128000.0
                                                  ? Colors.red[400]
                                                  : Colors.green[200],
                                              fontSize: 20),
                                        ),
                                        AutoSizeText(
                                          "Your Score",
                                          style: TextStyle(
                                              fontFamily: "nunito",
                                              color: score != null &&
                                                      score! > 128000.0
                                                  ? Colors.red[400]
                                                  : Colors.green[200],
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        AutoSizeText(
                                          "48000-128000",
                                          style: TextStyle(
                                              fontFamily: "nunito",
                                              color: Colors.yellow[200],
                                              fontSize: 20),
                                        ),
                                        AutoSizeText(
                                          "Ideal Score",
                                          style: TextStyle(
                                              fontFamily: "nunito",
                                              color: Colors.yellow[200],
                                              fontSize: 20),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                score! > 128000.0
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: AutoSizeText(
                                          "Looks like someone has to cutdown their footprint",
                                          style: TextStyle(
                                              fontFamily: "nunito",
                                              color: Colors.red[200],
                                              fontSize: 20),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: AutoSizeText(
                                          "You are in the safe zone ! Keep it up.",
                                          style: TextStyle(
                                              fontFamily: "nunito",
                                              color: Colors.green[200],
                                              fontSize: 20),
                                        ),
                                      ),
                                GestureDetector(
                                  onTap: _launchURL,
                                  child: AutoSizeText(
                                    "For more insights click here",
                                    style: TextStyle(
                                        fontFamily: "nunito",
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                ),
                                AutoSizeText(
                                  "All scores are here in pounds",
                                  style: TextStyle(
                                      fontFamily: "nunito",
                                      color: Colors.white,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                              // height: size.height * 0.2,
                              // width: size.width * 0.9,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: PieChart(
                                      chartRadius: size.width * 0.6,
                                      dataMap: {
                                        "Electric Bill": electricityBill,
                                        "Oil Bill": oilBill,
                                        "Gas Bill": monthlyGas,
                                        "Car Mileage Value": carMileage,
                                        "Flights >4 value":
                                            filghtsGreaterThanFourHours,
                                        "Flights <4 value":
                                            flightsLessThanFourHours,
                                        "Recycled Cans":
                                            isRecycleAluminium ? 0 : 166,
                                        "Recycled Newspaers":
                                            isRecycleNewspaper ? 0 : 184,
                                      },
                                      colorList: [
                                        Colors.yellow.shade200,
                                        Colors.blue.shade200,
                                        Colors.green.shade200,
                                        Colors.red.shade200,
                                        Colors.indigo.shade200,
                                        Colors.orange.shade200,
                                        Colors.purple.shade200,
                                        Colors.lime.shade200
                                      ],
                                      centerText: "Classification",
                                      centerTextStyle: TextStyle(
                                          fontFamily: "nunito",
                                          color: Colors.black,
                                          fontSize: 15),
                                      chartValuesOptions: ChartValuesOptions(
                                          chartValueStyle: TextStyle(
                                              fontFamily: "nunito",
                                              color: Colors.white,
                                              fontSize: 15),
                                          showChartValueBackground: false,
                                          showChartValuesOutside: true),
                                      legendOptions: LegendOptions(
                                          legendPosition: LegendPosition.bottom,
                                          legendTextStyle: TextStyle(
                                              fontFamily: "nunito",
                                              color: Colors.white,
                                              fontSize: 20),
                                          showLegendsInRow: true),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
