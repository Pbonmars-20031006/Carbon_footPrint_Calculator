import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carbonfootprint/themes/fontStyle.dart';
import 'package:carbonfootprint/widgets/bottomModalSheet.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:url_launcher/url_launcher.dart';

class homeScreen extends StatefulWidget {
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  double? score;
  double electricityBill = 0;
  double monthlyGas = 0;
  double oilBill = 0;
  double carMileage = 0;
  double filghtsGreaterThanFourHours = 0;
  double flightsLessThanFourHours = 0;
  bool isRecycleNewspaper = false;
  bool isRecycleAluminium = true;

  void handleLanguageSelected2(double oB, double mG, double eB, double cM,
      double fg4, double fl4, bool rN, bool rA) {
    setState(() {
      electricityBill = eB;
      monthlyGas = mG;
      oilBill = oB;
      carMileage = cM;
      flightsLessThanFourHours = fl4;
      flightsLessThanFourHours = fg4;
      isRecycleAluminium = rA;
      isRecycleNewspaper = rN;
    });
    print(eB);
    print(oB);
    print(mG);
    print(cM);
    print(fl4);
    print(fg4);
    print(rA);
    print(rN);

    calScore(oB, mG, eB, cM, fg4, fl4, rN, rA);
  }

  void calScore(double oB, double mG, double eB, double cM, double fg4,
      double fl4, bool rN, bool rA) {
    setState(() {
      score = (eB * 105 +
          mG * 105 +
          oB * 113 +
          cM * 0.79 +
          fg4 * 4400 +
          fl4 * 1100 +
          (rN ? 0 : 184) +
          (rA ? 0 : 166));
    });
    print(score);
  }

  _launchURL() async {
    final Uri url = Uri.parse("https://flutter.io");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  Center(
                    child: Container(
                      child: AutoSizeText(
                        "Your Carbon FootPrint Tracker",
                        style: fontStyle.fontstyle,
                      ),
                    ),
                  ),
                  score == null
                      ? Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Container(
                                  height: size.height * 0.2,
                                  width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.grey)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 20),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Center(
                                            child: IconButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: true,
                                                      context: context,
                                                      isScrollControlled: true,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        30)),
                                                      ),
                                                      builder: (context) =>
                                                          BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                                    sigmaX: 10,
                                                                    sigmaY: 10),
                                                            child:
                                                                bottomModalSheet(
                                                              onSelected:
                                                                  handleLanguageSelected2,
                                                            ),
                                                          ));
                                                },
                                                icon: Icon(
                                                  FontAwesomeIcons.plus,
                                                  color: Colors.black,
                                                )),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 10, 0),
                                        child: AutoSizeText(
                                          "Click here to calculate your carbon foot print for today!",
                                          style: fontStyle.fontstyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                              child: Container(
                                // height: size.height * 0.2,
                                // width: size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 0),
                                        child: AutoSizeText(
                                          "Our Metrics",
                                          style: fontStyle.fontstyle,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: AutoSizeText(
                                        "1. Your monthly electricity bill × 105.",
                                        style: fontStyle.fontstyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: AutoSizeText(
                                        "2. Your monthly gas × 105.",
                                        style: fontStyle.fontstyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: AutoSizeText(
                                        "3. Your monthly oil bill × 113.",
                                        style: fontStyle.fontstyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: AutoSizeText(
                                        "4. Your annual car mileage x 0.79.",
                                        style: fontStyle.fontstyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: AutoSizeText(
                                        "5. number of flights in the last year × 1100 (if less than or equal to 4 hours).",
                                        style: fontStyle.fontstyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: AutoSizeText(
                                        "6. Your number of flights in the previous year × 4,400 (if more than or equivalent to 4 hours).",
                                        style: fontStyle.fontstyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: AutoSizeText(
                                        "7. If you don’t recycle newspaper, add 184.",
                                        style: fontStyle.fontstyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: AutoSizeText(
                                        "8. If you don’t recycle aluminum, add 166.",
                                        style: fontStyle.fontstyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: AutoSizeText(
                                        "9. Add all of them.",
                                        style: fontStyle.fontstyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Padding(
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
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
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
                                            chartValuesOptions:
                                                ChartValuesOptions(
                                                    chartValueStyle: TextStyle(
                                                        fontFamily: "nunito",
                                                        color: Colors.white,
                                                        fontSize: 15),
                                                    showChartValueBackground:
                                                        false,
                                                    showChartValuesOutside:
                                                        true),
                                            legendOptions: LegendOptions(
                                                legendPosition:
                                                    LegendPosition.bottom,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 40,
        enableFeedback: true,

        ///foregroundColor: Colors.red,
        child: Icon(
          FontAwesomeIcons.plus,
          color: Colors.black,
        ),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              enableDrag: true,
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              builder: (context) => BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: bottomModalSheet(
                      onSelected: handleLanguageSelected2,
                    ),
                  ));
        },
      ),
    );
  }
}
