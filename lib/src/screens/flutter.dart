import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OverFlow extends StatefulWidget {
  @override
  _OverFlowState createState() => _OverFlowState();
}

class _OverFlowState extends State<OverFlow> {
  @override
  void initState() {
    getTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.message),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getTime() {
    DateTime time = DateTime.now();

    String newDate = DateFormat('yyyy-MM-dd: kk:mm:ss').format(time);
    print(newDate);
  }
}
