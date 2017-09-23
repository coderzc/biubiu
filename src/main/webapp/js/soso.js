/**
 * Created by zc on 2016/12/25.
 */

//获取搜索分页数据
function page_ajax(page_No) {

    if (param != null&&param.length>0) {

        $.ajax({
            type: "POST",
            url: "ajax/pagevideo-soso",
            dataType: "json",
            data: {
                 keyword: param,//搜索参数
                'pageModel.pageNo': page_No //页号参数

            },//请求分页数据
            success: function (data) {
                if (data.success) {

                    //获取当前页号和总页数
                    pageNo = data.pageModel.pageNo;
                    pageCount = data.pageModel.pageCount;

                    make_page_plugin();//生成分页插件

                    update_video_ui(data.pageModel.datas, data.pageModel.recordCount)//更新视频ui

                }
                else {
                    without_data();
                }
            },
            error: function (jqXHR) {
                alert("错误提示： " + jqXHR.status + " " + jqXHR.statusText);
            }
        });
    }
    else {
        // window.location = "404.jsp";
        without_data();
    }
}


//更新视频ui
function update_video_ui(video_list, recordCount) {

    $("#page_result").empty();

    var so_info = $("<div>").addClass("so_info").append("<p class='so_info_total'>共" + recordCount + "条数据</p>");
    $("#page_result").append(so_info);

    var items = $("<ul class='ajax_render'></ul>");

//...



    for (key in video_list) {

        var item = $("<li class='vedio_matrix'></li>").append("<a href="+server_path+"/video/demand?video_id="+video_list[key].videoId+"><div class='video_cover'><img class='coverimg'/></div></a>");

       item.find(".coverimg").attr({
           "src": video_list[key].videoCoverPath,
       });

        var video_info = $("<div class='info'></div>").append("<div class='headline'><span class='avid_type'><a class='title' href='#'>"+video_list[key].videoTitle+"</a></span></div>");


        var tags = $("<div class='tags'></div>")

        $("<span style='width: 57px;'><i class='watch_num'></i>"+video_list[key].videoWatchCount+"次</span>").appendTo(tags);
        $("<span style='width: 83px;margin-left: 10px'><i class='upload_time'></i>"+video_list[key].videoUploadTime+"</span>").appendTo(tags);
        $("<span ><i class='uper'></i>"+video_list[key].up_user.userName+"</span>").appendTo(tags);

        video_info.appendTo(item);
        tags.appendTo(item);

        item.appendTo(items);
    }

    $("#page_result").append(items)
}


