import 'package:flutter/material.dart';
import 'package:diarsaba/body.dart';

class Bodys {
  late void Function() setstate;

  Bodys({required this.setstate});

  final _focus = FocusNode();
  final _controller = TextEditingController(text: "A");

  // for widgets
  late Map<String, dynamic> viewmap = {
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
        render: const Text(
          "pointerX: 0",
          style: TextStyle(
              fontSize: 14,
              backgroundColor: Color.fromARGB(255, 245, 245, 245)),
        ),
        mode: "text"),
  };

  // for data
  late Map<String, dynamic> datamap = {
    "pointerx": 0,
    "pointery": 0,
    //this below will be created on body interaccion or user interface
    "pointer": [],
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
      viewmap.addAll({
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
                  viewmap.addAll({
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

                  viewmap.remove("A");
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
      viewmap.addAll({
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
                  viewmap.addAll({
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

                  viewmap.remove("A");
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
      viewmap.remove(datamap["pointer"][datamap["pointer"].length - 1]);
    },
    "ocultar": () {
      viewmap.remove(datamap["pointer"][datamap["pointer"].length - 1]);
    },
    "ultimo": () {
      //datamap["pointer"]
    },
    "pointermove": () {
      datamap["pos1"] = datamap["pos3"] - datamap["pointerx"];
      datamap["pos2"] = datamap["pos4"] - datamap["pointery"];
      datamap["pos3"] = datamap["pointerx"];
      datamap["pos4"] = datamap["pointery"];

      datamap["offsetLeft"] -= datamap["pos1"];
      datamap["offsetTop"] -= datamap["pos2"];
    },
    "pointerdown": () {
      datamap["pos3"] = datamap["pointerx"];
      datamap["pos4"] = datamap["pointery"];
    },
    "pointerup": () {},
    "pointerhover": () {
      (viewmap["pointerX"] as Bodyd).copyWith(s: datamap["pointerx"]);
    },
    "compatible": () {},
    "reduce": () {
      datamap[datamap["pointer"][0]] =
          datamap[datamap["pointer"][1]] - datamap[datamap["pointer"][2]];
    },
    "add": () {
      datamap[datamap["pointer"][0]] =
          datamap[datamap["pointer"][1]] + datamap[datamap["pointer"][2]];
    },
    "multi": () {
      datamap[datamap["pointer"][0]] =
          datamap[datamap["pointer"][1]] * datamap[datamap["pointer"][2]];
    },
    "div": () {
      datamap[datamap["pointer"][0]] =
          datamap[datamap["pointer"][1]] / datamap[datamap["pointer"][2]];
    },
    "asing": () {
      datamap[datamap["pointer"][0]] = datamap[datamap["pointer"][1]];
    },
  };

  List<Widget> viewed() {
    List<Widget> temp = [];

    viewmap.forEach((key, _) {
      temp.add(Positioned(
        top: viewmap[key].y,
        left: viewmap[key].x,
        child: Listener(

          onPointerDown: (e) {
            datamap["offsetLeft"] = viewmap[key].x;
            datamap["offsetTop"] = viewmap[key].y;
          },

          onPointerUp: (e) {
            if (funcmap.containsKey(viewmap[key].s)) {
              funcmap[viewmap[key].s]();
            }
            datamap["pointer"].add(viewmap[key].s);
          },

          onPointerMove: (e) {
            viewmap[key] = viewmap[key]
                .copyWith(x: datamap["offsetLeft"], y: datamap["offsetTop"]);
          },

          child: viewmap[key].render,
        ),
      ));
    });

    return temp;
  }
}
