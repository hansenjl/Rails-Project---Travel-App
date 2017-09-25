document.addEventListener("turbolinks:load", attachListeners)

function attachListeners(){
  if ($("body")[0] === document.getElementsByClassName("sessions welcome")[0]){
    getComments()
  }
}

function getComments(){
  $.get("/comments.json", function(data){
    console.log(data)
    let commentList = ''
    for (var i = 0; i < data.length; i++) {
      commentList = commentList + formatComment(data[i])
    }
    $("#comment-scroll").html(commentList)
  })
}

function formatComment(comment){
  let username = comment["user"]["username"]
  let text = comment["text"]
  let city = comment["city"]["name"]
  return `<li><strong>${city}:</strong>
          ${username} says <em>"${text}"</em> </li><br></br>`
}

