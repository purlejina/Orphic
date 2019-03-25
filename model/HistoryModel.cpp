#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

#include "HistoryModel.h"
#include <QDebug>


HistoryItem::HistoryItem(const QDate &date, const QString &transitionId, const QString &docHash)
    : m_date(date), m_transitionId(transitionId), m_docHash(docHash)
{

}

QDate HistoryItem::date() const
{
    return m_date;
}

QString HistoryItem::transitionId() const
{
    return m_transitionId;
}

QString HistoryItem::docHash() const
{
    return m_docHash;
}


HistoryModel::HistoryModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

void HistoryModel::addHistory(const HistoryItem &p_wallet)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_historyList << p_wallet;
    endInsertRows();
}

int HistoryModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return m_historyList.count();
}

QVariant HistoryModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_historyList.count())
        return QVariant();

    const HistoryItem &w_item = m_historyList[index.row()];

    if (role == DateRole)
        return w_item.date().toString("yyyy-MM-dd");
    else if (role == TransitionIDRole)
        return w_item.transitionId();
    else if (role == DocHash)
        return w_item.docHash();

    return QVariant();
}

void HistoryModel::clearModel()
{
    m_historyList.clear();
    beginResetModel();
    endResetModel();
}

void HistoryModel::loadFromList(QList<HistoryItem> &p_historyList)
{
    clearModel();
    for(int i = 0; i < p_historyList.count(); i ++)
    {
        addHistory(HistoryItem(p_historyList[i].date(), p_historyList[i].transitionId(), p_historyList[i].docHash()));
    }
}

QHash<int, QByteArray> HistoryModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[DateRole] = "hdate";
    roles[TransitionIDRole] = "htransitionid";
    roles[DocHash] = "hdochash";
    return roles;
}

