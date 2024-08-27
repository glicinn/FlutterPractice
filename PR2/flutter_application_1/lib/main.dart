import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Home(),
      )
    );
  }
}

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(255,255,255, 1.0),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(scrollDirection: Axis.vertical, //Скролл содержимого (не поместилось [:(] )
        child: Stack(children: [
          Container(
            margin: EdgeInsets.only(top: 30),
              width: 370,
              height: 370,
              decoration: BoxDecoration(
                color: Color.fromRGBO(1,195,255, 1.0),
                image: DecorationImage(
                    image: Image.asset('assets/Images/back.png').image,
                    fit: BoxFit.cover,
                  ),
                borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(//Стиль кнопки
                backgroundColor: Color.fromRGBO(223,230,253, 1.0),
                shape: CircleBorder(),//Круглая кнопка
                padding: EdgeInsets.all(6)//Внутренние отсупы
              ),
              child: Container(
                width: 31,
                child: Image.asset(
                'assets/Images/s.png', fit: BoxFit.cover, alignment: Alignment.center,),//Масштабирование изображения, чтобы оно поместилось
                ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:300),
            width: 370,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(130.0),
                  topRight: Radius.circular(130.0),
              ),
              color: Color.fromRGBO(250,246,245, 1.0)
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:360),
            width: 370,
            decoration: BoxDecoration(
              color: Color.fromRGBO(250,246,245, 1.0),
              borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            ),
            child: Column(children: [
              Text('Secrets of Atlantis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(250,246,245, 1.0),
                  padding: EdgeInsets.all(10),
                  side: const BorderSide( //Указание цвета border
                    width: 1.0,
                    color: Color.fromRGBO(254,122,21, 1.0),
                  ),
                ),
                child: Container(
                  width: 70,
                  child: Text('Follow', style:TextStyle(color: Color.fromRGBO(254,122,21, 1.0), fontSize: 15), textAlign: TextAlign.center),
                ),
              ),
              Container(
                width: 340,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  color: Color.fromRGBO(64,50,133, 1.0)
                ),
                child: Stack(children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    width: 60,
                    alignment: Alignment.topLeft,
                    child: Image.asset('assets/Images/f.png', fit: BoxFit.cover)
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 100, top: 30),
                        child: Text('Codin', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 100, top: 3),
                        padding: EdgeInsets.only(left: 7, right: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color.fromRGBO(38,32,68, 1.0),
                        ),
                        child: Text('Host', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.white)),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 160, top: 10), //Указание какого либо расстояния в пикселях
                    padding: EdgeInsets.only(right: 30),
                    child: RichText(text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'The Secrets of Atlantis podcast is designed for all fantasy enthusiasts, everything from debunking underwat...', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.white)),
                        TextSpan(text: ' see more', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
                      ]
                    ),
                    )),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color.fromRGBO(39,29,90, 1.0),
                          ),
                          margin: EdgeInsets.only(left: 20, top: 120),
                          padding: EdgeInsets.only(right: 7, left: 7),
                          child: RichText(text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: '4.8☆', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                            TextSpan(text: ' (10)', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Color.fromRGBO(147,142,173, 1.0))),
                          ]),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3, top: 120),
                          child: Text('·', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.white)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color.fromRGBO(39,29,90, 1.0),
                          ),
                          margin: EdgeInsets.only(left: 3, top: 120),
                          padding: EdgeInsets.only(right: 7, left: 7),
                          child: Text('Fantasy', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 130, top: 120),
                          child: Text('🔔', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.white)),
                        ),
                      ],
                    ),
                ],)
              ),
              Container(
                width: 340,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                  color: Color.fromRGBO(29,15,90, 1.0),
              ),
              child:Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 20),
                              width: 40,
                              alignment: Alignment.topLeft,
                              child: Image.asset('assets/Images/1.png', fit: BoxFit.cover)
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 45, top: 20),
                              width: 40,
                              alignment: Alignment.topLeft,
                              child: Image.asset('assets/Images/2.png', fit: BoxFit.cover)
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 70, top: 20),
                              width: 40,
                              alignment: Alignment.topLeft,
                              child: Image.asset('assets/Images/3.png', fit: BoxFit.cover)
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 95, top: 20),
                              width: 40,
                              alignment: Alignment.topLeft,
                              child: Image.asset('assets/Images/4.png', fit: BoxFit.cover)
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 120, top: 20),
                              width: 40,
                              alignment: Alignment.topLeft,
                              child: Image.asset('assets/Images/5.png', fit: BoxFit.cover)
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 90, top: 30),
                            width: 20,
                            alignment: Alignment.topLeft,
                            child: Image.asset('assets/Images/qw.png', fit: BoxFit.cover)
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10, top: 30),
                            alignment: Alignment.topLeft,
                            child: Text('Live', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color.fromRGBO(221,71,27, 1.0))),
                        )
                      ],
                    ),
              ),
              Container(
                margin: EdgeInsets.only(top:20, bottom: 40),
                width: 280,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Color.fromRGBO(248,217,16, 1.0)
              ),
              child: Row(children: [
                Container(
                  width: 130,
                  margin: EdgeInsets.only(left: 0, top: 0),
                  child: Image.asset('assets/Images/e.png', fit: BoxFit.cover)
                ),
                Container(
                  margin: EdgeInsets.only(left: 6, top: 40),
                  alignment: Alignment.topLeft,
                  child: Text('Invite your\nfriends to join', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, )),
                ),
                Container(
                  width: 15,
                  margin: EdgeInsets.only(left: 6, top: 17),
                  child: Image.asset('assets/Images/f3.png', fit: BoxFit.cover)
                ),
              ],))
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top:260),
            width: 370,
            height: 85,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(250,246,245, 1.0)),
              child: ElevatedButton(
                onPressed: () {
                  _navigateToNextScreen(context);//Вызов метода для перехода на новый экран
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(254,122,21, 1.0),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10)
                ),
                child: Container(
                  width: 31,
                  height: 300,
                  child: Image.asset(
                  'assets/Images/as.png', fit: BoxFit.cover,),
                ),
              ),
          ),
        ])),
      )
    );
  }
  //Метод для перехода на новый экран
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => VtoroyScreen()));
  }
}

