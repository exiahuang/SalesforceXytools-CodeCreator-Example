/*****************************************************************************************************************
* @author      : SalesforceXytools
* @date        : 2017/12/08
* @description : Controller for page with pagination extending reusable utitlity class
******************************************************************************************************************/
public class AccountListController extends XyStandardListController {
    
    public Account searchAccount {get; set;}
    public Integer currentPageSize {get; set;}

    public AccountListController() {
        this.searchAccount  = new Account();
        doSearch();
    }

    /**
     * Account Search
     */
    public PageReference doSearch() {
        this.currentPageSize = 10;
        pageSize = currentPageSize;

        string queryStr = AccountDao.getQueryField();
        //string queryStr = AccountDao.getAccountCount(this.searchAccount);

        return search(queryStr);
    }

    /**
     * Get Account List Search
     */
    public List<Account> getAccountList() {
        return (List<Account>) getRecords();
    }
}