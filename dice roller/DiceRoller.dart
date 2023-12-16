import 'package:flutter/material.dart';
import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';

class DiceRoller extends StatefulWidget {
  DiceRoller(this.number, this.canroll,this.afterRoll, {super.key});

  int number;
  int canroll;
  Function(int) afterRoll; // Callback function



  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var DiceImg = 'assets/image/die_1.png';

  final randomizer = Random();

  void roll() {
    int x = randomizer.nextInt(widget.number-1) + 1;

    if (widget.canroll == 1) {
      AssetsAudioPlayer aud = AssetsAudioPlayer();
      aud.open(Audio('assets/sound/die_sound.mp3'));
      setState(() {
        switch (x) {
          case 1:
            {
              DiceImg = 'assets/image/die_1.png';
              break;
            }
          case 2:
            {
              DiceImg = 'assets/image/die_2.png';
              break;
            }
          case 3:
            {
              DiceImg = 'assets/image/die_3.png';
              break;
            }
          case 4:
            {
              DiceImg = 'assets/image/die_4.png';
              break;
            }
          case 5:
            {
              DiceImg = 'assets/image/die_5.png';
              break;
            }
          case 6:
            {
              DiceImg = 'assets/image/die_6.png';
              break;
            }
        }
      });

      widget.afterRoll(x);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please swipe'),
          duration: Duration(milliseconds: 500) ,
        ),
      );
    }
  }

  @override
  Widget build(context) {
    return TextButton(
      onPressed: roll,
      child: Image.asset(DiceImg),
    );
  }
}
