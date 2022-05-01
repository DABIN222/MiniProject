<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDPgIN5Syyjc1Trf4yDdSfh58Jac_6PfLw&callback=initMap"></script>
<style>
#gmap {
	width: 80%;
	height: 700px;
	border: 1px solid gray;
	margin: 20px auto;
	padding: 20px;
}

#mapSearch {
	margin: 20px auto;
	text-align: center;
}

#mapSearch input {
	margin: 5px auto;
	box-sizing: border-box;
	padding: 12px;
}

#geoSearch {
	width: 100px;
}

#address {
	width: 50%;
}
</style>
<div id="mapSearch">
	<input type="text" id="address" placeholder="주소를 입력하세요" /> <input
		type="button" value="Search" id="geoSearch" onclick="geocodeAddress()" />
</div>

<!-- 지명 또는건물을 입력하기 위한폼 -->
<div id="gmap"></div>
<div id="map-canvas"></div>
<script>
	//구글맵
	function geocodeAddress() {
		var address = document.getElementById('address');
		if (address.value == '') {
			alert("검색어를 입력하세요");
			address.value = "";
			address.focus();
			return false;
		}
		setMapPosition(address.value, "http://www.eclipse.org", "5.jpg");
	}

	var latitude;
	var longitude;

	var addr;
	var homePage;
	var popImg;

	function mapReset() {
		latitude = 37.5729503;
		longitude = 126.97935778;

		addr = [ '서울 선유도', '서울 뚝섬', '서울 시청', '서울 잠실종합운동장' ];

	}

	var map;
	function initMap() {
		mapReset();

		var mapProperties = {
			center : new google.maps.LatLng(latitude, longitude),
			zoom : 16,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}

		map = new google.maps.Map(document.getElementById("gmap"),
				mapProperties);

		//	GeoCoder : 지명과 건물등의 명칭을 이용하여 지도의 위도 경도를 구할 수 있다.
		geoCoder = new google.maps.Geocoder();

		for (var i = 0; i < addr.length; i++) {
			//					지명,		홈페이지주소, 해당이미지
			setMapPosition(addr[i])
		}
	}
	//	initMap
	function setMapPosition(addr2, home2, pop2) {
		//	마커를 표시할 주소		변수 2개 : 주소를 이요한 정보들	,처리결과 "OK"주소가 존재한다.
		geoCoder.geocode({
			'address' : addr2
		}, function(results, status) {
			if (status == 'OK') {//	주소가 존재할 때
				console.log(results);
				//	지도의 가운데 위치를 새로 셋팅
				map.setCenter(results[0].geometry.location);
				//map.setCenter(results[0]['geometry']['location']);

				//	마커표시
				var marker = new google.maps.Marker({
					map : map,
					icon : "../img/팥mimi.png",
					title : results[0].formatted_address, //	주소
					position : results[0].geometry.location
				//	마커를 표시할 위치
				});

				//	위도, 경도, 주소, 이미지, 이미지링크걸기
				var la = results[0]['geometry']['location']['lat'](); //위도
				var lo = results[0]['geometry']['location']['lng'](); //경도

				var popMsg = "위도 : " + la;
				popMsg += "<br/>경도 : " + lo;
				popMsg += "<br/>주소 : " + results[0].formatted_address;
				/* popMsg += "<br/><a href='"+ home2 + "'><img src='../../img/"+ pop2 +"' width='100' height='50'/></a>";
				 */
				var info = new google.maps.InfoWindow({
					content : popMsg
				});

				//	이벤트에 의하여 대화상자 보여지도록 설정
				google.maps.event.addListener(marker, 'click', function() {
					info.open(map, marker);
				});

			} else { // 주소가 없을 때
				console.log("존재하지 않는 주소입니다.");
			}//if

		}); //	geoCoder.geocode
	}
</script>