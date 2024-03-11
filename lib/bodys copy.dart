import 'package:flutter/material.dart';
import 'package:diarsaba/body.dart';
import 'dart:async';

class Bodys {
  late void Function() setstate;
  

  double pos1 = 0;
  double pos2 = 0;
  double pos3 = 0;
  double pos4 = 0;

  double offsetTop = 0;
  double offsetLeft = 0;

  bool touched = false;
  bool hoverchild = false;

  dynamic drag;
  dynamic edit;

  late int ontime = 0;
  late bool canlong = true;

  late Timer timerGlobal;
  late int onTimeGlobal = 0;
  late bool canLongGlobal = true;

  Bodys({required this.map, required this.setstate});

  Bodys copyWith({
    Map<String, dynamic>? map,
    VoidCallback? setstate,
  }) {
    return Bodys(map: map ?? this.map, setstate: setstate ?? this.setstate);
  }

  late Map<String, dynamic> map;
  late Map<String, dynamic> bodymap;
  late Map<String, dynamic> datamap;
  late Map<String, dynamic> funcmap;

  final _focus = FocusNode();
  final _controller = TextEditingController();

  late Map<String, dynamic> primary = {
    "pointed": [],
    "double": () {
      map.addAll({
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
                  map.addAll({
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

                  map.remove("A");
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
      map.addAll({
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
                  map.addAll({
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

                  map.remove("A");
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
      print("fincion borrar");

      map.remove(primary["pointed"][primary["pointed"].length - 1]);
      //delete from database
      //but could be imposible
    },
    "ocultar": () {
      print("fincion ocultar");
      map.remove(primary["pointed"][primary["pointed"].length - 1]);
    },
    "ultimo": () {
      print("fincion ultimo ${primary["pointed"]}");
    },
    "pointermove": () {},
    "pointerdown": () {},
    "pointerup": () {},
    "asing": () {},
    "compatible": () {}
  };

  void init() {
    _controller.text = "A";
    map = {
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
          render:  Text(
            "pointerX: 0",
            style: const TextStyle(
                fontSize: 14,
                backgroundColor: Color.fromARGB(255, 245, 245, 245)),
          ),
          mode: "text"),
    };
  }

  void delete(String key) {
    map.remove(key);
  }

  void base() {
    map.addAll({
      "tempo": Body(
          x: pos3,
          y: pos4,
          s: "AEIOU",
          key: "tempo",
          render: const Text(
            "AEIOU",
            style: TextStyle(fontSize: 14),
          ),
          mode: "text")
    });
  }

  void pointermove(double x, double y) {
    pos1 = pos3 - x;
    pos2 = pos4 - y;
    pos3 = x;
    pos4 = y;

    offsetLeft -= pos1;
    offsetTop -= pos2;
  }

  void pointerdown(double x, double y) {
    pos3 = x;
    pos4 = y;
  }

  void pointerup(double x, double y) {}

  void pointerhover(double x, double y){


   ( map["pointerX"] as Bodyd).copyWith(s: x);
  }

  List<Widget> bodyswidgets() {
    List<Widget> temp = [];

    map.forEach((key, _) {


      temp.add(Positioned(
        top: map[key].y,
        left: map[key].x,
        child: Listener(
          onPointerDown: (e) {
            offsetLeft = map[key].x;
            offsetTop = map[key].y;
          },
          onPointerUp: (e) {
            if (primary.containsKey(map[key].s)) {
              primary[map[key].s]();
            }

            primary["pointed"].add(map[key].s);
          },
          onPointerMove: (e) {
            map[key] = map[key].copyWith(x: offsetLeft, y: offsetTop);
          },
          child: map[key].render,
        ),
      ));
    });

    return temp;
  }
}
