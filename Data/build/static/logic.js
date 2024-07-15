// Modularity is King //
var restaurantsPath = "http://127.0.0.1:5001/restaurants";
var greenPath = "http://127.0.0.1:5001/green";
var hotelsPath = "http://127.0.0.1:5001/hotels";

// Create an array to hold the layer groups
let layerGroups = [];

// Load restaurants data
d3.json(restaurantsPath).then(response => {
  let restaurantsLayer = createMarkers(response, "Restaurants");
  layerGroups.push(restaurantsLayer);
  // Load green data after restaurants data is loaded
  d3.json(greenPath).then(response => {
    let greenLayer = createMarkers(response, "Green");
    layerGroups.push(greenLayer);
    // Load hotels data after green data is loaded
    d3.json(hotelsPath).then(response => {
      let hotelsLayer = createMarkers(response, "Hotels");
      layerGroups.push(hotelsLayer);
      // Create the map with all layers
      createMap(layerGroups);
    });
  });
});

function createMap(layerGroups) {
  let myTile = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  });

  let leaf = L.map("map", {
    center: [39.74, -104.99],
    zoom: 12,
    layers: [myTile].concat(layerGroups)
  });

  L.control.layers({
    "The Earth": myTile
  }, {
    "Restaurants": layerGroups[0],
    "Dispensaries": layerGroups[1],
    "Hotels": layerGroups[2]
  }, {
    collapsed: false
  }).addTo(leaf);
}

function createMarkers(response, layerName) {
  // Initialize an array to hold data for restaurants and hotels.
  let place_data = [];

  // Define custom icons for each layer
  const icons = {
    Restaurants: L.divIcon({
      html: '<i class="fas fa-utensils custom-icon custom-icon-restaurant"></i>',
      className: '',
      iconSize: [30, 30]
    }),
    Green: L.divIcon({
      html: '<i class="fas fa-leaf custom-icon custom-icon-green"></i>',
      className: '',
      iconSize: [30, 30]
    }),
    Hotels: L.divIcon({
      html: '<i class="fas fa-bed custom-icon custom-icon-hotel"></i>',
      className: '',
      iconSize: [30, 30]
    })
  };

  // Loop through the features array.
  for (let index = 0; index < response.length; index++) {
    let place_name = response[index][1];
    let lat = response[index][10];
    let long = response[index][11];
    let rating = response[index][8];

    // Define marker options based on layer name
    let markerOptions = {
      icon: icons[layerName]
    };

    // Create a marker, and bind a popup with the place's location.
    let place_marker = L.marker([lat, long], markerOptions)
      .bindPopup(`<h3>${place_name}</h3><br>Rating: ${rating}`)
      .on('mouseover', function (e) {
        this.openPopup();
      })
      .on('mouseout', function (e) {
        this.closePopup();
      });

    // Add the marker to the placeMarkers array.
    place_data.push(place_marker);
  }
  // Create a layer group that's made from the placeMarkers array
  return L.layerGroup(place_data);
}