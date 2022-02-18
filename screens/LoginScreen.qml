import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "../components/controls"
import "../controllers/userController.js" as UserController
import ".."

Rectangle {
    id: root
    color: Style.backgroundColor
    signal logIn()

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 100
        anchors.rightMargin: 100

        Item {
            Layout.fillHeight: true
        }

        TextFieldUnderline {
            id: teUserName
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            placeholderText: qsTr("Username or E-mail")
            text: "uniqcaster"
        }

        TextFieldUnderline {
            id: tePassword
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            placeholderText: qsTr("Password")
            echoMode: TextInput.Password
            text: "cast457"
        }

        Item {
            height: 20
        }

        Button {
            id: btnLogIn
            width: 200
            height: 30
            Layout.alignment: Qt.AlignHCenter

            Text {
                anchors.centerIn: parent
                text: qsTr("Log in")
                color: btnLogIn.hovered ? Style.textColorHovered : Style.textColor
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                color: "transparent"
                border.color: btnLogIn.down ? Style.borderFocusedColor : Style.borderColor
            }

            onClicked: {
                statusLabel.text = "";
                const loginData = { identifier: teUserName.text, password: tePassword.text }
                UserController.login(loginData).then(function(jsonResponse) {
                    root.logIn();
                }).catch(function(error) {
                    statusLabel.text = error.message
                });
            }
        }

        Item {
            height: 40
        }

        Label {
            id: statusLabel
            Layout.fillWidth: true
            horizontalAlignment: Qt.AlignHCenter
            color: Style.errorTextColor
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
