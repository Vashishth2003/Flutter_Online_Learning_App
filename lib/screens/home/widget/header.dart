import 'package:flutter/material.dart';
import 'package:online_learning_app/UI/routes_names.dart';
import 'package:online_learning_app/constants.dart';

class Header extends StatelessWidget {
  final bool hasUnreadNotifications;

  const Header({
    super.key,
    this.hasUnreadNotifications = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Eric",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Text(
                "Let's Learn Something New Today",
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        const SizedBox(width: 10),
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: kOptionColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  const Center(
                    child: Icon(Icons.notifications, color: Colors.white),
                  ),
                  if (hasUnreadNotifications)
                    Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesNames.account);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: kOptionColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Icon(Icons.person, color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }
}

