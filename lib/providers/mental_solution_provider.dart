import 'package:flutter/material.dart';

class MentalSolutionProvider extends ChangeNotifier {
  List<Map<dynamic, dynamic>> solutions = [
    {
      'title': 'Progressive Muscle Relaxation',
      'subtitle':
          'In this relaxation technique, you focus on slowly tensing and then relaxing each muscle group',
      'image': 'https://s3-alpha-sig.figma.com/img/f4e1/9f19/e8bed9cf98c3b980c73abd0bff8d1192?Expires=1680480000&Signature=fKW-d9KLRR~C9v9TY23BNdiIXb0PgKD6L7Jojb2VMfgZZtvgGXcoQ7nJnqGiR4cIvT30-pjER3rNXP0VvhyTptTAQoIxhSSLDokQJKF~CxAUf1EAzd73EXRo9WYLM4LZLZpTbyosmwZrd4zV0QjRv3ceAL0naZaXMeds7e0lCSQRIMF3gAq46CaBMgIh71Jcq22twX34bpPS5iJs-wvNdtW1~fXtCvAjrfKuUJXuW-0xGdSFNI2Sr2I~7zuD8jFb4FR4D2fRjpa3TgoXEyL0x~i-~fKZOCXh-ReEiGK-uicP3aJJbJdI2FWA6rlTkJewY3ubC-U79KxxnIoMkE72Xg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      'description':
          'This can help you focus on the difference between muscle tension and relaxation. You can become more aware of physical sensations.',
      'tips': [
        'You start by tensing and relaxing the muscles in your toes and progressively working your way up to your neck and head. ',
        'This is best done in a quiet area without interruptions.',
        'You can also start with your head and neck and work down to your toes.',
        'Tense your muscles for about five seconds and then relax for 30 seconds, and repeat.'
      ],
    },
  ];

  Map<dynamic, dynamic> getSolution(String title) {
    return solutions.firstWhere((element) => element['title'] == title);
  }
}
