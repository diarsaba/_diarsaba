import 'package:flutter/material.dart';
import 'package:diarsaba/body.dart';
import 'dart:async';

class Bodys {
  late Map<String, dynamic> map;

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

  var timer;
  late int ontime = 0;
  late bool canlong = true;

  late Timer timerGlobal;
  late int onTimeGlobal = 0;
  late bool canLongGlobal = true;

  var autodelete;

  Bodys({
    required this.map,
  });

  Bodys copyWith({
    Map<String, dynamic>? map,
  }) {
    return Bodys(map: map ?? this.map);
  }

  final _focus = FocusNode();
  final _controller = TextEditingController();

  void init() {
    map = {
      "a": Body(
          x: 50,
          y: 50,
          s: "Hola",
          key: "a",
          render: const Text(
            "Hola",
            style: TextStyle(fontSize: 14),
          ),
          mode: "text"),
      "b": Body(
          x: 50,
          y: 100,
          s: "Hello",
          key: "b",
          render: const Text(
            "Hello",
            style: TextStyle(fontSize: 14),
          ),
          mode: "text"),
      "c": Body(
          x: 50,
          y: 150,
          s: "Konnichiwa",
          key: "c",
          render: const Text(
            "Konnichiwa",
            style: TextStyle(fontSize: 14),
          ),
          mode: "text"),
    };
  }

  void create(double x, double y, String initial, String key, Widget render,
      String mode) {
    map.addAll({
      key: Body(x: x, y: y, s: initial, key: key, render: render, mode: mode)
    });
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

    timerGlobal = Timer(const Duration(milliseconds: 500), () {
      onTimeGlobal = 0;
      timerGlobal.cancel();

      //&& !touched
      if (canLongGlobal) {
        //Long pressed

        print("long pressed global");

        //base();

        //autodelete = Timer(const Duration(milliseconds: 500), () {});
      }
    });
    canLongGlobal = true;

    onTimeGlobal++;
  }

  void pointerup(double x, double y) {
    canLongGlobal = false;
    if (onTimeGlobal > 1 && ontime == 0) {
      //double pressed
      timerGlobal.cancel();
      onTimeGlobal = 0;
      print("doble pressed global");
    }

    if (drag != null) {
      map.addAll({drag.key: drag.copyWith(x: offsetLeft, y: offsetTop)});
      drag = null;
    }
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

            touched = true;
            canlong = true;

            timer = Timer(const Duration(milliseconds: 500), () {
              ontime = 0;
              timer.cancel();

              if (canlong) {
                //Long pressed
                final body = map[key] as Body;
                print("long press");
                map[key] = body.copyWith(
                    x: offsetLeft,
                    y: offsetTop,
                    render: Text(
                      map[key].s,
                    ),
                    mode: "text");
              }
            });

            ontime++;
          },
          onPointerUp: (e) {
            touched = false;
            canlong = false;
            if (ontime > 1) {
              //double pressed
              print("double, ${map[key].s}");

              final body = map[key] as Body;
              if (map[key].mode == "text") {
                _controller.text = map[key].s;
                map[key] = body.copyWith(
                    x: offsetLeft,
                    y: offsetTop,
                    render: SizedBox(
                      height: 14,
                      width: 200,
                      child: EditableText(
                        scrollPhysics: const ClampingScrollPhysics(),
                        controller: _controller,
                        focusNode: _focus,
                        style: const TextStyle(
                            color: Colors.black, fontSize: 14.5),
                        cursorColor: Colors.black,
                        backgroundCursorColor: Colors.black,
                        selectionColor: Colors.blue,
                        enableInteractiveSelection: true,
                      ),
                    ),
                    mode: "edit");
              } else {
                map.addAll({
                  _controller.text: body.copyWith(
                      s: _controller.text,
                      x: offsetLeft,
                      y: offsetTop,
                      render: Text(
                        _controller.text,
                        style: const TextStyle(fontSize: 14),
                      ),
                      mode: "text")
                });

                map.remove("tempo");
              }
            }
          },
          onPointerMove: (e) {
            canlong = false;
            final body = map[key] as Body;
            map[key] = body.copyWith(x: offsetLeft, y: offsetTop);
          },
          child: map[key].render,
        ),
      ));
    });

    return temp;
  }
}
