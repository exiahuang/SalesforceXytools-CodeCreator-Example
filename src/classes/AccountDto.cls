/**
* @author SalesforceXytools
*/
public class AccountDto {

    // 取引先 ID , id
    public String id {get;set;}

    // 取引先名 , string
    public String name {get;set;}

    // レコードタイプ ID , reference
    // referenceTo: RecordType
    // relationshipName : RecordType
    public String recordTypeId {get;set;}

    // 町名・番地(請求先) , textarea
    public String billingStreet {get;set;}

    // 市区郡(請求先) , string
    public String billingCity {get;set;}

    // 都道府県(請求先) , string
    public String billingState {get;set;}

    // 郵便番号(請求先) , string
    public String billingPostalCode {get;set;}

    // 国(請求先) , string
    public String billingCountry {get;set;}

    public AccountDto() {
        init();
    }

    public AccountDto(Account sobj) {
        init();
        if(sobj != null){
            this.id = sobj.Id;    // 取引先 ID
            this.name = sobj.Name;    // 取引先名
            this.recordTypeId = sobj.RecordTypeId;    // レコードタイプ ID
            this.billingStreet = sobj.BillingStreet;    // 町名・番地(請求先)
            this.billingCity = sobj.BillingCity;    // 市区郡(請求先)
            this.billingState = sobj.BillingState;    // 都道府県(請求先)
            this.billingPostalCode = sobj.BillingPostalCode;    // 郵便番号(請求先)
            this.billingCountry = sobj.BillingCountry;    // 国(請求先)
        }
    }

    /**
     * init method
     */
    public void init(){

    }

    /**
    * Change the dto to sobject
    * get sobject Account from dto
    * @return Account 
    */
    public Account getSobject(){
        Account sobj = new Account();
        sobj.Id = this.id;    // 取引先 ID
        sobj.Name = this.name;    // 取引先名
        sobj.RecordTypeId = this.recordTypeId;    // レコードタイプ ID
        sobj.BillingStreet = this.billingStreet;    // 町名・番地(請求先)
        sobj.BillingCity = this.billingCity;    // 市区郡(請求先)
        sobj.BillingState = this.billingState;    // 都道府県(請求先)
        sobj.BillingPostalCode = this.billingPostalCode;    // 郵便番号(請求先)
        sobj.BillingCountry = this.billingCountry;    // 国(請求先)
        return sobj;
    }

}