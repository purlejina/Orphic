#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

#include "WalletModel.h"
#include <QDebug>


OrphicClaim::OrphicClaim(const QString &type, const QString &name, const QString &make, const QString &model, const QString &year, const QString &serial, const QString &other, const QString &description, const QString &picture)
    : m_type(type), m_name(name), m_make(make), m_model(model), m_year(year), m_serial(serial), m_other(other), m_description(description), m_picture(picture)
{

}

QString OrphicClaim::type() const
{
    return m_type;
}

QString OrphicClaim::name() const
{
    return m_name;
}

QString OrphicClaim::make() const
{
    return m_make;
}

QString OrphicClaim::model() const
{
    return m_model;
}

QString OrphicClaim::year() const
{
    return m_year;
}

QString OrphicClaim::serial() const
{
    return m_serial;
}

QString OrphicClaim::other() const
{
    return m_other;
}

QString OrphicClaim::description() const
{
    return m_description;
}

QString OrphicClaim::picture() const
{
    return m_picture;
}

void OrphicClaim::addHistory(QDate p_date, QString p_id, QString p_docHash)
{
    m_historyList.push_back(HistoryItem(p_date, p_id, p_docHash));
}

OrphicWalletModel::OrphicWalletModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

void OrphicWalletModel::loadTempWallet()
{
    m_walletName = "wallet 1";

    OrphicClaim w_claim1("type1", "name1", "make1", "model1", "2019", "serial1", "other1", "description1", "qrc:/svresources/Images/biggercircle3.png");
    OrphicClaim w_claim2("type2", "name1", "make1", "model1", "2019", "serial1", "other1", "description1", "qrc:/svresources/Images/biggercircle3.png");

    w_claim1.addHistory(QDate(2019, 03, 17), "asndfnwenmfnasdmfasd", "asndfnwenmfnasdmfasd");
    w_claim1.addHistory(QDate(2019, 03, 18), "xcvnmncjadjfklasdf", "xcvnmncjadjfklasdf");
    w_claim1.addHistory(QDate(2019, 03, 19), "asdfsvxzfdsfdasfdas", "asdfsvxzfdsfdasfdas");
    w_claim1.addHistory(QDate(2019, 03, 20), "asdfasdfasdfasdfasdf", "asdfasdfasdfasdfasdf");
    w_claim1.addHistory(QDate(2019, 03, 21), "asdfzxcdsafasdfasdasdf", "asdfzxcdsafasdfasdasdf");
    w_claim2.addHistory(QDate(2019, 03, 22), "xzcvsafasdfasdf", "xzcvsafasdfasdf");
    w_claim2.addHistory(QDate(2019, 03, 23), "asdgsdafasdfasdfasdf", "asdgsdafasdfasdfasdf");

    addClaim(w_claim1);
    addClaim(w_claim2);
}

void OrphicWalletModel::addClaim(const OrphicClaim &p_wallet)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_claimList << p_wallet;
    endInsertRows();
}

void OrphicWalletModel::addClaim(QString p_type, QString p_name, QString p_make, QString p_model, QString p_year, QString p_serial, QString p_other, QString p_desc, QString p_file)
{
    OrphicClaim w_claim(p_type, p_name, p_make, p_model, p_year, p_serial, p_other, p_desc, p_file);
    addClaim(w_claim);
}

int OrphicWalletModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return m_claimList.count();
}

QVariant OrphicWalletModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_claimList.count())
        return QVariant();

    const OrphicClaim &w_wallet = m_claimList[index.row()];

    if (role == TypeRole)
        return w_wallet.type();
    else if (role == NameRole)
        return w_wallet.name();
    else if (role == MakeRole)
        return w_wallet.make();
    else if (role == ModelRole)
        return w_wallet.model();
    else if (role == YearRole)
        return w_wallet.year();
    else if (role == SerialRole)
        return w_wallet.serial();
    else if (role == OtherRole)
        return w_wallet.other();
    else if (role == DescriptionRole)
        return w_wallet.description();
    else if (role == PictureRole)
        return w_wallet.picture();

    return QVariant();
}

void OrphicWalletModel::clearModel()
{
    m_claimList.clear();
    beginResetModel();
    endResetModel();
}

QHash<int, QByteArray> OrphicWalletModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[TypeRole] = "wtype";
    roles[NameRole] = "wname";
    roles[MakeRole] = "wmake";
    roles[ModelRole] = "wmodel";
    roles[YearRole] = "wyear";
    roles[SerialRole] = "wserial";
    roles[OtherRole] = "wother";
    roles[DescriptionRole] = "wdescription";
    roles[PictureRole] = "wpicture";
    return roles;
}

