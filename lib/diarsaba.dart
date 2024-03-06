import 'package:flutter/material.dart';

import 'interface.dart';

class Diarsaba extends StatefulWidget {
  const Diarsaba({super.key});

  @override
  State<Diarsaba> createState() => _DiarsabaState();
}

class _DiarsabaState extends State<Diarsaba> {
  late Bodys bodys;

  @override
  void initState() {
    super.initState();
    bodys = Bodys(setstate: setstate);
  }

  void setstate() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (event) {
        bodys.soulmap["pointerx"] = event.position.dx;
        bodys.soulmap["pointery"] = event.position.dy;

        bodys.funcmap["pointermove"]();

        setState(() {});
      },
      onPointerDown: (event) {
        bodys.soulmap["pointerx"] = event.position.dx;
        bodys.soulmap["pointery"] = event.position.dy;

        bodys.funcmap["pointerdown"]();

        setState(() {});
      },
      onPointerUp: (event) {
        /* bodys.soulmap["pointerx"] = event.position.dx;
        bodys.soulmap["pointery"] = event.position.dy; */

        bodys.funcmap["pointerup"]();

        setState(() {});
      },
      onPointerHover: (event) {
        bodys.soulmap["pointerx"] = event.position.dx;
        bodys.soulmap["pointery"] = event.position.dy;

        bodys.funcmap["pointerhover"]();
        setState(() {});
      },
      child: Scaffold(
        body: Stack(
          children: [
            ...bodys.bodyswidgets(),
          ],
        ),
      ),
    );
  }
}
