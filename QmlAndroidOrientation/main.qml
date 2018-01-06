/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    id: frmWindow
    visible: true
    width: 600
    height: 800
    title: qsTr("QmlAndroidOrientation")

    Column{
        anchors.fill: parent

        Label{
            id: show
            height: 200
            width: 400
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: orientation.getOrientation()
        }

        Button{
            height: 200
            width: 400
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("设置横屏")
            onClicked: {
                show.text = orientation.setOrientationLandscape();
            }
        }

        Button{
            height: 200
            width: 400
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("设置竖屏")
            onClicked: {
                show.text = orientation.setOrientationPortrait();
            }
        }
    }
}
