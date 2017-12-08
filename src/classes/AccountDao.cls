/**
* @author SalesforceXytools
*/
public with sharing class AccountDao {
    /**
     * get soql query string
     */
    public static String getQueryField(){
        String query_str = '';
        query_str += ' SELECT ';
        query_str += ' Id, ';               // 取引先 ID
        query_str += ' Name, ';               // 取引先名
        query_str += ' RecordTypeId, ';               // レコードタイプ ID
        query_str += ' BillingStreet, ';               // 町名・番地(請求先)
        query_str += ' BillingCity, ';               // 市区郡(請求先)
        query_str += ' BillingState, ';               // 都道府県(請求先)
        query_str += ' BillingPostalCode, ';               // 郵便番号(請求先)
        query_str += ' BillingCountry ';               // 国(請求先)
        query_str += ' FROM Account ';
        return query_str;
    }
    /**
    * get all Account
    * @return list of Account 
    */
    public static List<Account> getAllAccountList(){
        String query_str = getQueryField();
        query_str += ' limit 10000';
        List<Account> accountList = Database.query(query_str);

        return accountList;
    }

    /**
    * get Account by Set<id>
    * @return list of Account 
    */
    public static List<Account> getAccountList(Set<String> ids){
        String query_str = getQueryField();
        query_str += ' WHERE id IN:ids ';
        List<Account> accountList = Database.query(query_str);

        return accountList;
    }

    /**
    * get Account by id
    * @return one of Account 
    */
    public static Account getAccountById(String id){
        String query_str = getQueryField();
        query_str += ' WHERE id =: id  ';
        query_str += ' limit 1  ';
        List<Account> accountList = Database.query(query_str);

        if(accountList.isEmpty())
            return null;
        else
            return accountList.get(0);
    }

}