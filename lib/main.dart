import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return (runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Dice'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: DicePage(),
    ),
  )));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // 동적인 상태를 사용할 때는 stful을 입력해서 stless에 있던 것들을 copy&paste한다
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: (Row(
        children: <Widget>[
          Expanded(
            // Expanded는 이미지의 크기가 너무 클때 화면을 넘어갈 경우 자동으로 잡아주는 역할을 해준다
            // 근데 가로와 세로가 모두 넘어가게 되면 해당 길이를 가로가 짧을경우 가로에 맞추고
            // 세로가 길면 세로에 맞춰준다
            flex: 1,
            // flex는 이 박스와 뒤에 박스의 크기비율을 정해준다
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    // setState는 변수의 값이 바뀌면 전체 구조를 리빌딩을 해줘서 변환된 값을 전체에 적용한다
                    leftDiceNumber = Random().nextInt(6) + 1;
                    print('left Dice Number : $leftDiceNumber');
                  });
                },
                child: Image.asset('images/dice$leftDiceNumber.png')),
            //Image(image: AssetInsets('images/dice2')) 이렇게 긴 코드를 한줄로 줄여주었다
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    rightDiceNumber = Random().nextInt(6) + 1;
                    print('right button : $rightDiceNumber');
                    if (rightDiceNumber == 1) {
                      leftDiceNumber = 1;
                    }
                  });
                },
                child: Image.asset('images/dice$rightDiceNumber.png')),
          ),
        ],
      )),
    );
  }
}
