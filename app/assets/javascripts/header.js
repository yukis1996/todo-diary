$(function(){
  $("#list").hover(function(){
    $("#drop:not(:animated)", this).slideDown();
    $("#drop").css("background", "rgba(255, 243, 202, 0.664)"
    );
  },function(){
    $("#drop", this).slideUp();
  })
})