/**
 * Created by zc on 2016/12/19.
 */
function getObjectURL(file){
    var url=null;
    if(window.createObjectURL!=undefined){ // basic
        url=window.createObjectURL(file)
    }else if(window.URL!=undefined){ // mozilla(firefox)
        url=window.URL.createObjectURL(file)
    } else if(window.webkitURL.createObjectURL!=undefined){ // webkit or chrome
        url=window.webkitURL.createObjectURL(file)
    }else {
        url=URL.createObjectURL(file)
    }
    return url
}


//获取url指定参数的值
// function getQueryString(name) {
//     var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
//     var r = window.location.search.substr(1).match(reg);
//     if (r != null) return unescape(r[2]);
//     return null;
//
// }


 function getQueryString (key){
    var lot = location.search;
    var reg = new RegExp(".*" + key + "\\s*=([^=&#]*)(?=&|#|).*","g");
    return decodeURIComponent(lot.replace(reg, "$1"));
}