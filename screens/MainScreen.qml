import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtMultimedia 5.15
import QtQml.Models 2.15

import "../components"
import "../controllers/channelController.js" as ChannelController
import "../"

Rectangle {
    id: root
    color: Style.backgroundColor

    ListModel {
        id: channelsModel
    }

    GridLayout {
        anchors.fill: parent
        flow: width > height ? GridLayout.LeftToRight : GridLayout.TopToBottom
        columnSpacing: 0
        rowSpacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Style.backgroundColor

            Component {
                id: listHighlight
                Rectangle {
                    color: Style.borderColor
                }
            }

            ListView {
                id: channelsList
                anchors.fill: parent
                boundsBehavior: Flickable.StopAtBounds
                model: channelsModel

                delegate: ChannelDelegate {
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            channelsList.currentIndex = index;
                        }
                    }
                }

                highlight: listHighlight
                highlightMoveDuration: 1000

                onCurrentIndexChanged: {
                    statusLabel.text = "";
                    const channelId = model.get(currentIndex).id;
                    ChannelController.getChannel(channelId).then(function(response){
                        video.source = response.url;
                        video.play();
                    }).catch(function(error) {
                        statusLabel.text = error.message;
                    });
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Style.colorBlack

            Video {
                id: video
                anchors.fill: parent

                onErrorChanged: {
                    statusLabel.text = errorString;
                }
            }
        }
    }

    Label {
        id: statusLabel
        anchors.centerIn: parent
        color: Style.errorTextColor
        visible: text !== ""
    }

    Component.onCompleted: {
        ChannelController.getChannels().then(function(response){
            for (let i in response) {
                if(response[i].name !== undefined) {
                    channelsModel.append({id: response[i].id, name: response[i].name});
                }
            }
        }).catch(function(error) {
            statusLabel.text = error.message;
        });
    }
}
