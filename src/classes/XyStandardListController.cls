/*****************************************************************************************************************
* @author      : SalesforceXytools
* @date        : 2017/12/08
* @description : Virtual class with reusable methods using standardsetcontroller
******************************************************************************************************************/
public virtual class XyStandardListController {
    private ApexPages.StandardSetController controller;
    private String queryStr;

    //** constructor
    public XyStandardListController() {
    }

    //** query methods
    protected void query(String queryStr) {
        this.queryStr = queryStr;

        // save pageSize
        Integer pageSize = this.pageSize;

        // reboot standard set controller
        this.controller = new ApexPages.StandardSetController(Database.getQueryLocator(queryStr));

        // reset pageSize
        this.pageSize = pageSize;
    }

    //** search methods
    public PageReference search(String queryStr) {
        query(queryStr);

        // return to same page
        return null;
    }


    //** pageable methods
    // get records on current page 
    protected List<SObject> getRecords() {
        return controller.getRecords();
    }

    public void first() {
        controller.first();
    }

    public void previous() {
        controller.previous();
    }

    public void next() {
        controller.next();
    }

    public void last() {
        controller.last();
    }

    public Boolean getHasPrevious() {
        return controller.getHasPrevious();
    }

    public Boolean getHasNext() {
        return controller.getHasNext();
    }

    public Integer getResultSize() {
        return controller.getResultSize();
    }

    public Integer getPageCount() {
        Integer resultSize = getResultSize();

        Integer oddRecordCount = Math.mod(resultSize, pageSize);
        return ((resultSize - oddRecordCount) / pageSize) + (oddRecordCount > 0 ? 1 : 0);
    }

    public Integer getPageNumber() {
        return controller.getPageNumber();
    }

    public void setPageNumber(Integer pageNumber) {
        controller.setPageNumber(pageNumber);
    }

    public Integer pageSize {
        get {
            if (controller != null){
                pageSize = controller.getPageSize();
            } 
            else{
                // default pagesize
                pageSize = 20; 
            }
            return pageSize;
        }

        set {
            pageSize = value;
            if (controller != null){
                controller.setPageSize(pageSize);
            } 
        }
    }

    public Boolean getRenderResults() {
        return (getResultSize() > 0);
    }

    //** update methods
    public virtual PageReference save() {
        return controller.save();
    }

    public virtual PageReference cancel() {
        return controller.cancel();
    }

    //** pass reference to XyStandardListController component 
    public XyStandardListController getController () {
        return this;
    }
}