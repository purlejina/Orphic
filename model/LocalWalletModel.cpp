#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

#include "LocalWalletModel.h"
#include <QDebug>


LocalWallet::LocalWallet(const QString &name)
    : m_name(name)
{

}

QString LocalWallet::name() const
{
    return m_name;
}


LocalWalletModel::LocalWalletModel(QObject *parent)
    : QAbstractListModel(parent)
{
    addWallet(LocalWallet("No Wallet Selected"));
    addWallet(LocalWallet("wallet 1"));
    addWallet(LocalWallet("wallet 2"));
    addWallet(LocalWallet("wallet 3"));
    addWallet(LocalWallet("wallet 4"));
    addWallet(LocalWallet("wallet 5"));
}

void LocalWalletModel::addWallet(const LocalWallet &p_wallet)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_simpleWalletList << p_wallet;
    endInsertRows();
}

int LocalWalletModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return m_simpleWalletList.count();
}

QVariant LocalWalletModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_simpleWalletList.count())
        return QVariant();

    const LocalWallet &w_wallet = m_simpleWalletList[index.row()];

    if (role == NameRole)
        return w_wallet.name();

    return QVariant();
}

void LocalWalletModel::clearModel()
{
    m_simpleWalletList.clear();
    addWallet(LocalWallet("No Wallet Selected"));
    beginResetModel();
    endResetModel();
}

QHash<int, QByteArray> LocalWalletModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "swname";
    return roles;
}

