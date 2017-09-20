function moreCountry(element) {
  var id = element.dataset.id

  $.get("/countries/" + id +".json", function(data){
    //console.log(data["cities"]["0"]["name"])
    var cities = data["cities"]
    var cityList = ""
    for (var i = 0; i < cities.length; i++) {
      cityList = cityList + "<li>" + cities[i]["name"] + "</li>"
    }
    $("#country-" + id).html(cityList)

  })

  $("#more-" + id + "-country").replaceWith(`<button id="hide-${id}-country" class="js-hide" data-id="${id}" onclick="hideCountry(this)">Hide Cities</button>`)
}

function hideCountry(element){
  var id = element.dataset.id
  $("#country-"+id).html("")
  $(`#hide-${id}-country`).replaceWith(`<button id="more-${id}-country" class="js-more" data-id="${id}" onclick="moreCountry(this)">Show Cities</button>`)
}