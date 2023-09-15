import 'package:auto_size_text/auto_size_text.dart';
import 'package:carbonfootprint/themes/fontStyle.dart';
import 'package:carbonfootprint/widgets/customTextField.dart';
import 'package:flutter/material.dart';

class bottomModalSheet extends StatefulWidget {
  bottomModalSheet({Key? key, required this.onSelected}) : super(key: key);

  final ValueCallback onSelected;

  @override
  State<bottomModalSheet> createState() => _bottomModalSheetState();
}

class _bottomModalSheetState extends State<bottomModalSheet> {
  double oB = 0;
  double eB = 0;
  double mG = 0;
  double cM = 0;
  double fg4 = 0;
  double fl4 = 0;
  bool rA = false;
  bool rN = false;
  Color c = Color(0xfff191919);
  Color c1 = Color(0xfff191919);
  Color c2 = Color(0xfff191919);
  Color c3 = Color(0xfff191919);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: Container(
                    height: size.height * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(25.0),
                            topRight: const Radius.circular(25.0))),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            height: 10,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                                color: Color(0xfff191919),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 5, 10),
                                child: AutoSizeText(
                                  'Enter "All" the details',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'nunito',
                                      fontSize: 25),
                                ),
                              ),
                            ],
                          ),
                          CustomTextField(
                            title: "Monthly Oil Bill",
                            onChanged: (value) {
                              setState(() {
                                oB = double.parse(value);
                              });
                            },
                            onTextChanged: (value) {
                              setState(() {
                                oB = double.parse(value);
                              });
                            },
                            hintText: "Your Monthly Oil Bill in INR",
                          ),
                          CustomTextField(
                            title: "Monthly Electricity Bill",
                            onChanged: (value) {
                              setState(() {
                                eB = double.parse(value);
                              });
                            },
                            onTextChanged: (value) {
                              setState(() {
                                eB = double.parse(value);
                              });
                            },
                            hintText: "Your Electricity Bill in INR",
                          ),
                          CustomTextField(
                            title: "Monthly Gas Bill",
                            onChanged: (value) {
                              setState(() {
                                mG = double.parse(value);
                              });
                            },
                            onTextChanged: (value) {
                              setState(() {
                                mG = double.parse(value);
                              });
                            },
                            hintText: "Your Monthly Gas Bill in INR",
                          ),
                          CustomTextField(
                            title: "Car Mileage",
                            onChanged: (value) {
                              setState(() {
                                cM = double.parse(value);
                              });
                            },
                            onTextChanged: (value) {
                              setState(() {
                                cM = double.parse(value);
                              });
                            },
                            hintText: "Your Monthly Car Mileage in INR",
                          ),
                          CustomTextField(
                            title: "Number of Flights 1.",
                            onChanged: (value) {
                              setState(() {
                                fg4 = double.parse(value);
                              });
                            },
                            onTextChanged: (value) {
                              setState(() {
                                fg4 = double.parse(value);
                              });
                            },
                            hintText: "Greater than 4 hours",
                          ),
                          CustomTextField(
                            title: "Number of Flights 2.",
                            onChanged: (value) {
                              setState(() {
                                fl4 = double.parse(value);
                              });
                            },
                            onTextChanged: (value) {
                              setState(() {
                                fl4 = double.parse(value);
                              });
                            },
                            hintText: "Lesser than or equal to 4 hours",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: AutoSizeText(
                              "Did you recycle your newspaper?",
                              style: fontStyle.fontstyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          rN = true;
                                          c = Colors.grey;
                                          c1 = Color(0xfff191919);
                                        });
                                      },
                                      child: Container(
                                        height: size.height * 0.05,
                                        width: size.width * 0.2,
                                        decoration: BoxDecoration(
                                            color: c,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: AutoSizeText(
                                            "Yes",
                                            style: fontStyle.fontstyle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          rN = false;

                                          c1 = Colors.grey;
                                          c = Color(0xfff191919);
                                        });
                                      },
                                      child: Container(
                                        height: size.height * 0.05,
                                        width: size.width * 0.2,
                                        decoration: BoxDecoration(
                                            color: c1,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: AutoSizeText(
                                            "No",
                                            style: fontStyle.fontstyle,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: AutoSizeText(
                              "Did you recycle your aluminium cans",
                              style: fontStyle.fontstyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          rA = true;
                                          c2 = Colors.grey;
                                          c3 = Color(0xfff191919);
                                        });
                                      },
                                      child: Container(
                                        height: size.height * 0.05,
                                        width: size.width * 0.2,
                                        decoration: BoxDecoration(
                                            color: c2,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: AutoSizeText(
                                            "Yes",
                                            style: fontStyle.fontstyle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          rA = false;

                                          c3 = Colors.grey;
                                          c2 = Color(0xfff191919);
                                        });
                                      },
                                      child: Container(
                                        height: size.height * 0.05,
                                        width: size.width * 0.2,
                                        decoration: BoxDecoration(
                                            color: c3,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: AutoSizeText(
                                            "No",
                                            style: fontStyle.fontstyle,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                widget.onSelected(
                                    eB, mG, oB, cM, fg4, fl4, rN, rA);
                                Navigator.pop(context);
                              },
                              child: Container(
                                child: AutoSizeText(
                                  "Submit",
                                  style: fontStyle.fontstyle,
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    )))),
      ),
    );
  }
}

typedef ValueCallback = void Function(double eB, double mG, double oB,
    double cM, double fg4, double fl4, bool rN, bool rA);
