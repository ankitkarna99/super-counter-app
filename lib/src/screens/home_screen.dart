import 'package:flutter/material.dart';
import '../widgets/counter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavigationIndex = 0;
  bool _showFloatingAction = true;
  List<int> _counters = [0, 0, 0];

  //State Management Functions

  void _toggleFloatingAction() {
    this.setState(() {
      _showFloatingAction = !_showFloatingAction;
    });
  }

  void _incrementCounter(int index) {
    this.setState(() {
      _counters[index] = _counters[index] + 1;
    });
  }

  void _setBottomNavigationIndex(int index) {
    this.setState(() {
      _bottomNavigationIndex = index;
    });
  }

  void _increment() {
    _incrementCounter(_bottomNavigationIndex);
  }

  //UI Build Function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingAction(),
      appBar: AppBar(
        title: Text("Counter ${_bottomNavigationIndex + 1}"),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Counter(
            count: _counters[_bottomNavigationIndex],
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: _increment,
            child: Text("Increment Me!"),
          ),
          RaisedButton(
            color: Colors.orange,
            textColor: Colors.white,
            onPressed: _toggleFloatingAction,
            child: Text("Toggle Floating Action"),
          ),
        ],
      ),
    );
  }

  //UI Partial Functions

  Widget _buildFloatingAction() {
    return _showFloatingAction
        ? FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: _increment,
          )
        : null;
  }

  Widget _buildBottomNavigationBar() {
    //Building the bottom navigation bar with number of counters in the counter list
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _counters.asMap().entries.map((entry) {
          int index = entry.key;
          return _buildBottomNavigationChip(index);
        }).toList(),
      ),
    );
  }

  Widget _buildBottomNavigationChip(int index) {
    return InkWell(
      onTap: () {
        _setBottomNavigationIndex(index);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          "Counter ${index + 1}",
          style: TextStyle(
            color: index == _bottomNavigationIndex
                ? Colors.blue
                : Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
