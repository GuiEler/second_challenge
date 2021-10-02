import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:second_challenge/ui/components/components.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  final bool isHomePage;
  final String? title;

  const CustomAppBar({
    Key? key,
    required this.scrollOffset,
    this.isHomePage = true,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void goToPreviousPage() {
      Navigator.pop(context);
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isHomePage
                ? Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: ConstrainedBox(
                        constraints:
                            const BoxConstraints(maxHeight: 40, maxWidth: 40),
                        child: Image.asset(AppImages.logo)),
                  )
                : IconButton(
                    onPressed: goToPreviousPage,
                    icon: const Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.white,
                      textDirection: TextDirection.ltr,
                    ),
                    iconSize: 40,
                  ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppBarButton(
                    buttonText: '',
                    onTap: () {
                      debugPrint('tapAppBarButton');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;

  const _AppBarButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Text(
        buttonText,
        style: const TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
