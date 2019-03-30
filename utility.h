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

    OrphicWalletModel m_searchClaimModel;

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

    QString receiveClaim_step1();
    bool receiveClaim_step2(const QString &RecieveKey);
    // transaction get functions will also go here

    // report API
    void reportClaim(bool p_lostOrStolen, QString p_contact, QString p_file, QString p_note);

    // transfer API
    QString transferKey();
    void    transferClaim(QString p_receiverAddress, QString p_transferKey, QString p_note);

    // edit API
    void    editClaim(QString p_note, QString p_file, bool p_public);

    // disclaim API
    void    disclaim(QString p_note);

    // found API
    void    foundClaim(QString p_note);

    // search API
    void searchBlockchain(const QString &Search);

    QString getWalletName();

    QString getWType(int p_idx, bool p_bSearch = false);
    QString getWName(int p_idx, bool p_bSearch = false);
    QString getWMake(int p_idx, bool p_bSearch = false);
    QString getWModel(int p_idx, bool p_bSearch = false);
    QString getWYear(int p_idx, bool p_bSearch = false);
    QString getWSerial(int p_idx, bool p_bSearch = false);
    QString getWOther(int p_idx, bool p_bSearch = false);
    QString getWDescription(int p_idx, bool p_bSearch = false);
    QString getWPicture(int p_idx, bool p_bSearch = false);

    QString getWTransactionId(int p_idx, bool p_bSearch = false);
    QString getWClaimedOn(int p_idx, bool p_bSearch = false);
    QString getWEditedOn(int p_idx, bool p_bSearch = false);
    QString getWReportedOn(int p_idx, bool p_bSearch = false);
    QString getWFoundOn(int p_idx, bool p_bSearch = false);
    QString getWTransferredOn(int p_idx, bool p_bSearch = false);

    QString getFirstMessage();
    QString getSecretOutput();
};

#endif // UTILITY_H
