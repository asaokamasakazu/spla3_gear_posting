// beforeunloadイベント発火時の処理
var unloaded = function (e) {
  // EdgeとIEでのみ表示されるカスタムメッセージ
  var confirmMessage = "入力内容が破棄されます。";
  e.returnValue = confirmMessage;
  return confirmMessage;
};

// beforeunloadイベントの登録
window.addEventListener("beforeunload", unloaded, false);

// 特定のボタンがクリックされたときはアラートを表示しない
document.getElementById("beforeunload-off").addEventListener("click", function(){
  // submit時はアラート表示しない
  window.removeEventListener("beforeunload", unloaded, false);
});
