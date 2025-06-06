
import 'package:flutter/material.dart';

class OneRowDataWidget extends StatelessWidget {
  final String title;
  final Object des;
  final bool isList;
  const OneRowDataWidget({super.key, required this.title, required this.des, required this.isList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            children: [
              CircleAvatar(backgroundColor: Theme.of(context).primaryColor, radius: 4,),
              Flexible(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          if (isList)
            ...(des as List).map((skill) => Padding(
              padding: EdgeInsets.only(right: 16),
              child: Text(
                '• $skill',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ))
          else
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Text(
                des.toString(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ),
        ],
      ),
    );
  }
}