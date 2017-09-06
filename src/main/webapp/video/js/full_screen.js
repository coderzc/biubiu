/**
 * Created by zc on 2016/12/9.
 */
function full_screen() {
    if ($(".barrage_video").width()+2 == $("body").width()) {
        // alert("a")
        $(".d_show").addClass("full_screen");
//                $(".d_show").css({width:$("#demand_video").width()})
    }
    else {
        // alert("b")
        $(".d_show").removeClass("full_screen");
//                $(".d_show").css({width:'100%'})
    }
}

$(document).ready(function () {
    document.addEventListener('fullscreenchange', function () {
        full_screen();
    });

    document.addEventListener('webkitfullscreenchange', function () {
        full_screen();
    });

    document.addEventListener('mozfullscreenchange', function () {
        full_screen();
    });

    document.addEventListener('MSFullscreenChange', function () {
        full_screen();
    });
});
