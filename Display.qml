import QtQuick 2.0

Rectangle {
    property alias text : displayText.text
    id: resultArea
    color: "#46a2da"
    Text {
        id: displayText
        anchors.fill: parent
        anchors.rightMargin: 15
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        text: "0"
        color: "white"
        font.pointSize: 36
        font.family: "Open Sans Regular"
        fontSizeMode: Text.Fit
    }
}
