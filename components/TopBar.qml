import QtQuick 2.5
import QtGraphicalEffects 1.0

Item {
    property alias color : topBarRect.color

    Timer {
        id: topBarTimer
        interval: 3000
    }

    DropShadow {
        anchors.fill: topBarRect
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 16
        color: "#80000000"
        transparentBorder: true
        source: topBarRect
    }

    Rectangle {
        id:topBarRect

        anchors.horizontalCenter: parent.horizontalCenter

        width:parent.width*(0.95)
        height: parent.height*(0.9)

        state:"hidden"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: topBarRect.state = "showed"
            onExited: topBarRect.state = "hidden"
        }

        Row {
            anchors {
                fill: parent
                leftMargin:width/100
            }

            spacing: width/100

            Image {
                id:goBackArrow

                source:"qrc:/assets/back.png"
                fillMode: Image.PreserveAspectFit
                antialiasing: true

                opacity:(navigator.canGoBack) ? 1 : 0.3;
                enabled:navigator.canGoBack

                height:parent.height * 0.9
                width:height

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

                height:parent.height * 0.9
                width:height

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

                opacity:(navigator.canGoForward) ? 1 : 0.3;
                enabled:navigator.canGoForward

                height:parent.height * 0.9
                width:height

                MouseArea {
                    anchors.fill : parent

                    onClicked: navigator.goForward()
                }
            }
        }

        states: [
            State {
                name: "hidden"
                PropertyChanges {
                    target: topBarRect
                    y:0 - height*(0.9)
                }
            },
            State {
                name: "showed"
                PropertyChanges {
                    target: topBarRect
                    y:0
                }
            }
        ]

        transitions: [
            Transition {
                from: "*"
                to: "*"
                NumberAnimation {
                    target:topBarRect
                    property: "y"
                    duration: 400
                }
            }
        ]
    }
}
