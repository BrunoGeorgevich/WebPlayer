#ifndef APPMANAGER_H
#define APPMANAGER_H

//Core Classes
#include <QCoreApplication>
#include <QObject>
#include <QDebug>
#include <QDir>

//JSON Classes
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

class AppManager : public QObject
{
    Q_OBJECT
public:

    AppManager();
    Q_INVOKABLE bool readApp();

signals:

    void appReaded(QString url, QString title);

};

#endif // APPMANAGER_H
