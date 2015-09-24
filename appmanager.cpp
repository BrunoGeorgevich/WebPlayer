#include "appmanager.h"

AppManager::AppManager(){}

bool AppManager::readApp()
{
    QFile descriptionFile(QCoreApplication::applicationDirPath() + "/description.json");

    if(!descriptionFile.exists()) {

        qDebug() << "Não tem o arquivo!";
        qDebug() << "CURRENT DIR : " << descriptionFile.fileName();

        return false;
    }

    descriptionFile.open(QIODevice::ReadOnly);

    QJsonDocument doc = QJsonDocument::fromJson(descriptionFile.readAll());
    QJsonObject jsonObj = doc.object();

    qDebug() << "URL : " << jsonObj["url"].toString();
    qDebug() << "TITLE : " << jsonObj["title"].toString();

    emit appReaded(jsonObj["url"].toString(), jsonObj["title"].toString());
    descriptionFile.close();
}
