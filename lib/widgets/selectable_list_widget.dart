import 'package:flutter/material.dart';

class SelectableListWidget extends StatefulWidget {
  final List<String> selectableList;
  final String title;

  SelectableListWidget(
      {@required this.selectableList, @required this.title});

  @override
  _SelectableListWidgetState createState() => _SelectableListWidgetState();
}

class _SelectableListWidgetState extends State<SelectableListWidget> {
  String selectedItem, title;
  List<String> selectableList;

  @override
  void initState() {
    selectableList = widget.selectableList;
    selectedItem = selectableList[0];
    title = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 8.0),
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) => InkWell(
              onTap: () {
                setState(() {
                  selectedItem = selectableList[i];
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 8.0),
                child: RectangleTextWidget(
                  label: selectableList[i] ,
                  currentSelectedItem: selectedItem,
                ),
              ),
            ),
            itemCount: selectableList.length,
          ),
        ),
        SizedBox(height: 16.0),

      ],
    );
  }
}

class RectangleTextWidget extends StatelessWidget {
  final String label;
  final String currentSelectedItem;

  RectangleTextWidget({this.label, this.currentSelectedItem});

  bool isSelected()=>currentSelectedItem==label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          border: Border.all(
              color:
                  getBorderColor(context),
              width: getBorderWidth()),
          borderRadius: BorderRadius.circular(16.0)),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
              color: getTextColor(context),
              fontWeight: FontWeight.w600,
              fontSize: 16.0),
        ),
      ),
    );
  }

  Color getTextColor(BuildContext context) => isSelected() ? Theme.of(context).primaryColor : Colors.black;

  double getBorderWidth() =>  isSelected() ? 2.0 : 1.0;

  Color getBorderColor(BuildContext context) => isSelected() ? Theme.of(context).primaryColor : Colors.blueGrey;
}
