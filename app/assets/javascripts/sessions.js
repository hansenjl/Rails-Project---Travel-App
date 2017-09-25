document.addEventListener("turbolinks:load", attachListeners)

function attachListeners(){
  if ($("body")[0] === document.getElementsByClassName("sessions welcome")[0]){
    getComments
  }
}

function getComments(){
  $.get("/comments.json", function(data){

  })
}