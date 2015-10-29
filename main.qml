import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.3

import QtWebEngine 1.1

import "qrc:/components"

ApplicationWindow {
    id:root
    width: Screen.width*(0.75)
    height: Screen.height*(0.75)
    visible: true

    x: Screen.width/2 - width/2
    y: Screen.height/2 - height/2


    Component.onCompleted: {
        var error = _descriptor.readApp()
        if(!error) navigator.url = "qrc:/assets/error.html"
    }
    TopBar {
        id:topBar
        width:parent.width
        height:parent.height/20
        color:"#09A"
        z:1
    }

    Item {

        anchors {
            fill:parent
        }

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

            property string downloadPath : "/home/bruno/Downloads/"

            profile.onDownloadRequested : {
                downloadDialog.open()
                download.accept()
            }

            profile.onDownloadFinished : {
                downloadDialog.downlaodFinished()
            }

            onFullScreenRequested: {
                request.accept()
            }
        }
    }

    DownloadDialog {
        id:downloadDialog
    }
}
