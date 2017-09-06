package com.action;

import com.entity.Videos;
import com.entity.modelBeans.PageModel;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

/**
 * Created by zc on 2016/12/28.
 */
public class SosoAction extends ActionSupport implements ModelDriven<PageModel<Videos>>, ServiceSupport {
    public PageModel<Videos> pageModel = new PageModel<>();


    @Override
    public PageModel<Videos> getModel() {
        return pageModel;
    }


    @Override
    public String execute() throws Exception {
//        <param name="init_pageSize">15</param>
        pageModel.setPageNo(1);
        pageModel.setPageCount(15);
        String keyword = ServletActionContext.getRequest().getParameter("keyword");

        System.out.println(keyword);


        pageModel = VIDEO_SERVICE.soso(pageModel, keyword);


        return SUCCESS;
    }
}
