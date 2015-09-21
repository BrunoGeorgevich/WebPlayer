import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

import QtWebView 1.0

ApplicationWindow {
    title: qsTr("GitHub WebApp")
    width: Screen.width*(0.75)
    height: Screen.height*(0.75)
    visible: true

    x: Screen.width/2 - width/2
    y: Screen.height/2 - height/2

    WebView {
        anchors.fill: parent

        url:"https://github.com/"

        onTitleChanged: {

            console.log(title);

            if(title == "1") {
                backButton.opacity = 0.0
            } else {
                backButton.opacity = 1.0
            }
        }
    }
}
