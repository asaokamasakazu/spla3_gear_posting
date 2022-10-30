window.addEventListener('DOMContentLoaded', function(){
  let passview = document.getElementById("passview");
  let input_pass = document.getElementById("input_pass");
  let input_pass_confirmation = document.getElementById("input_pass_confirmation");
  passview.addEventListener("click", (e)=>{
    if( input_pass.type === 'password' ) {
      input_pass.type = 'text';
      input_pass_confirmation.type = 'text';
    } else {
      input_pass.type = 'password';
      input_pass_confirmation.type = 'password';
    }
  });
});
