/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
import QtWebView 1.1

ApplicationWindow {
    property real dpScaleW:  Screen.desktopAvailableWidth / root.width
    property real dpScaleH:  Screen.desktopAvailableHeight / root.height
    readonly property real dpW: Math.max(Screen.pixelDensity * 25.4 / 100 * dpScaleW, 1)
    readonly property real dpH: Math.max(Screen.pixelDensity * 25.4 / 100 * dpScaleH, 1)
    property bool isClicked: true

    id: root
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    title: qsTr("")


    Image {
        id: image
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        height: dpH*48
        width: dpW*48
        source: "qrc:/1.png"
    }

    Rectangle{
        id: rectangle
        width: parent.width
        height: parent.height - image.height - textEdit.height
        anchors.top: image.bottom
        border.width: 1
        border.color: "red"

        WebView{
            width: parent.width - 2
            height: parent.height - 2
            anchors.centerIn: parent
            url: "http://www.camelstudio.cn"
        }
    }

    Row{
        anchors.top: rectangle.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: dpH*6
        width: parent.width*0.6

        Button{
            id: button
            height: dpH*24
            width: dpH*24
            text: "1"
            onClicked: {
                isClicked = !isClicked
                button.text = isClicked?"1":"0"
                textEdit.visible = isClicked
                if (isClicked){
                    textEdit.forceActiveFocus();
                }
            }
        }

        TextEdit{
            id: textEdit
            text: qsTr("输入一些文字")
            font.family: "microsoft yahei"
            font.pixelSize: dpH*15
            height: dpH*24
            width: parent.width - button.width
            horizontalAlignment: Text.AlignHCenter
            selectByKeyboard: true
            selectByMouse: true
            onVisibleChanged: {
                if (visible){
                    Qt.inputMethod.show()
                }else{
                    Qt.inputMethod.hide()
                }
                isClicked = visible
            }
            onActiveFocusOnPressChanged: {
                if (activeFocus){
                    Qt.inputMethod.show()
                    isClicked = true;
                }
            }
        }
    }
}
