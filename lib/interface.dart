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
    "offsetLeft": Bodyd(
        x: 0,
        y: 100,
        s: 0,
        key: "offsetLeft",
        render: const Text(
          "offsetLeft: 0",
          style: TextStyle(
              fontSize: 14,
              backgroundColor: Color.fromARGB(255, 245, 245, 245)),
        ),
        mode: "text"),
    "offsetTop": Bodyd(
        x: 100,
        y: 100,
        s: 0,
        key: "offsetTop",
        render: const Text(
          "offsetTop: 0",
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
    "True": true,
    "False":false,
    //this below will be created on body interaccion or user interface
    "pointer": [],
    "pos1": 0,
    "pos2": 0,
    "pos3": 0,
    "pos4": 0,
    "offsetTop": 0,
    "offsetLeft": 0,
    "ison": false,
    "funcmap": funcmap,
    //instrucciones

    "step1": ["sub", "pos1", "pos3", "pointerx"],
    "step2": ["sub", "pos2", "pos4", "pointery"],
    "step3": ["assign", "pos3", "pointerx"],
    "step4": ["assign", "pos4", "pointery"],

    "step5": ["sub", "offsetLeft", "offsetLeft", "pos1"],
    "step6": ["sub", "offsetTop", "offsetTop", "pos2"],
    "step7": ["temp"],
    "step8": ["temp1"],

    //funciones
    "pointermove": [
      "step1",
      "step2",
      "step3",
      "step4",
      "step5",
      "step6",
      "step7"
    ],
    "pointerhover": ["step8"],

    "step9": ["get", "offsetLeft", "x", "key"],
    "step10": ["get", "offsetTop", "y", "key"],

    "onPointerDown": ["step9", "step10"],

    "step11": ["assign", "pos3", "pointerx"],
    "step12": ["assign", "pos4", "pointery"],
    "pointerdown": ["step11", "step12"],

    "step13": ["temp_updatewidget", "x", "offsetLeft", "key"],
    "step14": ["temp_updatewidget", "y", "offsetTop", "key"],
    "onPointerMove": ["step13", "step14"],

    // if (funcmap.containsKey(viewmap[datamap["key"]].key)) {
    //     funcmap[viewmap[datamap["key"]].s]();
    //   }
    //   datamap["pointer"].add(viewmap[datamap["key"]].key);
    "step15": ["append", "pointer", "key"],
    "step16": ["contains_funcmap", "ison", "funcmap", "key"],
    "step17": ["if", "ison", "True", "step18", "step19"],
    "step18": ["execute_button", "key"],
    "step19": [""],
    "onPointerUp": ["step15", "step17"]
  };

  // for functions
  late Map<String, dynamic> funcmap = {
    
    //cosas con funcmap
    "":(){
      print("null funct");
    },
    "if": () {
      //la direccion es incorrecta hay que acceder a mas profundidad
      print("${datamap[datamap["pointer"][3]]} ${datamap[datamap["pointer"][4]]}");
      if (datamap[datamap["pointer"][1]] == datamap[datamap["pointer"][2]]) {
        funcmap[datamap[datamap["pointer"][3]]]();
      } else {
        funcmap[datamap[datamap["pointer"][4]]]();
      }
    },
    "contains_funcmap": () {
      datamap["pointer"][1] = datamap[datamap["pointer"][2]]
          .containsKey(datamap[datamap["pointer"][3]]);
    },
    "execute_button": () {
      funcmap[datamap[datamap["pointer"][1]]]();
    },

    //cosas con el datamap
    "append": () {
      datamap[datamap["pointer"][1]].add(datamap[datamap["pointer"][2]]);
    },

    //cosas con el view map
    "temp_updatewidget": () {
      if (datamap["pointer"][1] == "x") {
        viewmap[datamap["pointer"][3]] = viewmap[datamap[datamap["pointer"][3]]]
            .copyWith(x: datamap[datamap["pointer"][2]]);
      }
      if (datamap["pointer"][1] == "y") {
        viewmap[datamap[datamap["pointer"][3]]] =
            viewmap[datamap["pointer"][3]].copyWith(y: datamap["offsetTop"]);
      }
    },
    "get": () {
      if (datamap["pointer"][2] == "x") {
        datamap[datamap["pointer"][1]] =
            viewmap[datamap[datamap["pointer"][3]]].x;
      }

      if (datamap["pointer"][2] == "y") {
        datamap[datamap["pointer"][1]] =
            viewmap[datamap[datamap["pointer"][3]]].y;
      }
    },

    "temp1": () {
      viewmap["pointerX"] = (viewmap["pointerX"] as Bodyd).copyWith(
        render: Text(
          "pointerX: ${datamap["pointerx"]}",
          style: const TextStyle(
              fontSize: 14,
              backgroundColor: Color.fromARGB(255, 245, 245, 245)),
        ),
      );
    },
    "temp": () {
      viewmap["pointerX"] = (viewmap["pointerX"] as Bodyd).copyWith(
        s: datamap["pointerx"],
        render: Text(
          "pointerX: ${datamap["pointerx"]}",
          style: const TextStyle(
              fontSize: 14,
              backgroundColor: Color.fromARGB(255, 245, 245, 245)),
        ),
      );
    },
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
    //list functios
    //create
    //delete
    //add
    //remove
    //insert
    //

    //comparation
    "greater": () {
      datamap[datamap["pointer"][1]] =
          datamap[datamap["pointer"][2]] > datamap[datamap["pointer"][3]];
    },
    "smaller": () {
      datamap[datamap["pointer"][0]] =
          datamap[datamap["pointer"][1]] < datamap[datamap["pointer"][2]];
    },
    "equal": () {
      datamap[datamap["pointer"][0]] =
          datamap[datamap["pointer"][1]] == datamap[datamap["pointer"][2]];
    },
    "different": () {
      datamap[datamap["pointer"][0]] =
          datamap[datamap["pointer"][1]] != datamap[datamap["pointer"][2]];
    },

    //logic
    "and": () {
      datamap[datamap["pointer"][1]] =
          datamap[datamap["pointer"][2]] && datamap[datamap["pointer"][3]];
    },
    "or": () {
      datamap[datamap["pointer"][0]] =
          datamap[datamap["pointer"][1]] || datamap[datamap["pointer"][2]];
    },

    //arithmetic
    "sub": () {
      datamap[datamap["pointer"][1]] =
          datamap[datamap["pointer"][2]] - datamap[datamap["pointer"][3]];
    },
    "sum": () {
      datamap[datamap["pointer"][0]] =
          datamap[datamap["pointer"][1]] + datamap[datamap["pointer"][2]];
    },
    "mul": () {
      datamap[datamap["pointer"][0]] =
          datamap[datamap["pointer"][1]] * datamap[datamap["pointer"][2]];
    },
    "div": () {
      datamap[datamap["pointer"][0]] =
          datamap[datamap["pointer"][1]] / datamap[datamap["pointer"][2]];
    },
    "assign": () {
      datamap[datamap["pointer"][1]] = datamap[datamap["pointer"][2]];
    },

    //events
    "pointerup": () {
      for (String func in datamap["pointerup"]) {
        datamap["pointer"] = datamap[func];
        funcmap[datamap[func][0]]();
      }
    },
    "onPointerUp": () {
      for (String func in datamap["onPointerUp"]) {
        datamap["pointer"] = datamap[func];
        funcmap[datamap[func][0]]();
      }
    },
    "onPointerMove": () {
      for (String func in datamap["onPointerMove"]) {
        datamap["pointer"] = datamap[func];
        funcmap[datamap[func][0]]();
      }
    },
    "pointerdown": () {
      for (String func in datamap["pointerdown"]) {
        datamap["pointer"] = datamap[func];
        funcmap[datamap[func][0]]();
      }
    },
    "onPointerDown": () {
      for (String func in datamap["onPointerDown"]) {
        datamap["pointer"] = datamap[func];
        funcmap[datamap[func][0]]();
      }
    },
    "pointerhover": () {
      for (String func in datamap["pointerhover"]) {
        datamap["pointer"] = datamap[func];
        funcmap[datamap[func][0]]();
      }
    },
    "pointermove": () {
      for (String func in datamap["pointermove"]) {
        datamap["pointer"] = datamap[func];
        funcmap[datamap[func][0]]();
      }
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
            datamap["key"] = key;
            funcmap["onPointerDown"]();
          },
          onPointerUp: (e) {
            datamap["key"] = key;
            funcmap["onPointerUp"]();
          },
          onPointerMove: (e) {
            //datamap["key"] = key;
            funcmap["onPointerMove"]();
          },
          child: viewmap[key].render,
        ),
      ));
    });

    return temp;
  }
}
