//工作票的逻辑
function printWoOt() {
    // 482px
    var currentBtn = document.getElementById("printWoOt");
     currentBtn.style.display = "none";
     window.print();
     currentBtn.style.display = "block";
}

$(document).ready(function () {

    //循环遍历
    $(".spantime").each(function () {
        //判断span标签是否存在值,没有给它固定样式
        if ($(this).text() == "") {
            $(this).addClass("current");
        }

    })
}) ;

let table='';

