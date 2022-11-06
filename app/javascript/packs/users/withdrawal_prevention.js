var unloaded = function (e) {
  var confirmMessage = "入力内容が破棄されます。";
  e.returnValue = confirmMessage;
  return confirmMessage;
};

window.addEventListener("beforeunload", unloaded, false);

document.getElementById("beforeunload-off").addEventListener("click", function(){
  window.removeEventListener("beforeunload", unloaded, false);
});
