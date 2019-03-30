#include <string>
#include <iostream>
#include <QStringList>
#include <QVector>
#include "utility.h"
#include <QDebug>

//
#include <QColor>
//

//#include <wallet/wallet.h>

using namespace std;

Utility::Utility()
{

}

Utility::~Utility()
{

}

//testing
void Utility::callMeFromQml()
{
    qDebug("inside callMeFromOml()");
}

bool Utility::isWalletOpen()
{
    if (m_walletModel.m_walletName == "")
        return false;
    return true;
}

//wallet API
void Utility::newWallet(const QString &Name, const QString &Password, bool save)
{
    string name = Name.toStdString();
    string password = Password.toStdString();
    //dummy below where we call backend
    string SecretKey = "klajksd;lkajs;klfjaklsdjf";
    secretKey = QString::fromStdString(SecretKey);
    bool willSave = save;
}

bool Utility::loadWallet_fromKey(const QString &SecretKey)
{
    if (SecretKey != "test")
        return false;
    m_walletModel.loadTempWallet();
    return true;
}
bool Utility::loadWallet_fromCredentials(const QString &Name, const QString &Password)
{
    if (Name != "test" || Password != "test")
        return false;
    m_walletModel.loadTempWallet();
    return true;
}
bool Utility::loadWallet_fromFile(const QString &Name, const QString &Password)
{
    if (Name != "wallet 1" || Password != "test")
        return false;
    m_walletModel.loadTempWallet();
    return true;
}
void Utility::closeWallet()
{
    m_walletModel.closeWallet();
}
bool Utility::clearWallet(const QString &Password)
{
    if (Password == "test")
        return true;
    return false;
}
// wallet get functions will also go here

// transaction + wallet API
void Utility::newClaim(QString p_type, QString p_name, QString p_make, QString p_model, QString p_year, QString p_serial, QString p_other, QString p_desc, QString p_file)// lots of inputs
{
    m_walletModel.addClaim(p_type, p_name, p_make, p_model, p_year, p_serial, p_other, p_desc, p_file);
}

bool Utility::checkPassword(QString p_password)
{
    if (p_password == "test")
        return true;
    return false;
}

void Utility::createTransaction(QString p_name, QString p_type, QString p_make, QString p_model, QString p_year, QString p_serial, QString p_other, QString p_desc, QString p_file)
{

}

void Utility::doPayment(QString p_cardNumber, QString p_csv, QString p_expdate)
{

}

bool Utility::checkTransaction(QString p_transactionId)
{
    return true;
}

QString Utility::getTransactionMsg()
{
    return "Processing error";
}

QString Utility::receiveClaim_step1()
{
    return "asdfxcvxasxdbvyhuasbnjh";
}

bool Utility::receiveClaim_step2(const QString &RecieveKey)
{
    if (RecieveKey == "test")
        return true;
    return false;
}

void Utility::reportClaim(bool p_lostOrStolen, QString p_contact, QString p_file, QString p_note)
{

}

QString Utility::transferKey()
{
    return "asjcvzxvhoisndklnfkzxvkzx";
}

void Utility::transferClaim(QString p_receiverAddress, QString p_transferKey, QString p_note)
{

}

void Utility::editClaim(QString p_note, QString p_file, bool p_public)
{

}

void Utility::disclaim(QString p_note)
{

}

void Utility::foundClaim(QString p_note)
{

}
// transaction get functions will also go here

// search API
void Utility::searchBlockchain(const QString &Search)
{
    if (Search == "test")
        m_searchClaimModel.loadTempWallet();
    else
        m_searchClaimModel.clearModel();
}

QString Utility::getWalletName()
{
    return m_walletModel.m_walletName;
}

int Utility::getTotalBalance()
{
    return 2;
}

int Utility::getTotalBitcoin()
{
    return 0.00056;
}

QString Utility::getBitcoinAddress()
{
    return "abxzncosdfdsfzxclsdfsdvxzmzxc";
}

QString Utility::getWType(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].type();
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].type();
    }
}

QString Utility::getWName(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].name();
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].name();
    }
}

QString Utility::getWMake(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].make();
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].make();
    }

}

QString Utility::getWModel(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].model();
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].model();
    }

}

QString Utility::getWYear(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].year();
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].year();
    }

}

QString Utility::getWSerial(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].serial();
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].serial();
    }

}

QString Utility::getWOther(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].other();
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].other();
    }

}

QString Utility::getWDescription(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].description();
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].description();
    }

}

QString Utility::getWPicture(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].picture();
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].picture();
    }

}

QString Utility::getWTransactionId(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].transactionId();
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].transactionId();
    }

}

QString Utility::getWClaimedOn(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].claimedOn().toString("yyyy-MM-dd");
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].claimedOn().toString("yyyy-MM-dd");
    }

}

QString Utility::getWEditedOn(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].editedOn().toString("yyyy-MM-dd");
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].editedOn().toString("yyyy-MM-dd");
    }
}

QString Utility::getWReportedOn(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].reportedOn().toString("yyyy-MM-dd");
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].reportedOn().toString("yyyy-MM-dd");
    }
}

QString Utility::getWFoundOn(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].foundOn().toString("yyyy-MM-dd");
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].foundOn().toString("yyyy-MM-dd");
    }
}

QString Utility::getWTransferredOn(int p_idx, bool p_bSearch)
{
    if (p_bSearch == false)
    {
        if (p_idx < 0 || p_idx >= m_walletModel.m_claimList.count())
            return "";
        return m_walletModel.m_claimList[p_idx].transferredOn().toString("yyyy-MM-dd");
    }
    else
    {
        if (p_idx < 0 || p_idx >= m_searchClaimModel.m_claimList.count())
            return "";
        return m_searchClaimModel.m_claimList[p_idx].transferredOn().toString("yyyy-MM-dd");
    }
}

QString Utility::getFirstMessage()
{
    return "Wallet created";
}

QString Utility::getSecretOutput()
{
    return "No secret message";
}
