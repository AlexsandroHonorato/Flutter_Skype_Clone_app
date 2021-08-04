import 'package:flutter/material.dart';
import 'package:skype_clone/utils/universal_variables.dart';

class GradiendAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final Widget title;
  final List<Widget> actions;
  final Widget bottom;

  const GradiendAppBar(
      {Key key, this.leading, this.title, this.actions, this.bottom})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            UniversalVariables.gradientColorStart,
            UniversalVariables.gradientColorEnd,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (leading != null) leading,
                    if (title != null) title,
                  ],
                ),
                if (actions != null)
                  Row(
                    children: actions,
                  ),
              ],
            ),
            if (bottom != null) bottom
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