class VtoroyScreen extends StatelessWidget {
  const VtoroyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(left: 23, right: 23),
                height: 219,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 242, 200, 76),
                  image: DecorationImage(
                    image: AssetImage('assets/Images/d.png'),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 13)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: Text(
                    "Peter Mach",
                    style: TextStyle(
                        fontSize: 17,
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 1)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 26, right: 28),
                  child: Text(
                    "Mind Deep Relax",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: Text(
                    "Join the Community as we prepare over 33 days to relax and feel joy with the mind and happnies session across the World.",
                    style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 24)),
              Container(
                width: 342,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToNextScreen(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF039EA2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          'assets/Images/fgg.png'),
                      SizedBox(width: 10),
                      Text(
                        'Play Next Session',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(225, 255, 255, 255),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 24)),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 28),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.3,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets
                                .zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Container(
                            width: 29,
                            height: 29,
                            child: Image.asset(
                              'assets/Images/fgg.png',
                              fit: BoxFit
                                  .contain,
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 13)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sweet Memories",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            "December 29 Pre-Launch",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(1, 1, 1, 0.5)),
                          )
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            color: Color.fromRGBO(1, 1, 1, 0.5),
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 28),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.3,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 3, 157, 162),
                            padding: EdgeInsets
                                .zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Container(
                            width: 29,
                            height: 29,
                            child: Image.asset(
                              'assets/Images/fgg.png',
                              fit: BoxFit
                                  .contain,
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 13)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "A Day Dream",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            "December 29 Pre-Launch",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(1, 1, 1, 0.5)),
                          )
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            color: Color.fromRGBO(1, 1, 1, 0.5),
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 28),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.3,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 240, 146, 53),
                            padding: EdgeInsets
                                .zero, // Убрирание внутреннего отступа у кнопки
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Container(
                            width: 29,
                            height: 29,
                            child: Image.asset(
                              'assets/Images/fgg.png',
                              fit: BoxFit
                                  .contain,
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 13)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mind Explore",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            "December 29 Pre-Launch",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(1, 1, 1, 0.5)),
                          )
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            color: Color.fromRGBO(1, 1, 1, 0.5),
                          ))
                    ],
                  ),
                ),
              )
            ]),
          )
        ])));
  }
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TretiiPrikol()));
  }
}

