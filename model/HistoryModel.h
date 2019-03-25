#ifndef _HistoryModel_H_
#define _HistoryModel_H_

#include <QAbstractListModel>
#include <QStringList>
#include <QDate>

class HistoryItem
{
public:
    HistoryItem(){;}
    HistoryItem(const QDate &date, const QString &transitionId, const QString &docHash);

    QDate date() const;
    QString transitionId() const;
    QString docHash() const;

private:
    QDate m_date;
    QString m_transitionId;
    QString m_docHash;
};

class HistoryModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum AnimalRoles {
        DateRole = Qt::UserRole + 1,
        TransitionIDRole,
        DocHash
    };

    HistoryModel(QObject *parent = 0);

    void addHistory(const HistoryItem &animal);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

    void clearModel();

    void loadFromList(QList<HistoryItem> & p_historyList);

protected:
    QHash<int, QByteArray> roleNames() const;
public:
    QList<HistoryItem> m_historyList;

};


#endif
