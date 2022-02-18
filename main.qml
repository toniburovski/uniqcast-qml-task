import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import "screens"

Window {
    width: 800
    height: 480
    visible: true
    title: qsTr("UniqCast_t1")

    StackView {
        id: mainStack
        anchors.fill: parent
        initialItem: loginScreenComponent
    }

    Component {
        id: loginScreenComponent
        LoginScreen {
            onLogIn: function() {
                mainStack.push(mainScreenComponent);
            }
        }
    }
    Component {
        id: mainScreenComponent
        MainScreen { }
    }
}
