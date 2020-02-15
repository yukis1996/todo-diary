$(function(){
  $('input[type=file]').change(function(e){
    //ファイルオブジェクトを取得する
    let file = e.target.files[0];
    let reader = new FileReader();

    //画像でない場合は処理終了
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }

    //アップロードした画像を設定する
    reader.onload = (function(){
      return function(e){
        $(".imageicon").attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file);

  });
});