import QtQuick 2.5
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
    id:downloadDialogRoot

    function open() {
        finishedScreen.visible = false
        state="opened"
    }

    function downlaodFinished() {
        finishedScreen.visible = true
    }

    function close() {
        state="closed"
    }

    state:"closed"
    anchors.fill:parent

    DropShadow {
        anchors.fill: centralRect
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 16
        color: "#A0000000"
        source: centralRect
        transparentBorder: true
    }

    Rectangle {
        id:centralRect
        width:parent.width/5
        height: parent.height/8

        x:parent.width*0.05

        Text {
            height: parent.height
            width: parent.width*0.8

            font.pixelSize: height*0.24
            font.bold: true

            color: "#444"

            text:"  Downloading ..."

            anchors {
                top:parent.top
                topMargin: parent.height*0.15
            }
        }

        ProgressBar {

            id:downloadProgressBar

            indeterminate: true

            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: parent.height*0.2
            }

            height: parent.height*0.2
            width: parent.width*0.9
        }

        Rectangle {
            id:finishedScreen
            visible: false
            anchors.fill: parent

            Row {
                anchors.fill: parent
                spacing: parent.width*0.05

                Text {
                    height: parent.height
                    width: parent.width*0.8

                    font.pixelSize: height*0.24
                    font.bold: true

                    color: "#444"

                    verticalAlignment: Text.AlignVCenter

                    text:"  Download Finished!"
                }

                Image {
                    height: parent.height/2
                    width: parent.width*0.1
                    source: "qrc:/assets/close.png"
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                    scale: 0.6

                    anchors {
                        verticalCenter: parent.verticalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: close()
                    }
                }
            }
        }
    }

    states : [
        State {
            name: "closed"
            PropertyChanges {
                target: centralRect
                y: downloadDialogRoot.height
            }
        },
        State {
            name: "opened"
            PropertyChanges {
                target: centralRect
                y: downloadDialogRoot.height - height*1.3
            }
        }
    ]

    transitions : [
        Transition {
            from: "*"
            to: "*"
            animations: [
                SequentialAnimation {
                    NumberAnimation {
                        target:centralRect
                        property: "y"
                        duration: 200
                    }
                }
            ]
        }
    ]
}
