<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Bryan's Map</title>
  <style>
    #map{
      height:400px;
      width:100%;
    }
  </style>
</head>
<body>
  <h1>Detroit Google Map</h1>
  <div id="map"></div>
  <script>
    function initMap(){
      // Map options
      var options = {
        zoom:7,
        center:{lat:42.5803,lng:-83.0302}
      }

      // New map
      var map = new google.maps.Map(document.getElementById('map'), options);

      // Listen for click on map
      google.maps.event.addListener(map, 'click', function(event){
        // Add marker
        addMarker({coords:event.latLng});
      });


      // Add marker
      var marker = new google.maps.Marker({
        position:{lat:42.5803,lng:-83.0302},
        map:map,
        icon:'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png'
      });

      var infoWindow = new google.maps.InfoWindow({
        content:'<h1>My Hometown: Sterling Heights MI</h1>'
      });
    //function that runs when clicking on the beachflag
      marker.addListener('click', function(){
        infoWindow.open(map, marker);
      });


      // Array of markers
      var markers = [
        {
          coords:{lat:42.5803,lng:-83.0302},
          iconImage:'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
          content:'<h1>My Hometown: Sterling Heights MI</h1>'
        },
        {
          coords:{lat:42.6679,lng:-83.2082},
          content:'<h1>My Alma Mater: Oakland University</h1>'
        },
        {
          coords:{lat:42.4653,lng:-83.2150},
          content:'<h1>St. Thomas Syro Malabar Church Detroit</h1>'
        },
        {
          coords:{lat:41.5038,lng:-81.6389},
          content:'<h1>Tech Elevator</h1>'
        }
      ];

      // Loop through markers
      for(var i = 0;i < markers.length;i++){
        // Add marker
        addMarker(markers[i]);
      }

      // Add Marker Function
      function addMarker(props){
        var marker = new google.maps.Marker({
          position:props.coords,
          map:map,
          //icon:props.iconImage
        });

        // Check for customicon
        if(props.iconImage){
          // Set icon image
          marker.setIcon(props.iconImage);
        }

        // Check content
        if(props.content){
          var infoWindow = new google.maps.InfoWindow({
            content:props.content
          });

          marker.addListener('click', function(){
            infoWindow.open(map, marker);
          });
        }
      }
    }
  </script>
  <script async defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBfiJV1mUX_oCwYRMQNtIb_Y7Tim4IygY8&callback=initMap">
    </script>
</body>
</html>
