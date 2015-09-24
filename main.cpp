#include <QQmlApplicationEngine>
#include <QApplication>
#include <QQmlContext>

#include "appmanager.h"

#ifdef QT_WEBVIEW_WEBENGINE_BACKEND
#include <QtWebEngine>
#endif // QT_WEBVIEW_WEBENGINE_BACKEND

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

#ifdef QT_WEBVIEW_WEBENGINE_BACKEND
    QtWebEngine::initialize();
#endif // QT_WEBVIEW_WEBENGINE_BACKEND

    AppManager *app = new AppManager();

    QQmlApplicationEngine engine;
    QQmlContext *ctx = engine.rootContext();
    ctx->setContextProperty("_descriptor", app);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return a.exec();
}
