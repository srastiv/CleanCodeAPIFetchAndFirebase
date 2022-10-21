import 'package:flutter/material.dart';
import 'package:gofit/features/gofit/presentation/widgets/button.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buttonmaterial(
              Text(
                "Home",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Icon(
                Icons.home,
                color: Colors.deepPurple,
              ),
            ),
            buttonmaterial(
              Text(
                "Discover",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            buttonmaterial(
              Text(
                "Settings",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const Icon(
                Icons.settings,
                color: Colors.grey,
              ),
            ),
            buttonmaterial(
              Text(
                "Profile",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
