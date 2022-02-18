import QtQuick 2.0
import QtQuick.Controls 2.15
import "../.."

TextField {
    id: root
    horizontalAlignment: TextEdit.AlignHCenter
    selectByMouse: true
    color: hovered ? Style.textColorHovered: Style.textColor

    background: Rectangle {
        implicitHeight: 40
        color: "transparent"
        Rectangle {
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            height: 1
            color: root.activeFocus ? Style.borderFocusedColor : Style.borderColor
        }
    }
}
