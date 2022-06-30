import 'package:flutter/material.dart';

class CustomDropDownSearch<T extends dynamic>  extends StatefulWidget{
  const CustomDropDownSearch({this.items,this.dataList,Key? key}) : super(key: key);
  final List<T>? dataList;
  final List<Widget>? items;
  @override
  State<StatefulWidget> createState() => _CustomDropDownSearchState();
  
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide()
        )
      ),
      child: Row(
        children: [
          
        ],
      ),
    );
  }
  
}

