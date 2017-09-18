function nextCity() {
  var nextId = parseInt($(".js-next").attr("data-id")) + 1
  updateView(nextId)
}

function previousCity(){
  var prevId = parseInt($(".js-previous").attr("data-id")) - 1
  updateView(prevId)
}

function updateView(showId){
  $.get("/cities/" + showId + ".json", function(data){

    $("h1").text(data["name"]+ ", " + data["country"]["name"])
    var visits = data["visits"]
    var visitText = "Visited 0 times"
    var ratingText = "Rating: N/A"
    if(visits.length === 1){
      visitText = "Visited 1 time"
      ratingText = "Overall Rating: " + visits[0]["city_rating"]
    } else if (visits.length > 1){
      visitText = "Visited " + visits.length +" times"
      ratingText = "Overall Rating: " + calcRating(visits)
    }

    var userVisitText = formatUserVisits(visits, data["users"])


    var commentList = formatCommentList(data["comments"])

    $("h3.visits").text(visitText)
    $("h3.rating").text(ratingText)
    $(".js-previous").attr("data-id", data["id"])
    $(".js-next").attr("data-id", data["id"])
    $(".visited-by").html(userVisitText)
    $("#comments").html(commentList)
    $("#city-field").html(`<input value="${data["id"]}" type="hidden" name="comment[city_id]" id="comment_city_id">`)

  })
}

function formatCommentList(comments){
  let commentText = ""
  for (var i = 0; i < comments.length; i++) {
    commentText += "<li><strong>" + comments[i]["user"]["username"] + ": </strong>" + comments[i]["text"] + "</li>"
  }
  return commentText
}

function calcRating(visits) {
  let ratingTotal = 0
  for (var i = 0; i < visits.length; i++) {
    ratingTotal += parseInt(visits[i]["city_rating"])
  }
  return ratingTotal / visits.length
}

function formatUserVisits(visits, users){
  var userVisitString = ""
  for (var i = 0; i < visits.length; i++) {
    if(visits[i]["avatar_url"].includes("default")){
      userVisitString += '<img src="' + '/assets/' + visits[i]["avatar_url"] + '">' + '<li>' + users[i]["username"]  +' rates it ' + visits[i]["city_rating"]  + ' out of 5 stars</li>'
    } else {
    userVisitString += '<img src="' + visits[i]["avatar_url"] + '">' + '<li>' + users[i]["username"]  +' rates it ' + visits[i]["city_rating"]  + ' out of 5 stars</li>'
    }
  }
  return userVisitString
}

function attachListeners(){
  if ($("body")[0] === document.getElementsByClassName("cities show")[0]){


    $(".js-next").click(nextCity)
    $(".js-previous").click(previousCity)
    $('form').submit(function(event){
      event.preventDefault()
      createComment(this)
    })
  }
}

function createComment(element){
  var values = $(element).serialize()
  var posting = $.post('/comments', values)

  posting.done(function(data){
    var username = data["user"]["username"]
    var text = data["text"]

    var comment = `<li><strong>${username}: </strong>${text}</li>`
    $("#comments").append(comment)
    $("#submit").disabled = false
  })


  //need to reset submit button
}


document.addEventListener("turbolinks:load", attachListeners)