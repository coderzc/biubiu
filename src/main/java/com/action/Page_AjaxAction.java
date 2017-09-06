package com.action;

import com.entity.modelBeans.PageModel;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * Created by zc on 2016/12/23.
 */
public abstract class Page_AjaxAction<T> extends JsonActionSupport {

    protected PageModel<T> pageModel = new PageModel<T>();

    public PageModel<T> getPageModel() {
        return pageModel;
    }

    public void setPageModel(PageModel<T> pageModel) {
        this.pageModel = pageModel;
    }

    protected int init_pageSize;

    public void setInit_pageSize(int init_pageSize) {
        this.init_pageSize = init_pageSize;
        pageModel.setPageSize(init_pageSize);
    }

    public int getInit_pageSize() {

        return init_pageSize;
    }

    protected boolean page_volatile_after() {
        if (pageModel.getPageNo() > pageModel.getPageCount()) {
            error_msg = "last_";
            put_errormsg();
            return false;
        }
        if (pageModel.getDatas() == null || pageModel.getDatas().isEmpty()) {
            error_msg = "empty";
            put_errormsg();
            return false;
        }
        return true;
    }

    protected boolean page_volatile_before() {
        if (pageModel.getPageNo() <= 0) {
            error_msg = "first_";
            put_errormsg();
            return false;
        }
        return true;
    }


}
