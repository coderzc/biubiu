/**
 * Created by zc on 2016/12/25.
 */
//动态生成分页插件
function make_page_plugin() {
    $("#page_plugin").empty();

    $("<li><a id='prev_passage'>&laquo;</a></li>").appendTo("#page_plugin");
    for (var i = 1; i <= pageCount; i++) {
        $("<li class='normal pageNo_li'><a>" + i + "</a></li>").appendTo("#page_plugin");
    }
    $(".pageNo_li").eq(pageNo - 1).addClass("active");//将该页面的页号标签点亮
    $("<li><a id='next_passage'>&raquo;</a></li>").appendTo("#page_plugin");
}


$(document).ready(function () {

    $(document).on("click", ".pageNo_li", function () {//跳到指定页
        if ($(this).hasClass('active')) {
            //...就在当前页
        }
        else {

            $("#page_plugin li").removeClass("active");
            $(this).addClass("active");
            var page_No = parseInt($(this).text());//获取点击的页面页号

            page_ajax(page_No);
        }


    });

    $(document).on("click", "#next_passage", function () {//下一页
        var now = $(".active");
        var act = $(".active").find("a").get(0);
        var last_passage = $(".normal").find("a").last().get(0);
        if (act == last_passage) {
            alert('到头了')
        }
        else {
            now.removeClass("active");
            now.next().addClass("active");
            var page_No = pageNo + 1;

            page_ajax(page_No);
        }
    });


    $(document).on("click", "#prev_passage", function () {//上一页
        var now = $(".active");
        var act = $(".active").find("a").get(0);
        var first_passage = $(".normal").find("a").first().get(0);
        if (act == first_passage) {
            alert('到头了')
        }
        else {
            now.removeClass("active");
            now.prev().addClass("active");
            var page_No = pageNo - 1;

            page_ajax(page_No);
        }
    });
});


function without_data() {
    $("#page_result").empty();
    $("#page_result").append("<p>没有相关数据哦</p>");
}