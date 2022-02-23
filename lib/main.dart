import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:halseted_calculator/results_page.dart';
import 'package:halseted_calculator/side_menu.dart';
import 'package:halseted_calculator/swipe_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Halstead Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Halstead calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;
  late Animation<double> animation;
  late AnimationController controller;
  bool isNavigationDrawerOpened = false;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  GlobalKey<SwipeAnimationState> swipeAnimationKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
  }

  int _counter = 0;
  final n1_controller = TextEditingController();
  final n2_controller = TextEditingController();
  final N1_controller = TextEditingController();
  final N2_controller = TextEditingController();

  void _submitData() {
    if (n1_controller.text.isEmpty ||
        n2_controller.text.isEmpty ||
        N1_controller.text.isEmpty ||
        N2_controller.text.isEmpty) {
      print('please enter all values');
      Fluttertoast.showToast(
          msg: "please enter all values",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black45,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    final n1 = double.parse(n1_controller.text);
    final n2 = double.parse(n2_controller.text);
    final N1 = double.parse(N1_controller.text);
    final N2 = double.parse(N2_controller.text);
    // addtx(titleController.text,  // another way of putting it
    // double.parse(amountContoller.text)
    print('n1=$n1 n2=$n2 N1=$N1 N2=$N2 ');
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => Results(
                  n1: n1,
                  n2: n2,
                  N1: N1,
                  N2: N2,
                )));
    //   widget.addtx(enteredTitle, enteredAmnt, _selectedDate);
    //Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[200],
        body: Stack(
          children: <Widget>[
            SideMenu(
              onMenuItemSelection: (pageIndex) {
                swipeAnimationKey.currentState?.hideNavigationDrawer();
                setState(() {
                  currentPage = pageIndex;
                });
              },
            ),
            SwipeAnimation(
                key: swipeAnimationKey,
                navigationDrawerOpened: (isOpened) {
                  isNavigationDrawerOpened = isOpened;
                  if (isNavigationDrawerOpened) {
                    controller.reverse();
                  } else {
                    controller.forward();
                  }
                },
                child: Scaffold(
                  backgroundColor: Colors.blueGrey[30],
                  key: _scaffoldKey,
                  appBar: AppBar(
                    brightness: Brightness.dark,
                    leading: IconButton(
                      icon: AnimatedIcon(
                        icon: AnimatedIcons.arrow_menu,
                        progress: animation,
                      ),
                      onPressed: () {
                        if (isNavigationDrawerOpened) {
                          controller.reverse();
                          swipeAnimationKey.currentState
                              ?.hideNavigationDrawer();
                        } else {
                          controller.forward();
                          swipeAnimationKey.currentState
                              ?.showNavigationDrawer();
                        }
                      },
                    ),
                    //title: Text("menuItems[currentPage].menuName"),
                    backgroundColor: Colors.blueGrey[100],
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.help_outline_sharp),
                        tooltip: 'Help',
                        onPressed: () {
                          final snackBar = SnackBar(
                            content: Text(
                              'enter the values of n1,n2,N1,N2 and click on calculate button',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                            //      duration: Duration(milliseconds: 200),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
                    ],
                    // leading: Icon(Icons.access_time_sharp),
                    // leadingWidth: 70,
                    title: const Text('Halsted Calculator'),
                  ),
                  body: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(flex: 1), //2/6
                          Icon(
                            Icons.play_circle_fill_outlined,
                            color: Colors.black38,
                            size: 60.0,
                          ),
                          Text(
                            "Halstead calculator",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold),
                          ),
                          Text("Enter the values below"),
                          Spacer(), // 1/6
                          Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: n1_controller,
                                  //onSubmitted: (_) => _submitData(),

                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.black12,
                                    hintText: "n1",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: TextField(
                                  controller: n2_controller,
                                  //onSubmitted: (_) => _submitData(),

                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),

                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.black12,
                                    hintText: "n2",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // 1/6
                          Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: N1_controller,
                                  //onSubmitted: (_) => _submitData(),

                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),

                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.black12,
                                    hintText: "N1",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: TextField(
                                  controller: N2_controller,
                                  //onSubmitted: (_) => _submitData(),

                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),

                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.black12,
                                    hintText: "N2",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Center(
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shadowColor: Colors.blueGrey,
                                  shape: StadiumBorder(),
                                  side: BorderSide(
                                      width: 2, color: Colors.black54),
                                ),
                                onPressed: _submitData,
                                child: Text(
                                  " Calculate",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.bold),
                                )),
                          ),
                          Spacer(flex: 1), // it will take 2/6 spaces
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
