import 'package:flutter/material.dart';
import 'package:diarsaba/body.dart';

class Bodys {
  late void Function() setstate;

  Bodys({required this.setstate});

  final _focus = FocusNode();
  final _controller = TextEditingController(text: "A");

  // for data
  late Map<String, dynamic> datamap = {
    //my buttons
    "view": {
      "string": [10.0, 10.0, "string"],
      "double": [50.0, 10.0, "double"],
      "borrar": [100.0, 10.0, "borrar"],
      "offsetLeft": [150.0, 10.0, "offsetLeft"],
      "offsetTop": [200.0, 10.0, "offsetTop"],
      "pointerX": [250.0, 10.0, "pointerX"],
    },

    "onview": [
      "string",
      "double",
      "borrar",
      "pointerx",
      "offsetLeft",
      "offsetTop"
    ],

    "list_a": [],
    "list_b": [],
    "string": ["execute", "list_a"],
    "double": ["execute", "list_b"],

    "doubles": ["double", "list_b"],

    //
    "pointerx": 0,
    "pointery": 0,
    //constants
    "True": true,
    "False": false,
    //this below will be created on body interaccion or user interface
    "pointer": [],
    "clicked": [],
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

    "step15": ["append", "pointer", "key"],
    "step16": ["contains_funcmap", "ison", "funcmap", "key"],
    "step17": ["if", "ison", "True", "step18", "step19"],
    "step18": ["execute_button", "key"],
    "step19": [""],
    "onPointerUp": ["step15", "step16", "step17"],

    "append_clicked": ["append", "clicked", "key"],
    "pointerup": ["append_clicked"]
  };

  // for functions
  late Map<String, dynamic> funcmap = {
    //cosas con funcmap
    "": () {
      print("null funct");
    },
    "execute": () {
      for (String func in datamap["pointerup"]) {
        datamap["pointer"] = datamap[func];
        funcmap[datamap[func][0]]();
      }
    },
    "if": () {
      if (datamap[datamap["pointer"][1]] == datamap[datamap["pointer"][2]]) {
        datamap["pointer"] = datamap[datamap["pointer"][3]];
        funcmap[datamap["pointer"][0]]();
      } else {
        datamap["pointer"] = datamap[datamap["pointer"][4]];
        funcmap[datamap["pointer"][0]]();
      }
    },
    "contains_funcmap": () {
      datamap[datamap["pointer"][1]] = datamap[datamap["pointer"][2]]
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
        datamap["view"][datamap[datamap["pointer"][3]]] =
            datamap["view"][datamap[datamap["pointer"][3]]]
                .copyWith(x: datamap[datamap["pointer"][2]]);
      }
      if (datamap["pointer"][1] == "y") {
        datamap["view"][datamap[datamap["pointer"][3]]] =
            datamap["view"][datamap[datamap["pointer"][3]]]
                .copyWith(y: datamap[datamap["pointer"][2]]);
      }
    },
    "get": () {
      if (datamap["pointer"][2] == "x") {
        datamap[datamap["pointer"][1]] =
            datamap["view"][datamap[datamap["pointer"][3]]].x;
      }

      if (datamap["pointer"][2] == "y") {
        datamap[datamap["pointer"][1]] =
            datamap["view"][datamap[datamap["pointer"][3]]].y;
      }
    },

    "temp1": () {
      datamap["view"]["pointerX"] = (datamap["view"]["pointerX"] as Bodyd).copyWith(
        render: Text(
          "pointerX: ${datamap["pointerx"]}",
          style: const TextStyle(
              fontSize: 14,
              backgroundColor: Color.fromARGB(255, 245, 245, 245)),
        ),
      );
    },
    "temp": () {
      datamap["view"]["pointerX"] = (datamap["view"]["pointerX"] as Bodyd).copyWith(
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
      datamap["view"].addAll({
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
                  datamap["view"].addAll({
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

                  datamap["view"].remove("A");
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
            )
      });
    },
    "string_remove": () {
      datamap["view"].addAll({
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
                  datamap["view"].addAll({
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
                        ),
                  });

                  datamap["view"].remove("A");
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
            )
      });
    },
    "viewremove": () {
      datamap["view"].remove(datamap["clicked"][datamap["clicked"].length - 1]);
    },
    "viewadd": () {
      datamap["view"].addAll({datamap["pointer"][1]: datamap["pointer"][2]});
    },

    //list
    "add_list": () {
      datamap[datamap["pointer"][1]].append(datamap[datamap["pointer"][1]]);
    },
    "create_list": () {
      datamap.addAll({datamap["pointer"][1]: datamap["pointer"][2]});
    },
    "remove_list": () {
      datamap[datamap["pointer"][1]].remove(datamap[datamap["pointer"][2]]);
    },
    "insert_list": () {
      datamap[datamap["pointer"][1]].insert(
          datamap[datamap["pointer"][2]], datamap[datamap["pointer"][3]]);
    },

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
    List<Widget> viewline = [];

    datamap["view"].forEach((key, _) {
      //x y string
      viewline.add(Positioned(
        top: datamap["view"][key][0],
        left: datamap["view"][key][1],
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
          child: Text(
            datamap["view"][key][2],
            style: const TextStyle(
                fontSize: 14,
                backgroundColor: Color.fromARGB(255, 245, 245, 245)),
          ),
        ),
      ));
    });

    return viewline;
  }
}
