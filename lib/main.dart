import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class Demo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              First(),
            ],
          ),
        ),
      ),
    );
  }
}

class First extends StatelessWidget {
  const First({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlareActor(
        "assets/Present.flr",
        animation: "estrellas",
        fit: BoxFit.contain,
      ),
    );
  }
}



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> cardList;

  void _removeCard(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    cardList = _getMatchCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: cardList,
        ),
      ),
    );
  }

  List<Widget> _getMatchCard() {
    List<MatchCard> cards = new List();
    cards.add(MatchCard(First()));

    List<Widget> cardList = new List();

    for (int x = 0; x < 1; x++) {
      cardList.add(Positioned(
        top: 10,
        child: Draggable(
          onDragEnd: (drag) {
            _removeCard(x);
          },
          childWhenDragging: Container(),
          feedback: Card(
            elevation: 12,
            color: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 270,
              height: 520,
              child:cards[x].widget,
            ),
          ),
          child: Card(
            elevation: 12,
            color: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 270,
              height: 520,
              child:cards[x].widget,
            ),
          ),
        ),
      ));
    }

    return cardList;
  }
}

class MatchCard {
  Widget widget;
  MatchCard(Widget widget) {
    this.widget = widget;
  }
}
