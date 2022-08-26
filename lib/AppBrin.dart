import 'ListQustion.dart';
import 'package:flutter/material.dart';

class AppBrin {
  int _qutionNumber = 0;
  List<ListQtuione> _qtuionsGreuop = [
    ListQtuione(
      t: 'صحراء الربع الخالي هي أكثر الأماكن جفافاً على سطح الأرض ؟',
      i: 'images/sahraa1.jpg',
      a: false,
    ),
    ListQtuione(
      t: 'زئير الأسد يمكن سماعه من على بعد 8 كيلومتر؟ ',
      i: 'images/lion2.jpg',
      a: true,
    ),
    ListQtuione(
      t: 'النعامة لاتدفن رأسها في الرمل خوفاً وإنما بحثاً عن الماء ؟',
      i: 'images/naamah3.jpg',
      a: true,
    ),
    ListQtuione(
      t: 'سور الصين العظيم هو الشي الوحيد الذي صنعه الانسان والذي يمكن رؤيته من القمر بالعين المجردة ؟',
      i: 'images/soralsen4.jpeg',
      a: false,
    ),
    ListQtuione(
      t: 'يولد الإنسان وفي جسمه 300 عظمة إلا أن ذلك العدد يتراجع إلى 206 فقط عند سن البلوغ ؟',
      i: 'images/boon5.jpg',
      a: true,
    ),
  ];

  void nextQution() {
    if (_qutionNumber < _qtuionsGreuop.length - 1) {
      _qutionNumber++;
    }
    // else {
    //   Center(
    //     child: Container(
    //       width: 40,
    //       height: 70,
    //       color: Colors.white,
    //     ),
    //   );
    // }
  }

  void viewDiloge() {}

  String getQutionText() {
    return _qtuionsGreuop[_qutionNumber].qutionText;
  }

  String getQutionImage() {
    return _qtuionsGreuop[_qutionNumber].qutionImage;
  }

  bool getQutionAnswer() {
    return _qtuionsGreuop[_qutionNumber].qutionAnswer;
  }

  bool isFinshed() {
    if (_qutionNumber >= _qtuionsGreuop.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void restVarble() {
    _qutionNumber = 0;
  }
}
