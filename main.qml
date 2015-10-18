import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

import QtWebEngine 1.1

ApplicationWindow {
    id:root
    width: Screen.width*(0.75)
    height: Screen.height*(0.75)
    visible: true

    x: Screen.width/2 - width/2
    y: Screen.height/2 - height/2


    Component.onCompleted: {

        var error = _descriptor.readApp();

        if(!error) {
            navigator.url = "qrc:/assets/error.html"
        }
    }

    Item {

        anchors.fill: parent
        focus: true

        Keys.onPressed: {
            if(event.modifiers == 134217728) {
                switch(event.key) {
                case 16777234:
                    navigator.goBack()
                    break;
                case 16777236:
                    navigator.goForward()
                    break;
                default:
                    console.log(event.key)
                }
            } else {
                if(event.key == 16777268) {
                    navigator.reload()
                }
            }
        }

        Connections {
            target:_descriptor
            onAppReaded:{
                root.title = title
                navigator.url = url
            }
        }

        WebEngineView {
            id:navigator
            anchors.fill: parent

            onLinkHovered: {
                console.log(hoveredUrl)
            }
        }

        Image {
            id:goBackArrow

            source:"qrc:/assets/back.png"
            fillMode: Image.PreserveAspectFit
            antialiasing: true

            anchors {
                top:parent.top
                left:parent.left
                topMargin: parent.height/200
                leftMargin: parent.width/200
            }

            visible:navigator.canGoBack

            width:parent.width/45
            height:width

            MouseArea {
                anchors.fill : parent

                onClicked: navigator.goBack()
            }
        }

        Image {
            id:refreshButton

            source:"qrc:/assets/reload.png"
            fillMode: Image.PreserveAspectFit
            antialiasing: true

            anchors {
                top:parent.top
                left:goBackArrow.right
                topMargin: parent.height/200
                leftMargin: parent.width/200
            }

            width:parent.width/45
            height:width

            MouseArea {
                anchors.fill : parent

                onClicked: navigator.reload()
            }
        }

        Image {
            id:goFowardArrow

            source:"qrc:/assets/next.png"
            fillMode: Image.PreserveAspectFit
            antialiasing: true

            anchors {
                top:parent.top
                left:refreshButton.right
                topMargin: parent.height/200
                leftMargin: parent.width/200
            }

            visible:navigator.canGoForward

            width:parent.width/45
            height:width

            MouseArea {
                anchors.fill : parent

                onClicked: navigator.goForward()
            }
        }
    }
}
