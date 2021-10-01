import 'package:flutter/material.dart';

import 'package:second_challenge/ui/components/components.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({
    Key? key,
    required this.scrollOffset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(AppImages.logo),
            const SizedBox(
              width: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  buttonText: '',
                  onTap: () {
                    debugPrint('tapAppBarButton');
                  },
                )
              ],
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
