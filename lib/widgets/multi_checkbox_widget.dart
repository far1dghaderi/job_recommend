import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MultiCheckboxWidget extends StatefulWidget {
  final List<String> items;
  final String lable;
  final int? selectedItem;
  final ValueChanged<int>? onChanged;
  const MultiCheckboxWidget({super.key, required this.items, required this.lable, required this.selectedItem, required this.onChanged});

  @override
  State<MultiCheckboxWidget> createState() => _MultiCheckboxWidgetState();
}

class _MultiCheckboxWidgetState extends State<MultiCheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(widget.lable, style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w500, color: Colors.black ),),
        Wrap(
          children: List.generate(
            widget.items.length, 
            (index) => Row(
            children: [
                Checkbox(
                  value: widget.selectedItem == index,
                  onChanged: (_) => widget.onChanged!(index),
                  activeColor: Theme.of(context).primaryColor, 
                  checkColor: Colors.white, 
                  shape: RoundedRectangleBorder( 
                    borderRadius: BorderRadius.circular(6),
                  ),
                  side: BorderSide(color: Colors.grey.shade400, width: 2),
                ),
                Text(widget.items[index], style: TextStyle(fontSize: 13, color: Colors.grey.shade600),),
              ],
            )
          ),
        ),

      ],
    );
  }
}