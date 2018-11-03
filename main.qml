import QtQuick 2.6
import QtQuick 2.6
import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import "calculator.js" as CalcEngine

Window {
    id: window
    property string division : "\u00f7"
    property string multiplication : "\u00d7"
    property string squareRoot : "\u221a"
    function doOp(operation) { CalcEngine.doOperation(operation) }
    minimumHeight: 390
    maximumHeight: 390
    maximumWidth: 300
    minimumWidth: 300
    visible: true
    color: "white"
    title: qsTr("Calculator#")
    ColumnLayout {
        implicitWidth: 300
        Display {
            id: display
            width: 300
            height: 100
        }
        RowLayout {
            id: radiobuttons
            anchors.fill: parent
            anchors.leftMargin: 5
            anchors.topMargin: 105
            implicitWidth: 300
            height: 55
            ColumnLayout {
                ExclusiveGroup { id: tabPositionGroup }
                RadioButton {
                    id: rb1
                    exclusiveGroup: tabPositionGroup
                    implicitWidth: 235
                    checked: true
                    text: "Обычный"
                    onClicked: {
                        if(checked){
                            layout.currentIndex = 0
                            window.minimumWidth = 300
                            window.maximumWidth = 300
                            window.width = 300
                            display.width = 300
                            radiobuttons.width = 290
                        }
                    }
                }
                RadioButton {
                    id: rb2
                    exclusiveGroup: tabPositionGroup
                    implicitWidth: 235
                    text: "Инженерный"
                    onClicked: {
                        if(checked){
                            layout.currentIndex = 1
                            window.minimumWidth = 535
                            window.maximumWidth = 535
                            window.width = 535
                            display.width = 535
                            radiobuttons.width = 575
                        }
                    }
                }
            }
            MyButton {
                operation: "C"
                implicitWidth: 50
                implicitHeight: 50
            }
        }
    }
    StackLayout {
          id: layout
          anchors.leftMargin: 5
          anchors.rightMargin: 5
          anchors.topMargin: 160
          anchors.fill: parent
          currentIndex: 0
          Grid {
              columns: 1
              spacing: 3
              RowLayout {
                  width: 295
                  MyButton {
                      operation: "7"
                      implicitWidth: 50
                      implicitHeight: 50
                  }
                  MyButton {
                      operation: "8"
                      implicitWidth: 50
                      implicitHeight: 50
                  }
                  MyButton {
                      operation: "9"
                      implicitWidth: 50
                      implicitHeight: 50
                  }
                  MyButton {
                      operation: division
                      implicitWidth: 50
                      implicitHeight: 50
                  }
                  MyButton {
                      operation: squareRoot
                      implicitWidth: 50
                      implicitHeight: 50
                  }
              }
              RowLayout {
                  height: 53
                  width: 295
                  MyButton {
                      operation: "4"
                      implicitWidth: 50
                      implicitHeight: 50
                  }
                  MyButton {
                      operation: "5"
                      implicitWidth: 50
                      implicitHeight: 50
                  }
                  MyButton {
                      operation: "6"
                      implicitWidth: 50
                      implicitHeight: 50
                  }
                  MyButton {
                      operation: multiplication
                      implicitWidth: 50
                      implicitHeight: 50
                  }
                  MyButton {
                      operation: "1/x"
                      implicitWidth: 50
                      implicitHeight: 50
                  }
              }
              RowLayout {
                  height: 110
                  Grid {
                      height: 106
                      columns: 1
                      spacing: 2
                      RowLayout {
                          height: 52
                          width: 235
                          MyButton {
                              operation: "1"
                              implicitWidth: 50
                              implicitHeight: 50
                          }
                          MyButton {
                              operation: "2"
                              implicitWidth: 50
                              implicitHeight: 50
                          }
                          MyButton {
                              operation: "3"
                              implicitWidth: 50
                              implicitHeight: 50
                          }
                          MyButton {
                              operation: "-"
                              implicitWidth: 50
                              implicitHeight: 50
                          }
                      }
                      RowLayout {
                          height: 54
                          width: 235
                          MyButton {
                              operation: "0"
                              implicitWidth: 105
                              implicitHeight: 50
                          }
                          MyButton {
                              operation: "."
                              implicitWidth: 50
                              implicitHeight: 50
                          }
                          MyButton {
                              operation: "+"
                              implicitWidth: 50
                              implicitHeight: 50
                          }
                      }
                  }
                  MyButton {
                      operation: "="
                      implicitWidth: 50
                      implicitHeight: 105
                  }
              }
          }
          RowLayout {
              width: 545
              height: 240
              Grid {
                  width: 230
                  height: 240
                  columns: 1
                  spacing: 4
                  RowLayout {
                      height: 50
                      width: 235
                      MyButton {
                          operation: "sinh"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "sin"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "exp"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "x\u00B2"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                  }
                  RowLayout {
                      height: 52
                      width: 235
                      MyButton {
                          operation: "cosh"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "cos"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "ln"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "x\u00B3"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                  }
                  RowLayout {
                      height: 50
                      width: 235
                      MyButton {
                          operation: "tanh"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "tan"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "log"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "x^y"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                  }
                  RowLayout {
                      height: 54
                      width: 235
                      MyButton {
                          operation: "n!"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "\u03C0"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "\u00B3" + squareRoot
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "y\u221a"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                  }
              }
              Grid {
                  width: 290
                  height: 250
                  columns: 1
                  spacing: 3
                  RowLayout {
                      height: 50
                      width: 290
                      MyButton {
                          operation: "7"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "8"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "9"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: division
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: squareRoot
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                  }
                  RowLayout {
                      height: 57
                      width: 290
                      MyButton {
                          operation: "4"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "5"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "6"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: multiplication
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                      MyButton {
                          operation: "1/x"
                          implicitWidth: 50
                          implicitHeight: 50
                      }
                  }
                  RowLayout {
                      height: 105
                      Grid {
                          height: 105
                          columns: 1
                          spacing: 2
                          RowLayout {
                              height: 50
                              width: 230
                              MyButton {
                                  operation: "1"
                                  implicitWidth: 50
                                  implicitHeight: 50
                              }
                              MyButton {
                                  operation: "2"
                                  implicitWidth: 50
                                  implicitHeight: 50
                              }
                              MyButton {
                                  operation: "3"
                                  implicitWidth: 50
                                  implicitHeight: 50
                              }
                              MyButton {
                                  operation: "-"
                                  implicitWidth: 50
                                  implicitHeight: 50
                              }
                          }
                          RowLayout {
                              height: 55
                              width: 230
                              MyButton {
                                  operation: "0"
                                  implicitWidth: 105
                                  implicitHeight: 50
                              }
                              MyButton {
                                  operation: "."
                                  implicitWidth: 50
                                  implicitHeight: 50
                              }
                              MyButton {
                                  operation: "+"
                                  implicitWidth: 50
                                  implicitHeight: 50
                              }
                          }
                      }
                      MyButton {
                          operation: "="
                          implicitWidth: 50
                          implicitHeight: 105
                      }
                  }
              }
          }
      }
  }
