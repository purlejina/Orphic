#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickView>

#include "utility.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();
    Utility U;
    context->setContextProperty("utility", &U);
    context->setContextProperty("walletModel", &U.m_walletModel);
    context->setContextProperty("searchClaimModel", &U.m_searchClaimModel);
    context->setContextProperty("historyModel", &U.m_historyModel);
    context->setContextProperty("localWalletModel", &U.m_localWalletModel);

    engine.load(QUrl(QStringLiteral("qrc:/svresources/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}
