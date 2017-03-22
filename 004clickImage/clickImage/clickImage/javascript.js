function setImage(){
    var imgs = document.getElementsByTagName("img");
    for (var i=0;i<imgs.length;i++){
        imgs[i].setAttribute("onclick","imageClick("+i+")");
    }
}
function imageClick(i){
    var imgs = document.getElementsByTagName("img");
    var url = "clickImg::"+ i +"::"+imgs[i].src;
    document.location = url;
}
function changeImage(i, data){
    var imgs = document.getElementsByTagName("img");
    var img = imgs[i];
    img.src = data;
}
