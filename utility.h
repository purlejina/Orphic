#ifndef UTILITY_H
#define UTILITY_H

#include<QObject>
#include<string>
#include<QStringList>
#include<QVector>
#include "WalletModel.h"
#include "HistoryModel.h"
#include "LocalWalletModel.h"

class Utility: public QObject
{
    Q_OBJECT
public:
    Utility();
    ~Utility();

    OrphicWalletModel m_walletModel;
    HistoryModel m_historyModel;
    LocalWalletModel m_localWalletModel;

signals:

private:
    QString secretKey;
    QString recieveAddress = "dummy address";

public slots:
    //testing thing
    void callMeFromQml();

    //wallet API
    bool isWalletOpen();

    void newWallet(const QString &Name, const QString &Password, bool save);
    bool loadWallet_fromKey(const QString &SecretKey);
    bool loadWallet_fromCredentials(const QString &Name, const QString &Password);
    bool loadWallet_fromFile(const QString &Name, const QString &Password);
    void closeWallet();
    bool clearWallet(const QString &Password);
    // wallet get functions will also go here

    // transaction + wallet API
    void newClaim(QString p_type, QString p_name, QString p_make, QString p_model, QString p_year, QString p_serial, QString p_other, QString p_desc, QString p_file);

    bool checkPassword(QString p_password);
    void createTransaction(QString p_name, QString p_type, QString p_make, QString p_model, QString p_year, QString p_serial, QString p_other, QString p_desc, QString p_file);

    int getTotalBalance();
    int getTotalBitcoin();

    QString getBitcoinAddress();
    void doPayment(QString p_cardNumber, QString p_csv, QString p_expdate);

    bool checkTransaction(QString p_transactionId);
    QString getTransactionMsg();

    void receiveClaim_step1();
    void receiveClaim_step2(const QString &RecieveKey);
    // transaction get functions will also go here

    // search API
    void searchChain(const QString &Search);

    QString getWalletName();

    QString getWType(int p_idx);
    QString getWName(int p_idx);
    QString getWMake(int p_idx);
    QString getWModel(int p_idx);
    QString getWYear(int p_idx);
    QString getWSerial(int p_idx);
    QString getWOther(int p_idx);
    QString getWDescription(int p_idx);
    QString getWPicture(int p_idx);

    void    selectWallet(int p_idx);

    QString getFirstMessage();
    QString getSecretOutput();
};

#endif // UTILITY_H
