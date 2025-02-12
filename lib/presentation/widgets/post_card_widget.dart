import 'package:cubit_task/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;

  const PostCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.backgroundColor.withOpacity(0.2), // Background color
        borderRadius: BorderRadius.circular(10), // Border Radius
        border: Border.all(
          width: 0.5,
          color: Colors.grey, // Border color
        ),
        image: DecorationImage(
          image: AssetImage("assets/bg.png"), // Background image
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white70.withOpacity(0.5), // Blend with bg color
            BlendMode.darken,
          ),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white, // Text color
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
