$(document).ready(function ()
{
   // The current map image layer
   var layer = null;

   // The WMS serve url
   var wms_url = "http://64.156.193.50/ecwp/ecw_wms.dll?";

   var current_map_tool = null;

   var listener = null;

   // Used to track the current marker id
   var markerId = 1;

   // Used to control the number of decimal places displayed
   var float_format = 5;

   // Used to convert degrees to radians and radians to degrees
   var degreesPerRadian = 180.0 / Math.PI;

   // The zoom level to use when a map marker is clicked
   var marker_zoom_level = 15;

   // A default zoom level
   var default_zoom = 15;

   var markup = {
      marker_count: 0,
      markers: {},
      line_count: 0,
      lines: {},
      polygon_count: 0,
      polygons: {},
      gps_point_count: 0,
      gps_points: {},
      measure_point_count: 0
   };

   markup.clear = function()
   {
      this.marker_count = 0;
      this.markers = {};
      this.line_count = 0;
      this.lines = {};
      this.polygon_count = 0;
      this.polygons = {};
      this.gps_point_count = 0;
      this.gps_points = {};
      this.measure_point_count = 0;
   };

   // Complete the page layout
   $('body').layout(
   {
      west:
      {
         onclose: function() { map.checkResize(); map.getInfoWindow().maximize(); },
         onopen: function() { map.checkResize(); map.getInfoWindow().maximize(); }
      }
   });

   /**
    * Handles change event generated when user selects a different agency
    */
   $('#agencies').change(function()
   {
      $('#agents option[value!=0]').remove();
      $('#properties option[value!=0]').remove();
      $('#imagedates option[value!=0]').remove();
      $('#imagetypes option[value!=0]').remove();
      var aid = $(this).val();
      if (aid != 0)
      {
         var data = {};
         data['aid'] = aid;
         $.get('/blueearth/get_agents/', data, function(resp)
         {
            var agents = resp;
            if (agents)
            {
               $.each(agents, function ()
               {
                  $('#agents').append('<option value="' + this.id + '">' + this.name + '</option>');
               });
            }
         });
      }
   });

   $('#agents').change(function()
   {
      var personid = $(this).val();
      if (personid != 0)
      {
         var data = {};
         data['personid'] = personid;
         $.get('/blueearth/get_properties/', data, function(resp)
         {
            var properties = resp;
            if (properties)
            {
               $.each(properties, function ()
               {
                  $('#properties').append('<option value="' + this.id + '">' + this.name + '</option>');
               });
            }
         });
      }
   });

   // Initialize the dialog box
   $('#dialog').dialog(
   {
      autoOpen: false,
      close: function(event, ui) {},
      height: 100
   });

   // Set all selects with a 0 value so 0 is selected
   $('select option[value=0]').attr('selected', 'selected');

   /**
    * Properties select list change handler.  When the selected property changes
    * the available image dates need to change
    * 2/10/2010 10:40:14 AM - added test to make sure zoom value provided from db if not uses default zoom level.
    * 2/10/2010 12:05:52 PM - added test and dialog message if selected property has no imagery.
    */
   $('#properties').change(function()
   {
      $('#imagedates option[value!=0]').remove();
      $('#imagetypes option[value!=0]').remove();
      $('#imagedates option[value=0]').attr('selected', 'selected');
      $('#imagetypes option[value=0]').attr('selected', 'selected');

      if ($(this).val() != 0)
      {
         var propid = $(this).val();

         // Update the image date list
         var data = {};
         data['propid'] = propid;
         $.get('/blueearth/get_property_image_dates/', data, function(resp)
         {
            var result = eval(resp);
            var dates = result[0];
            if (dates.length < 1)
            {
               $("#dialog").html("No images found for property.");
               $("#dialog").dialog('open');
            }
            var loc = result[1]
            center.lat = parseFloat(loc.lat);
            center.lon = parseFloat(loc.lon);
            if (loc.zoom != "None" && loc.zoom == null)
               zoom = parseInt(loc.zoom);
            else
               zoom = default_zoom;
            map.setCenter(new GLatLng(center.lat, center.lon), zoom);
            if (dates.length > 0)
            {
               $.each(dates, function()
               {
                  $('#imagedates').append('<option value="' + this + '">' + this + '</option>');
               });
            }
         });
      }
      else
      {
         if (layer != null)
            map.removeOverlay(layer);
      }
   });

   /**
    * The image data change handler.  When the image date changes the
    * image type list needs to be updates.
    */
   $('#imagedates').change(function()
   {
      $('#imagetypes option[value!=0]').remove();

      if ($(this).val() != 0)
      {
         $('#imagetypes option[value!=0]').attr("disabled", true);
         var image_date = $('#imagedates option:selected').val();
         var propid = $('#properties option:selected').val();

         if (image_date && propid)
         {
            var data = {};
            data['propid'] = propid;
            data['image_date'] = image_date;
            $.get('/blueearth/get_image_types/', data, function(resp)
            {
               var types = eval(resp);
               $.each(types, function()
               {
                  $('#imagetypes').append('<option value="' + this.id + '">' + this.name + '</option>');
               });
            });
         }
      }
   });

   /**
    * Handles the image type select list change event
    */
   $('#imagetypes').change(function()
   {
      if ($(this).val() != 0)
      {
         var propid = $('#properties option:selected').val();
         var image_date = $('#imagedates option:selected').val();
         var image_type = $(this).val();


         var data = {};
         data['propid'] = propid;
         data['image_date'] = image_date;
         data['image_type'] = image_type;
         $.get('/blueearth/get_image/', data, function(resp)
         {
            var layer = resp;
            if (layer != null && layer.length > 0)
            {
               showLayer(layer);
            }
         });
      }
      else
      {
         if (layer)
            map.removeOverlay(layer);
      }
   });

   $('.markup_tool').click(function()
   {
      $('.markup_tool').removeClass('selected');
      $(this).toggleClass('selected');
      if (listener != null)
         GEvent.removeListener(listener);

      if (this.id == 'measure')
      {
         listener = GEvent.addListener(map, 'mouseover', function(overlay, latlng)
         {
            var color = 'red';
            var line = new GPolyline([], color);
            map.addOverlay(line);
            line.enableDrawing({});
            GEvent.addListener(line, "endline", function()
            {
               GEvent.removeListener(listener);
               map.getDragObject().setDraggableCursor('default');
               $('#distance_units').data('distance', line.getLength().toFixed(float_format));
               var length = computeDistanceUnits(line.getLength(), $('#distance_units').val());
               $('#length').html(length);
               $('.markup_tool').removeClass('selected');
            });
         });
      }
      else if (this.id == 'addpoint')
      {
         map.getDragObject().setDraggableCursor('crosshair');
         listener = GEvent.addListener(map, 'click', function(overlay, latlng)
         {
            var marker = new GMarker(latlng, {draggable:true});
            markup.marker_count++;
            marker.enableDragging();
            marker.id = "marker" + markup.marker_count;
            markup.markers["marker" + markup.marker_count] = marker;
            GEvent.addListener(marker, 'click', function(latlng)
            {
               map.setCenter(latlng);
            });

            GEvent.addListener(marker, 'dragend', function(latlng)
            {
               $('#lon').html(latlng.lng().toFixed(float_format));
               $('#lat').html(latlng.lat().toFixed(float_format));
            });

            // Get the points elevation
            get_elevation(latlng.lng(), latlng.lat());

            map.addOverlay(marker);
            map.getDragObject().setDraggableCursor('default');
            GEvent.removeListener(listener);

            var html = '<tr id="marker' + markup.marker_count + '">' +
                       '<td>' + markup.marker_count + '</td>' +
                       '<td>Marker</td>' +
                       '<td id="descr' + marker.id + '">' + latlng.lng().toFixed(float_format) + ',' + latlng.lat().toFixed(float_format) + '</td>' +
                       '<td><input value="marker' + markup.marker_count + '" onclick="delete_markup_point(this);" type="image" src="' +
                       static_media + '/images/remove-16x16.png">' + '</td></tr>';

            $("#markup_table tbody").append(html);
            $("#markup_table").trigger("update");
            $('.markup_tool').removeClass('selected');

         });
      }
      else if (this.id == 'clearmarkup')
      {
         markup.clear();
         map.clearOverlays();
         // TODO: could change all of this to a jquery loop using class
         $('#length').html('&nbsp;');
         $('#area').html('&nbsp;');
         $('#bearing').html('&nbsp;');
         $('#distance').html('&nbsp;');
         $('#perimeter').html('&nbsp;');
         $('#elevation').html('&nbsp;');
         $('#markup_console').html('');
         current_map_tool = null;
      }
      else if (this.id == 'addline')
      {
         // TODO: move colors and line types to config file in javascript or db for all markup tools and gps tools
         var color = '#400040';
         var line = new GPolyline([], color);

         startdrawing(line, "line", function(){});
         listener = GEvent.addListener(map, 'mousemove', function(latlng)
         {
            if (line.getVertexCount() > 0)
            {
               var last_vertex = line.getVertex(line.getVertexCount() - 1);
               $('#bearing').html(bearing(last_vertex, latlng));

               var dist = distance(last_vertex, latlng);
               dist = computeDistanceUnits(dist, $('#distance_units').val());
               $('#distance').html(dist);
            }
         });
         current_map_tool = null;
      }
      else if (this.id == 'addpolygon')
      {
         //var color = '#400040';
         var color = '#ff0000';
         var polygon = new GPolygon([], color, 2, 0.7, color, 0.2);
         startdrawing(polygon, "polygon", function(){});
         listener = GEvent.addListener(map, 'mousemove', function(latlng)
         {
            if (polygon.getVertexCount() > 0)
            {
               var last_vertex = polygon.getVertex(polygon.getVertexCount() - 1);
               $('#bearing').html(bearing(last_vertex, latlng));

               var dist = distance(last_vertex, latlng);
               dist = computeDistanceUnits(dist, $('#distance_units').val());
               $('#distance').html(dist);
            }
         });
         current_map_tool = null;
      }
      else if (this.id == 'add_gps_point')
      {
         map.getDragObject().setDraggableCursor('crosshair');
         if (listener != null)
            GEvent.removeListener(listener);
         listener = GEvent.addListener(map, 'click', function(overlay, latlng)
         {
               marker = createGPSMarker(latlng, markerId);
               marker.id = markerId;
               GEvent.addListener(marker, 'dragend', function(latlng)
               {
                  $('#lon').html(latlng.lng().toFixed(float_format));
                  $('#lat').html(latlng.lat().toFixed(float_format));
               });
               map.addOverlay(marker);
               get_elevation(latlng.lng(), latlng.lat());
               map.getDragObject().setDraggableCursor('default');
               GEvent.removeListener(listener);
               $('#add_gps_point').toggleClass('selected');

               var html = '<tr id="gpsmarker' + markerId + '">' +
                           '<td>' + markerId + '</td>' +
                           '<td>GPS</td>' +
                           '<td id="descr' + markerId + '">' + latlng.lat().toFixed(float_format) + ', ' + latlng.lng().toFixed(float_format) + '</td>' +
                           '<td><input value="gpsmarker' + markerId + '" type="image" src="' + static_media + '/images/remove-16x16.png" onclick="delete_gps_marker(this);"></td>' +
                           '</tr>';
               $('#markup_table tbody').append(html);
               markup.gps_points["gpsmarker" + markerId] = marker;
               markup.gps_point_count++;
               markerId++;
         });
      }
      else
      {
         current_map_tool = this.id;
      }
   });

   $('#clear_all_markup').click(function()
   {
      if (markup.marker_count > 0 || markup.line_count > 0 || markup.polygon_count > 0 || markup.gps_point_count > 0)
      {

         // Confirm deletion of all markup first
         var answer = confirm("Are you sure you would like to delete all your markups?");
         if (answer)
         {
            markup.clear();
            map.clearOverlays();
            $('#markup_table tr').each(function()
            {
               $(this).remove();
            });
            $('#markup_table').trigger('update');
            $('#length').html('&nbsp;');
            $('#area').html('&nbsp;');
            $('#bearing').html('&nbsp;');
            $('#distance').html('&nbsp;');
            $('#perimeter').html('&nbsp;');
            $('#elevation').html('&nbsp;');
            $('#markup_console').html('');
         }
      }
      else
      {
         alert("Sorry!.  No markup to clear.", "Blue Earth Imaging");
      }
   });

   $('#exportlink').click(function()
   {
      var data = {};
      data.zoom = map.getZoom();
      var center = map.getCenter();
      data.lat = center.lat();
      data.lon = center.lng();
      if  (layer != null)
         data.layer = layer;
      else
         data.layer = '';

      $("#dialog").html("retrieving link...");
      $.get('/blueearth/get_map_link/', data, function(response)
      {
         $("#dialog").html(response);
      }, 'text');
      $("#dialog").dialog('open');
   });

   $('#export_gps').click(function()
   {
      var export_type = $('#exportType option:selected').val();
      if (export_type == 'kml' && markup.gps_point_count > 0)
      {
         var data = {};
         var points = '';
         var cnt = 1;
         for (var p in markup.gps_points)
         {
            var pt = markup.gps_points[p];
            if (cnt < markup.gps_point_count)
               points += '' + p + ', ' + pt.getLatLng().lng() + ',' + pt.getLatLng().lat() + '|';
            else
               points += '' + p + ', ' + pt.getLatLng().lng() + ',' + pt.getLatLng().lat() + '';
            cnt++;
         }
         window.location = "/blueearth/export_gps_points?points=" + points;
         return true;
      }
      else if (export_type == 'shp' && markup.gps_point_count > 0)
      {
         var data = {};
         var points = '';
         var cnt = 1;
         var url = static_media + 'temp/';
         var file_path = null;
         for (var p in markup.gps_points)
         {
            var pt = markup.gps_points[p];
            if (cnt < markup.gps_point_count)
               points += '' + p + ', ' + pt.getLatLng().lng() + ',' + pt.getLatLng().lat() + '|';
            else
               points += '' + p + ', ' + pt.getLatLng().lng() + ',' + pt.getLatLng().lat() + '';
            cnt++;
         }
         data.points = points;
         $.get("/blueearth/export_to_shapefile/", data, function(response)
         {
            window.location = url + response;
         }, "text");
         return false;
      }
      else if (export_type == null || export_type === undefined || export_type == 0)
      {
         alert("Sorry!  No export type selected.");
         return false;
      }
      else if (markup.gps_point_count < 1)
      {
         alert("Sorry! No points to export.");
         return false;
      }
   });

   /**
    * Helper functions
    */

   /**
    * Displays an IWS layer on the map.
    * This function is dependent on the wmd236.js library
    */
   function showLayer(lname)
   {
      if (layer != null)
      {
         map.removeOverlay(layer);
      }

      var tile = new GTileLayer(new GCopyrightCollection(""),0, 23);
      tile.myLayers = 'images_' + lname;
      tile.myMercZoomLevel = map.getZoom();
      tile.myFormat = 'image/png';
      tile.myBaseURL = wms_url;
      tile.getTileUrl = CustomGetTileUrl;
      tile.getOpacity = function() {return 1.0;}
      layer = new GTileLayerOverlay(tile);
      map.addOverlay(layer);
   }

   function delete_markup_point(item)
   {
      map.removeOverlay(markup.markers[item.value]);
      $('#' + item.value).remove();
      $('#markup_table').trigger('update');
      delete markup.markers[item.value];
   };

   function delete_markup_line(item)
   {
      map.removeOverlay(markup.lines[item.value]);
      $('#' + item.value).remove();
      $('#markup_table').trigger('update');
      delete markup.lines[item.value];
   };

   function delete_markup_polygon(item)
   {
      map.removeOverlay(markup.polygons[item.value]);
      $('#' + item.value).remove();
      $('#markup_table').trigger('update');
      delete markup.polygons[item.value];
   };

   function delete_gps_marker(item)
   {
      map.removeOverlay(markup.gps_points[item.value]);
      $('#' + item.value).remove();
      $('#markup_table').trigger('update');
      delete markup.gps_points[item.value];
   }

   /**
    * Converts from google maps meters to differenct distance unit
    */
   function computeDistanceUnits(length, idx)
   {
      if(idx == 0) { length = (3.2808399  * length).toFixed(0) + " ft"}
      else if(idx == 1) { length = (1.0936133  * length).toFixed(1) + " yd"}
      else if(idx == 2) { length = (0.000621371192  * length).toFixed(4) + " mi"}
      else if(idx == 3) { length = (0.000539956803 * length).toFixed(4) + " nm"}
      else if(idx == 4) { length = (1 * length).toFixed(1) + " m"}
      else if(idx == 5) { length = (0.001 * length).toFixed(4) + " km"}
      return length;
   }

   function computeAreaUnits(area, idx)
   {
      if(idx == 0) { area = (.00024710538 * area).toFixed(2) + " acres"}
      else if(idx == 1) { area = (10.7639104 * area).toFixed(0) + " sq ft"}
      else if(idx == 2) { area = (1.19599005 * area).toFixed(0) + " sq yd"}
      else if(idx == 3) { area = (3.86102159e-7 * area).toFixed(4) + " sq mi"}
      else if(idx == 4) { area = (2.9155335e-7 * area).toFixed(4) + " sq nm"}
      else if(idx == 5) { area = (1 * area).toFixed(0) + " sq m"}
      else if(idx == 6) { area = (1e-6 * area).toFixed(3) + " sq km"}
      else if(idx == 7) { area = (.0001 * area).toFixed(2) + " ha"}
      return area;
   }

   function bearing(from, to)
   {
      // Convert to radians.
      var lat1 = from.latRadians();
      var lon1 = from.lngRadians();
      var lat2 = to.latRadians();
      var lon2 = to.lngRadians();

      // Compute the angle.
      var angle = - Math.atan2( Math.sin( lon1 - lon2 ) * Math.cos( lat2 ), Math.cos( lat1 ) * Math.sin( lat2 ) - Math.sin( lat1 ) * Math.cos( lat2 ) * Math.cos( lon1 - lon2 ) );
      if ( angle < 0.0 ) angle  += Math.PI * 2.0;

      // And convert result to degrees.
      angle = angle * degreesPerRadian;
      var Direction = " N"
      if (angle < 22.5) {Direction = " N"}
      else if (angle <67.5) {Direction = " NE"}
      else if (angle <112.5) {Direction = " E"}
      else if (angle <157.5) {Direction = " SE"}
      else if (angle <202.5) {Direction = " S"}
      else if (angle <247.5) {Direction = " SW"}
      else if (angle <292.5) {Direction = " W"}
      else if (angle <337.5) {Direction = " NW"}
      angle = angle.toFixed(1) + Direction;
      return angle;
   }

   function distance(from, to)
   {
      var d=from.distanceFrom(to);
      return d;
   };

   function perimeter(polygon)
   {
      var perim = 0;
      for (var i = 0; i < polygon.getVertexCount(); i++)
      {
         if (i > 0)
            perim += distance(polygon.getVertex(i-1),polygon.getVertex(i));
      }

      return perim;
   }

   /**
    * Uses a call to the USGS's http://gisdata.usgs.net/xmlwebservices2/elevation_service.asmx?WSDL
    * web service to get an elevation at a lat-lon location.
    * @param lon the longitude (x-value)
    * @param lat the latitude (y-value)
    */
   function get_elevation(lon, lat)
   {
      var data = {'lon':lon, 'lat':lat};
      $.get('/blueearth/get_elevation/', data, function(response)
      {
         var elev = parseFloat(response).toFixed(float_format);
         $('#elevation').html(elev);
      }, 'text');
   }

   /**
    * Adds a new gps marker to the map and the gps marker console
    */
   function createGPSMarker(latlng, markerId)
   {
      // Set up our GMarkerOptions object literal
      var tinyIcon = new GIcon();
      tinyIcon.image = static_media + '/images/map_markers/darkblue' + parseInt(markerId) + '.gif';
      tinyIcon.iconSize = new GSize(12, 20);
      tinyIcon.shadowSize = new GSize(22, 20);
      // The GPoint icon x,y parameters are based on the icon image being used.
      tinyIcon.iconAnchor = new GPoint(0,20);
      tinyIcon.infoWindowAnchor = new GPoint(5, 1);

      // TODO: change to this if want draggable, but gps console needs to be reprogrammed to update latlon
      // markerOptions = { icon:tinyIcon, draggable:true };
      markerOptions = {icon:tinyIcon,draggable:true};
      var mrkr = new GMarker(latlng, markerOptions);
      mrkr.enableDragging();
      GEvent.addListener(mrkr, "click", function()
      {
         var html = "<br/><table style='font-size: 0.90em;'>" +
         "<tr><td>Description:</td><td><input type='text' id='name'/></td></tr>" +
         "<tr><td>&nbsp;</td><td><input type='button' value='Save & Close' onclick='saveData();'/></td></tr>" +
         "</table>";
         mrkr.openInfoWindow(html);
      });
      return mrkr;
   };

   /**
    * TODO: Need to refactor this
    */
   function startdrawing(poly, poly_type, onupdate)
   {
      map.addOverlay(poly);
      //poly.enableDrawing(options);
      poly.enableDrawing();
      poly.enableEditing({onEvent: "mouseover"});
      poly.disableEditing({onEvent: "mouseout"});
      endListener = GEvent.addListener(poly, "endline", function(point)
      {
         $('.maptool').removeClass('selected');
         if (poly_type == "line")
         {
            var length = computeDistanceUnits(poly.getLength(), $('#distance_units').val());
            $('#length').html(length);

            markup.line_count++;
            poly.id = 'line' + markup.line_count
            markup.lines['line' + markup.line_count] = poly;

            GEvent.addListener(poly, 'lineupdated', function()
            {
               var length = computeDistanceUnits(poly.getLength(), $('#distance_units').val());
               length = length.toFixed(float_format)
               $('#length').html(length);
               //$('#descr' + poly.id).html(length);
            });

            var html = '<tr id="line' + markup.line_count + '">' +
                       '<td>' + markup.line_count + '</td>' +
                       '<td>Line</td>' +
                       '<td id="descr' + poly.id + '">' + length + '</td>' +
                       '<td><input value="line' + markup.line_count + '" type="image" src="' + static_media + '/images/remove-16x16.png"' +
                       'onclick="delete_markup_line(this);"></td>'
                       '</tr>';
            $("#markup_table tbody").append(html);
            $("#markup_table").trigger("update");
            GEvent.removeListener(listener);
         }
         else if (poly_type == "polygon")
         {
            var area = computeAreaUnits(poly.getArea(), $('#area_units').val());
            $('#area').html(area);

            var perim = perimeter(poly);
            perim = computeDistanceUnits(perim, $('#distance_units').val());
            $('#perimeter').html(perim);

            markup.polygon_count++;
            poly.id = 'polygon' + markup.polygon_count;
            markup.polygons['polygon' + markup.polygon_count] = poly;
            var html = '<tr id="polygon' + markup.polygon_count + '">' +
                       '<td>' + markup.polygon_count + '</td>' +
                       '<td id="descr' + poly.id + '">Polygon</td>' +
                       '<td>' + perim + '</td>' +
                       '<td><input value="polygon' + markup.polygon_count + '" type="image" src="' + static_media + '/images/remove-16x16.png"' +
                       'onclick="delete_markup_polygon(this);"></td>' +
                       '</tr>';
            $('#markup_table').append(html);

            GEvent.addListener(poly, 'lineupdated', function()
            {
               var perim = perimeter(poly);
               perim = computeDistanceUnits(perim, $('#distance_units').val());
               $('#perimeter').html(perim);

               var area = computeAreaUnits(poly.getArea(), $('#area_units').val());
               $('#area').html(area);
            });

            GEvent.removeListener(listener);
            GEvent.removeListener(endListener);
            poly.disableEditing();
         }
      });
   }

});