class TretiiPrikol extends StatelessWidget {
  const TretiiPrikol({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              SizedBox(
                width: 24,
              ),
              Text(
                "Meditate",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          actions: [
            Icon(
              Icons.search_sharp,
              size: 28,
              color: Colors.black,
            ),
            SizedBox(
              width: 26,
            )
          ],
          bottom: PreferredSize(//Подчеркивание и его настройки
            preferredSize: Size.fromHeight(1.0),
            child: Divider(
              color: Color.fromARGB(45, 0, 0, 0),
              thickness: 0.5,
            ),
          ),
        ),
        body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                    Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 23,
                ),
                Container(
                  width: 35,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Color.fromARGB(255, 3, 157, 162)),
                  child: Center(
                    child: Text(
                      "All",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 104,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Color.fromARGB(255, 230, 254, 255)),
                  child: Center(
                    child: Text(
                      "Bible In a Year",
                      style: TextStyle(color: Color.fromARGB(255, 3, 157, 162)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 61,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Color.fromARGB(255, 230, 254, 255)),
                  child: Center(
                    child: Text(
                      "Dailies",
                      style: TextStyle(color: Color.fromARGB(255, 3, 157, 162)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 69,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Color.fromARGB(255, 230, 254, 255)),
                  child: Center(
                    child: Text(
                      "Minutes",
                      style: TextStyle(color: Color.fromARGB(255, 3, 157, 162)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 69,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Color.fromARGB(255, 230, 254, 255)),
                  child: Center(
                    child: Text(
                      "November",
                      style: TextStyle(color: Color.fromARGB(255, 3, 157, 162)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Column(children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 23, right: 23.75),
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 242, 200, 76),
                          image: DecorationImage(
                            image: AssetImage('assets/Images/safd.png'),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 13)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 36, right: 28),
                          child: Text(
                            "A Song of Moon",
                            style: TextStyle(
                                fontSize: 24,
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 36, right: 24),
                          child: Text(
                            'Start with the basics',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 30, 30, 30),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
                Row(
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    Icon(Icons.favorite_border_outlined),
                    Text(
                      "9 Sessions",
                      style: TextStyle(color: Color.fromRGBO(1, 1, 1, 0.7)),
                    ),
                    Spacer(),
                    Text("Start"),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 12,
                    ),
                    SizedBox(
                      width: 58,
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 14)),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 98,
                                width: 166,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 242, 167, 76),
                                  image: DecorationImage(
                                    image: AssetImage('assets/Images/ewf.png'),
                                  ),
                                ),
                                child: Container()),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 11),
                              child: Text(
                                "The Sleep Hour",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 11),
                              child: Text("Ashna Mukherjee",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromRGBO(1, 1, 1, 0.6))),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(
                                  Icons.favorite_border_outlined,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "9 Sessions",
                                  style: TextStyle(
                                      color: Color.fromRGBO(1, 1, 1, 0.7),
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "Start",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 6,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 8, right: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 98,
                                width: 166,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 242, 200, 76),
                                  image: DecorationImage(
                                    image: AssetImage('assets/Images/weff.png'),
                                  ),
                                ),
                                child: Container()),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Easy on the Mission",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.00001,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 11),
                              child: Text("Peter Mach",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 0.00001,
                                      color: Color.fromRGBO(1, 1, 1, 0.6))),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(
                                  Icons.favorite_border_outlined,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "5 minutes",
                                  style: TextStyle(
                                      color: Color.fromRGBO(1, 1, 1, 0.7),
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "Start",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 6,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 98,
                                width: 166,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 47, 129, 237),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/Images/ggg.png'),
                                  ),
                                ),
                                child: Container()),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 11),
                              child: Text(
                                "Relax with Me",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 11),
                              child: Text("Amanda James",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromRGBO(1, 1, 1, 0.6))),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(
                                  Icons.favorite_border_outlined,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "3 Sessions",
                                  style: TextStyle(
                                      color: Color.fromRGBO(1, 1, 1, 0.7),
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "Start",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 6,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 8, right: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 98,
                                width: 166,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 3, 157, 162),
                                  image: DecorationImage(
                                    image: AssetImage('assets/Images/eee.png'),
                                  ),
                                ),
                                child: Container()),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Sun and Energy",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.00001,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 11),
                              child: Text("Micheal Hiu",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 0.00001,
                                      color: Color.fromRGBO(1, 1, 1, 0.6))),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(
                                  Icons.favorite_border_outlined,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "5 minutes",
                                  style: TextStyle(
                                      color: Color.fromRGBO(1, 1, 1, 0.7),
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "Start",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 6,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ]))
        ])));
  }
}