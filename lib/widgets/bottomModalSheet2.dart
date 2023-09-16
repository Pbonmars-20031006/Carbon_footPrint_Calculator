import 'package:auto_size_text/auto_size_text.dart';
import 'package:carbonfootprint/screens/savedScreen.dart';
import 'package:carbonfootprint/themes/fontStyle.dart';
import 'package:carbonfootprint/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class bottomModalSheet2 extends StatefulWidget {
  bottomModalSheet2({
    Key? key,
  }) : super(key: key);

  @override
  State<bottomModalSheet2> createState() => _bottomModalSheet2State();
}

class _bottomModalSheet2State extends State<bottomModalSheet2> {
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
    var userData = Hive.box('usersData');
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Container(
                  height: size.height * 0.1 * (userData.length + 1),
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(25.0),
                          topRight: const Radius.circular(25.0))),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Colors.grey)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText(
                              "Your Calculations",
                              style: fontStyle.fontstyle,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: userData.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              savedScreen(index: index)),
                                    );
                                    print(userData.getAt(index)[0]);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.grey)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AutoSizeText(
                                        "${index + 1}. View Calculation ${userData.get(index)[9]}",
                                        style: fontStyle.fontstyle,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  )))),
    );
  }
}

typedef ValueCallback = void Function(double eB, double mG, double oB,
    double cM, double fg4, double fl4, bool rN, bool rA);
