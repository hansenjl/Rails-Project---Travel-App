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


}
