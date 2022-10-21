import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  final Color color;
  final String exerciseType;
  final Text? exerciseName;
  final int itemCount;
  final Axis scrollDirection;
  final double listViewChildWidth;
  final ScrollPhysics? physics;
  final void Function()? ontap;

  ListViewWidget({
    this.ontap,
    this.exerciseName,
    required this.exerciseType,
    required this.itemCount,
    required this.color,
    required this.scrollDirection,
    required this.listViewChildWidth,
    this.physics = const AlwaysScrollableScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: itemCount,
      scrollDirection: scrollDirection,
      physics: physics,
      itemBuilder: ((context, index) {
        return GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(right: 10, bottom: 10),
            width: listViewChildWidth,
            // height: 100,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Text(exerciseType),
                Row(
                  children: [
                  
                    Text("    |   "),
                    Icon(Icons.bookmark_outline),
                  ],
                )
              ],
            ),
          ),
          onTap: () {
            ontap;
          },
        );
      }),
    );
  }
}
