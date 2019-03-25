#ifndef _SimpleWalletModel_H_
#define _SimpleWalletModel_H_

#include <QAbstractListModel>
#include <QStringList>
#include <QDate>
#include "HistoryModel.h"

class LocalWallet
{
public:
    LocalWallet(){;}
    LocalWallet(const QString &name);

    QString name() const;

private:
    QString m_name;
};

class LocalWalletModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum AnimalRoles {
        NameRole = Qt::UserRole + 1
    };

    LocalWalletModel(QObject *parent = 0);

    void addWallet(const LocalWallet &animal);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

    void clearModel();

protected:
    QHash<int, QByteArray> roleNames() const;
public:
    QList<LocalWallet> m_simpleWalletList;
};


#endif
