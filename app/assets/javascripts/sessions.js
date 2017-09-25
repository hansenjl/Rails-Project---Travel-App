document.addEventListener("turbolinks:load", attachListeners)

function attachListeners(){
  if ($("body")[0] === document.getElementsByClassName("sessions welcome")[0]){
    getComments()
  }
}


function getComments(){
  $.get("/comments.json", function(data){
    let commentList = ''
    for (var i = 0; i < data.length; i++) {
      commentList = commentList + formatComment(data[i])
    }
    $('#comment-container').html(`<h2 class="center">Comments:</h2><ul id="comment-scroll" class="center list-reset">
    </ul> `)
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

