//
//
//
//
// Modularity is King //

function createMap(earthquakeLayer) {
    let myTile = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    });

    let leaf = L.map("map", {
        center: [39.74, -104.99],
        zoom: 12,
        layers: [myTile, earthquakeLayer]
    });

    // Layer Control //
    L.control.layers({
//        "The Earth": myTile,
        "Quakes": earthquakeLayer
    }, {}, {
        collapsed: false
    }).addTo(leaf);
}

function createMarkers(response) {
    // Initialize an array to hold data for restaraunts and hotels.
    let place_data = [];

    // Loop through the features array.
    for (let index = 0; index < response.length; index++) {
        let place_name = response[index][1];
        let lat = response[index][10];
        let long = response[index][11];
        let rating = response[index][8];
        
        // For each earthquake, create a marker, and bind a popup with the earthquake's location.
        let place_marker = L.circleMarker([lat, long], {
            opacity: 0.5,
            weight: 1
        })
          .bindPopup("<h3>" + place_name + "</h3><br>" + "Rating:" + rating );

        // Add the marker to the earthquakeMarkers array.
        place_data.push(place_marker);

    }
    // Create a layer group that's made from the earthquakeMarkers array, and pass it to the createMap function.
    createMap(L.layerGroup(place_data));
}

d3.json("http://127.0.0.1:5001/restaurants").then(createMarkers);