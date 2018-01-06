/*!
 *@file QmlAndroidOrientation.h
 *@brief 屏幕旋转
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#pragma once
#include <QObject>
#include <QtAndroidExtras>
#include <QtAndroidExtras/QAndroidJniObject>
#include <QtAndroidExtras/QAndroidJniEnvironment>
#include <QtAndroidExtras/QtAndroid>

using namespace QtAndroid;

class QmlAndroidOrientation : public QObject
{
    Q_OBJECT
public:
    explicit QmlAndroidOrientation(QObject *parent = nullptr);

    Q_INVOKABLE QString setOrientationPortrait();
    Q_INVOKABLE QString setOrientationLandscape();
    Q_INVOKABLE QString getOrientation();

private:
    QAndroidJniEnvironment env;
    QAndroidJniObject activity;
};
