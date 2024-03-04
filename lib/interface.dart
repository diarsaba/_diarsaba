import 'package:flutter/material.dart';
import 'package:diarsaba/body.dart';
import 'dart:async';

class Bodys {
  late void Function() setstate;

  Bodys({required this.setstate});

  final _focus = FocusNode();
  final _controller = TextEditingController(text: "A");

  // for widgets
  late Map<String, dynamic> bodymap = {
    "string": Body(
        x: 0,
        y: 50,
        s: "string",
        key: "string",
        render: const Text(
          "string",
          style: TextStyle(
              fontSize: 14,
              backgroundColor: Color.fromARGB(255, 245, 245, 245)),
        ),
        mode: "text"),
    "double": Body(
        x: 50,
        y: 50,
        s: "double",
        key: "double",
        render: const Text(
          "double",
          style: TextStyle(
              fontSize: 14,
              backgroundColor: Color.fromARGB(255, 245, 245, 245)),
        ),
        mode: "text"),
    "borrar": Body(
        x: 100,
        y: 50,
        s: "borrar",
        key: "borrar",
        render: const Text(
          "borrar",
          style: TextStyle(
              fontSize: 14,
              backgroundColor: Color.fromARGB(255, 245, 245, 245)),
        ),
        mode: "text"),
    "ocultar": Body(
        x: 150,
        y: 50,
        s: "ocultar",
        key: "ocultar",
        render: const Text(
          "ocultar",
          style: TextStyle(
              fontSize: 14,
              backgroundColor: Color.fromARGB(255, 245, 245, 245)),
        ),
        mode: "text"),
    "ultimo": Body(
        x: 210,
        y: 50,
        s: "ultimo",
        key: "ultimo",
        render: const Text(
          "ultimo",
          style: TextStyle(
              fontSize: 14,
              backgroundColor: Color.fromARGB(255, 245, 245, 245)),
        ),
        mode: "text"),
    "pointerX": Bodyd(
        x: 260,
        y: 50,
        s: 0,
        key: "pointerX",
        render: Text(
          "pointerX: 0",
          style: const TextStyle(
              fontSize: 14,
              backgroundColor: Color.fromARGB(255, 245, 245, 245)),
        ),
        mode: "text"),
  };

  // for data
  late Map<String, dynamic> soulmap = {
    "pointerx": 0,
    "pointery": 0,
    "pointed": [],
    "pos1": 0,
    "pos2": 0,
    "pos3": 0,
    "pos4": 0,
    "offsetTop": 0,
    "offsetLeft": 0,
  };

  // for functions
  late Map<String, dynamic> funcmap = {
    "double": () {
      bodymap.addAll({
        "A": Body(
            x: 10,
            y: 10,
            s: "A",
            key: "A",
            render: SizedBox(
              height: 14,
              width: 200,
              child: EditableText(
                textInputAction: TextInputAction.done,
                onChanged: (t) {
                  if (t.contains(" ")) {
                    _controller.text = t.substring(0, t.length - 1);
                  }
                },
                onSubmitted: (t) {
                  bodymap.addAll({
                    t: Bodyd(
                        x: 10,
                        y: 100,
                        s: 0,
                        key: t,
                        render: Text(
                          "$t: 0",
                          style: const TextStyle(
                              fontSize: 14,
                              backgroundColor:
                                  Color.fromARGB(255, 245, 245, 245)),
                        ),
                        mode: "text"),
                  });

                  bodymap.remove("A");
                  _controller.text = "A";

                  setstate();
                },
                scrollPhysics: const ClampingScrollPhysics(),
                controller: _controller,
                focusNode: _focus,
                style: const TextStyle(color: Colors.black, fontSize: 14.5),
                cursorColor: Colors.black,
                backgroundCursorColor: Colors.black,
                selectionColor: Colors.blue,
                enableInteractiveSelection: true,
              ),
            ),
            mode: "edit")
      });
    },
    "string": () {
      bodymap.addAll({
        "A": Body(
            x: 10,
            y: 10,
            s: "A",
            key: "A",
            render: SizedBox(
              height: 14,
              width: 200,
              child: EditableText(
                textInputAction: TextInputAction.done,
                onChanged: (t) {
                  if (t.contains(" ")) {
                    _controller.text = t.substring(0, t.length - 1);
                  }
                },
                onSubmitted: (t) {
                  bodymap.addAll({
                    t: Body(
                        x: 10,
                        y: 100,
                        s: t,
                        key: t,
                        render: Text(
                          t,
                          style: const TextStyle(
                              fontSize: 14,
                              backgroundColor:
                                  Color.fromARGB(255, 245, 245, 245)),
                        ),
                        mode: "text"),
                  });

                  bodymap.remove("A");
                  _controller.text = "A";

                  setstate();
                },
                scrollPhysics: const ClampingScrollPhysics(),
                controller: _controller,
                focusNode: _focus,
                style: const TextStyle(color: Colors.black, fontSize: 14.5),
                cursorColor: Colors.black,
                backgroundCursorColor: Colors.black,
                selectionColor: Colors.blue,
                enableInteractiveSelection: true,
              ),
            ),
            mode: "edit")
      });
    },
    "borrar": () {
      bodymap.remove(soulmap["pointed"][soulmap["pointed"].length - 1]);
    },
    "ocultar": () {
      print("fincion ocultar");
      bodymap.remove(soulmap["pointed"][soulmap["pointed"].length - 1]);
    },
    "ultimo": () {
      print("fincion ultimo ${soulmap["pointed"]}");
    },
    "pointermove": () {
      pointermove();
    },
    "pointerdown": () {
      pointerdown();
    },
    "pointerup": () {},
    "pointerhover": () {},
    "asing": () {},
    "compatible": () {}
  };

  bool touched = false;
  bool hoverchild = false;

  dynamic drag;
  dynamic edit;

  late int ontime = 0;
  late bool canlong = true;

  late Timer timerGlobal;
  late int onTimeGlobal = 0;
  late bool canLongGlobal = true;

  void pointermove() {
    soulmap["pos1"] = soulmap["pos3"] - soulmap["x"];
    soulmap["pos2"] = soulmap["pos4"] - soulmap["y"];
    soulmap["pos3"] = soulmap["x"];
    soulmap["pos4"] = soulmap["y"];

    soulmap["offsetLeft"] -= soulmap["pos1"];
    soulmap["offsetTop"] -= soulmap["pos2"];
  }

  void pointerdown() {
    soulmap["pos3"] = soulmap["x"];
    soulmap["pos4"] = soulmap["y"];
  }

  void pointerup(double x, double y) {}

  void pointerhover(double x, double y) {
    (bodymap["pointerX"] as Bodyd).copyWith(s: x);
  }

  List<Widget> bodyswidgets() {
    List<Widget> temp = [];

    bodymap.forEach((key, _) {
      temp.add(Positioned(
        top: bodymap[key].y,
        left: bodymap[key].x,
        child: Listener(
          onPointerDown: (e) {
            soulmap["offsetLeft"] = bodymap[key].x;
            soulmap["offsetTop"] = bodymap[key].y;
          },
          onPointerUp: (e) {
            if (funcmap.containsKey(bodymap[key].s)) {
              funcmap[bodymap[key].s]();
            }

            soulmap["pointed"].add(bodymap[key].s);
          },
          onPointerMove: (e) {
            bodymap[key] = bodymap[key]
                .copyWith(x: soulmap["offsetLeft"], y: soulmap["offsetTop"]);
          },
          child: bodymap[key].render,
        ),
      ));
    });

    return temp;
  }
}