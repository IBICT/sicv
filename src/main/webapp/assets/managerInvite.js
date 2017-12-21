function sendInviteQ(ilcdID) {
	var href = $("#sendInviteQ").attr('href');
	var userID = "";
	
	 $('input:radio').each(function () {

		 if ($(this).prop('checked')) {
			 userID = $(this).attr('value');
		 }
    });

	href = href+"?user="+userID+"&ilcd="+ilcdID;
	alert(href);
	$("#sendInviteQ").attr("href", href);
}

function sendInviteT(ilcdID) {
	var href = $("#sendInviteT").attr('href');
	var userID = "";
	
	 $('input:radio').each(function () {

		 if ($(this).prop('checked')) {
			 userID = $(this).attr('value');
		 }
    });

	href = href+"?user="+userID+"&ilcd="+ilcdID;
	alert(href);
	$("#sendInviteT").attr("href", href);
}