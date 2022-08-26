import 'package:btakh/AppBrin.dart';
import 'package:flutter/material.dart';

import 'AppBrin.dart';

void main() {
  runApp(
    PageOne(),
  );
}

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageTow(),
    );
  }
}

AppBrin appBrin1 = AppBrin();

class PageTow extends StatefulWidget {
  const PageTow({Key? key}) : super(key: key);

  @override
  State<PageTow> createState() => _PageTowState();
}

class _PageTowState extends State<PageTow> {
  int righitAnser = 0;
  void userChose(bool usertake) {
    bool checkAnser = appBrin1.getQutionAnswer();
    setState(() {
      if (checkAnser == usertake) {
        IconList.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.thumb_up,
            size: 20,
            color: Colors.green,
          ),
        ));
        setState(() {
          righitAnser++;
        });
      } else {
        IconList.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.thumb_down,
            size: 20,
            color: Colors.red,
          ),
        ));
      }
      if (appBrin1.isFinshed() == true) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("أنتهت الأسئلة "),
                content: Text("لقد أجبت على $righitAnser من أصل 10 أٍسئلة"),
              );
            });

        appBrin1.restVarble();
        IconList = [];
        righitAnser = 0;
      } else {
        appBrin1.nextQution();
      }
    });
  }

  List<Widget> IconList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: IconList,
            ),
            Expanded(
                child: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    appBrin1.getQutionImage(),
                  ),
                )),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      appBrin1.getQutionText(),
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            )),
            MaterialButton(
              onPressed: () {
                userChose(true);
              },
              child: Container(
                width: 70,
                height: 40,
                child: Center(
                  child: Text(
                    "صح",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                color: Colors.green,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            MaterialButton(
              onPressed: () {
                userChose(false);
              },
              child: Container(
                width: 70,
                height: 40,
                child: Center(
                  child: Text(
                    "خطأ",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        )));
  }
}
