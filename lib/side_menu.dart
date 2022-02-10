import 'package:flutter/material.dart';

import 'package:halseted_calculator/model/model.dart';

class SideMenu extends StatefulWidget {
  final Function(int) _onMenuItemSelection;

  SideMenu({
    required Function(int) onMenuItemSelection,
  }) : _onMenuItemSelection = onMenuItemSelection;

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text(
                    'Enjoy',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.question_answer_outlined,
                          size: 24,
                          color: Colors.white,
                        ),

                        // Text( '₹',
                        //   textAlign: TextAlign.start,
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 24,
                        //   ),
                        // ),
                      ),
                      Text(
                        'Quizer',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 32),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              menuItems[index].menuIcon,
                              color: index == _currentPage
                                  ? Color(0xFF00FFCB)
                                  : Colors.white,
                            ),
                            SizedBox(width: 16),
                            Text(
                              menuItems[index].menuName,
                              style: TextStyle(
                                color: index == _currentPage
                                    ? Color(0xFF00FFCB)
                                    : Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          widget._onMenuItemSelection(index);
                          setState(() {
                            _currentPage = index;
                          });
                        },
                      ),
                    );
                  },
                  itemCount: menuItems.length,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
