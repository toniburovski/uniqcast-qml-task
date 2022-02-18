import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../"

Item {
    id: root
    height: 60
    width: ListView.view.width

    Rectangle {
        id: imageRect
        anchors.left: parent.left
        anchors.top: parent.top
        width: parent.height
        height: parent.height
        color: "transparent"

        Image {
            anchors.fill: parent
            anchors.margins: 10
            source: "https://devel.uniqcast.com/samples/logos/"+ id + ".png"
        }
    }

    Rectangle {
        id: nameRect
        anchors.left: imageRect.right
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "transparent"

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            color: Style.textColor
            text: qsTr(name)
        }
    }

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: 1
        color: Style.borderColor
    }
}
