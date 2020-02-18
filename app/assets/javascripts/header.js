$(function(){
  $("li").hover(function(){
    $("#drop:not(:animated)", this).slideDown();
    $("ul").css("background", "#FF8F00"
    );
  },function(){
    $("#drop", this).slideUp();
  })
})