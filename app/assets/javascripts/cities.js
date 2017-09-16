function nextCity() {
  var nextId = parseInt($(".js-next").attr("data-id")) + 1
  $.get("/cities/" + nextId + ".json", function(data){

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

    $("h3.visits").text(visitText)
    $("h3.rating").text(ratingText)
    $(".js-next").attr("data-id", data["id"])
    $(".js-previous").attr("data-id", data["id"])
  })
}



function calcRating(visits) {
  let ratingTotal = 0
  for (var i = 0; i < visits.length; i++) {
    ratingTotal += parseInt(visits[i]["city_rating"])
  }
  return ratingTotal / visits.length
}


function previousCity(){
  var prevId = parseInt($(".js-previous").attr("data-id")) - 1
  $.get("/cities/" + prevId + ".json", function(data){

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

    console.log(data)
    $("h3.visits").text(visitText)
    $("h3.rating").text(ratingText)
    $(".js-previous").attr("data-id", data["id"])
    $(".js-next").attr("data-id", data["id"])
    $(".visited-by").html()
  })
}

function attachListeners(){
  $(".js-next").click(nextCity)
  $(".js-previous").click(previousCity)
}

$(document).ready(attachListeners)