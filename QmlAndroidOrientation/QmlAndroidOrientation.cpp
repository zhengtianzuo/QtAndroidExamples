/*!
 *@file QmlAndroidOrientation.cpp
 *@brief 屏幕旋转
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#include "QmlAndroidOrientation.h"

QmlAndroidOrientation::QmlAndroidOrientation(QObject *parent) : QObject(parent)
{
    activity = androidActivity();
}

QString QmlAndroidOrientation::setOrientationPortrait()
{
    activity.callMethod<void>("setRequestedOrientation", "(I)V", 1);
    if(env->ExceptionCheck())
    {
        qDebug() << "exception occured";
        env->ExceptionClear();
    }
    return(getOrientation());
}

QString QmlAndroidOrientation::setOrientationLandscape()
{
    activity.callMethod<void>("setRequestedOrientation", "(I)V", 0);
    if(env->ExceptionCheck())
    {
        qDebug() << "exception occured";
        env->ExceptionClear();
    }
    return(getOrientation());
}

QString QmlAndroidOrientation::getOrientation()
{
    jint orient = activity.callMethod<jint>("getRequestedOrientation");
    if(env->ExceptionCheck())
    {
        qDebug() << "exception occured";
        env->ExceptionClear();
    }

    return ((orient == 0) ? QStringLiteral("横屏") : QStringLiteral("竖屏"));
}
