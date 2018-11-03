import QtQuick 2.5

Rectangle {
    id: button
    signal clicked
    property alias operation: buttonText.text
    border.color: "#FFD700"
    border.width: 1
    radius: 50
    color: button.pressed ? "#ffc61c" : "#ffff12"
    property real textHeight: height - 2

    Text {
        id: buttonText
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: parent.textHeight
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 14
        font.bold: true
        color: "#1b1c1d"
        font.family: "Open Sans Regular"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: {
            doOp(operation)
            button.clicked()
            button.color = "#ffc61c"
        }
        hoverEnabled: true
        onEntered: button.color = "#D1D600"
        onExited: button.color = "#ffff12"
    }
}
