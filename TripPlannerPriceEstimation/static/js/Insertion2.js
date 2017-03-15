
var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name'
      };
function addRow(tableID) {

	var table = document.getElementById(tableID);

	var rowCount = table.rows.length;

	var newSerial = parseInt(document.getElementById(tableID).rows[rowCount - 1].cells
			.item(2).childNodes[0].value) + 1;

	var row = table.insertRow(rowCount);

	var len = (table.rows.length) - 1;

	var cell1 = row.insertCell(0);
	var element1 = document.createElement("input");
	element1.type = "checkbox";
	element1.name = "chk[" + newSerial + "]";
	
		
	cell1.appendChild(element1);

	var cell2 = row.insertCell(1);

	var element2 = document.createElement("input");
	element2.type = "text";
	element2.setAttribute("class","directions-route-stop");
	element2.name = "location[" + newSerial + "]";
	element2.id = "location[" + newSerial + "]";
	cell2.appendChild(element2);

	var cell3 = row.insertCell(2);
	var element3 = document.createElement("input");
	element3.type = "hidden";//"hidden";kept text for testing purpose
	element3.name = newSerial;
	element3.value = newSerial;
	cell3.appendChild(element3);
	
	var cell4 = row.insertCell(3);
	var element4 = document.createElement("input");
	element4.type = "hidden";//"hidden";kept text for testing purpose
	element4.id="mid"+newSerial+"_street_number";
	cell4.appendChild(element4);
	
	
	var cell5 = row.insertCell(4);
	var element5 = document.createElement("input");
	element5.type = "hidden";//"hidden";kept text for testing purpose
	element5.id="mid"+newSerial+"_route";
	cell5.appendChild(element5);
	
	var cell6 = row.insertCell(5);
	var element6 = document.createElement("input");
	element6.type = "hidden";//"hidden";kept text for testing purpose
	element6.id="mid"+newSerial+"_locality";
	element6.name="mid"+newSerial+"_city";
	cell6.appendChild(element6);
	
	var cell7 = row.insertCell(6);
	var element7 = document.createElement("input");
	element7.type = "hidden";//"hidden";kept text for testing purpose
	element7.id="mid"+newSerial+"_administrative_area_level_1";
	element7.name="mid"+newSerial+"_state";
	cell7.appendChild(element7);
	
	var cell8 = row.insertCell(7);
	var element8 = document.createElement("input");
	element8.type = "hidden";//"hidden";kept text for testing purpose
	element8.id="mid"+newSerial+"_postal_code";
	element8.name="mid"+newSerial+"_zip";
	cell8.appendChild(element8);
	
	var cell9 = row.insertCell(8);
	var element9 = document.createElement("input");
	element9.type = "hidden";//"hidden";kept text for testing purpose
	element9.id="mid"+newSerial+"_country";
	element9.name="mid"+newSerial+"_country";
	cell9.appendChild(element9);
	
	var cell10 = row.insertCell(9);
	var element10 = document.createElement("input");
	element10.type = "hidden";//"hidden";kept text for testing purpose
	element10.id="mid"+newSerial+"_address";
	element10.name="mid"+newSerial+"_address";
	cell10.appendChild(element10);
	
	
	var cell11 = row.insertCell(10);
	var element11 = document.createElement("input");
	element11.type = "hidden";//"hidden";kept text for testing purpose
	element11.id="mid"+newSerial+"_lat";
	element11.name="mid"+newSerial+"_lat";
	cell11.appendChild(element11);
	
	var cell12 = row.insertCell(11);
	var element12 = document.createElement("input");
	element12.type = "hidden";//"hidden";kept text for testing purpose
	element12.id="mid"+newSerial+"_long";
	element12.name="mid"+newSerial+"_long";
	cell12.appendChild(element12);
	
	
	
	
	var mid = document.getElementById("location[" + newSerial + "]");
	var automid = new google.maps.places.Autocomplete(mid);

	automid.bindTo('bounds', map);

	gmarkers[newSerial] = new google.maps.Marker({
		map : map,
		anchorPoint : new google.maps.Point(0, -29)
	});
	automid.addListener('place_changed', function() {
		var place = automid.getPlace();
		
		if (place.geometry.viewport) {
			map.fitBounds(place.geometry.viewport);
		} else {
			map.setCenter(place.geometry.location);
			map.setZoom(17); // Why 17? Because it looks good.
		}
		//window.alert("hi" + place.geometry.location);
		for (var component in componentForm) {
	          document.getElementById('mid'+newSerial+'_'+component).value = '';
	          document.getElementById('mid'+newSerial+'_'+component).disabled = false;
	        }
		mstr=''
			mflag=0

       for (var i = 0; i < place.address_components.length; i++) {
        var addressType = place.address_components[i].types[0];
        if (componentForm[addressType]) {
          var val = place.address_components[i][componentForm[addressType]];
          document.getElementById('mid'+newSerial+'_'+addressType).value = val;
          if(addressType=='street_number')
			{
			mstr=mstr+val
			mflag=1
			}
		if(addressType=='route')
			{
			    if(mflag==1)
			     	mstr=mstr+" "+val
				else
					mstr=mstr+val
			}
        }
      }
		document.getElementById('mid'+newSerial+'_address').value = mstr;
       gmarkers[newSerial].setPosition(place.geometry.location);
   	document.getElementById('mid'+newSerial+'_lat').value=gmarkers[newSerial].position.lat();
	document.getElementById('mid'+newSerial+'_long').value=gmarkers[newSerial].position.lng();
	
		loc = new google.maps.LatLng(gmarkers[newSerial].position.lat(),gmarkers[newSerial].position.lng());
		if(typeof(Storage) !== "undefined" ) {
			var waypts=JSON.parse(sessionStorage.getItem('waypts'));
			waypts.push(loc);
			sessionStorage.setItem('waypts',JSON.stringify(waypts));
			
			}
		bounds.extend(loc);
		//window.alert("No details available for input: '" + place.geometry.location.LatLng + "'");
		gmarkers[newSerial].setVisible(true);
		map.fitBounds(bounds);      
		map.panToBounds(bounds); 
	});
	var elem = document.getElementById("encryptedstring");
	var orig = elem.getAttribute("value");
	elem.setAttribute("value", orig.concat(newSerial + ","));

}

function deleteRow(tableID) {
	try {
		var table = document.getElementById(tableID);
		var rowCount = table.rows.length;
		for (var i = 0; i < rowCount; i++) {
			var row = table.rows[i];
			var chkbox = row.cells[0].childNodes[0];
			if (null != chkbox && true == chkbox.checked) {

				var elem = document.getElementById("encryptedstring");
				var orig = elem.getAttribute("value");
				var del = row.cells.item(2).childNodes[0].value;
				gmarkers[del].setMap(null);
				elem.setAttribute("value", orig.replace("," + del, ""));
				table.deleteRow(i);
				rowCount--;
				i--;
			}

		}
	} catch (e) {
		alert(e);
	}
}
