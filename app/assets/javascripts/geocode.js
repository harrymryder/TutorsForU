
document.addEventListener("keyup", (event) => {
 if (event.key === "Enter") {
   const searchQuery = document.getElementById("search");
   const query = searchQuery.value;
   const list = document.getElementById("results");
   fetch(`https://nominatim.openstreetmap.org/search/${query}?format=json&limit=1`)
   .then(response => response.json())
   .then((data) => {
      let lat = Number.parseFloat(data[0].lat)
      let long = Number.parseFloat(data[0].lon)
      list.insertAdjacentHTML("beforeend", `<li>Latitude: ${lat}</li>`);
      list.insertAdjacentHTML("beforeend", `<li>Longitude: ${long}</li>`);
    }
