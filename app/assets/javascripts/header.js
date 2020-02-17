$(function(){
  $("#list").hover(function(){
    $("#drop:not(:animated)", this).slideDown();
    $("#drop").css("background", "#FF8F00"
    );
  },function(){
    $("#drop", this).slideUp();
  })
})