function enableSubmit(btnID) {
	$('.btnSaveProfile').prop('disabled',true).css({color:"#999", fontWeight:"bold"});
	$("#"+btnID).prop('disabled',false).css('color','#4DBCC4');
}
function submitForm(index) {
	var ar=[];
    if(	$("#"+index+"box2").is(':checked'))
    {
        ar.push({position:index,perfil:$("#"+index+"box2").attr('value')}); 
    }
    if(	$("#"+index+"box3").is(':checked'))
    {
        ar.push({position:index,perfil:$("#"+index+"box3").attr('value')}); 
    }
    if( !$("#"+index+"box2").is(':checked') && !$("#"+index+"box2").is(':checked')){
    	ar.push({position:index,perfil:""});
    }

    //alert(JSON.stringify(ar));
	
    var input = $("<input />").attr("type", "hidden").attr(
    		"name", "perfis").val(JSON.stringify(ar));
    $("#formAdminProfiles").append($(input));
    $("#formAdminProfiles").submit();
/*	$("form#formAdminProfiles").submit(
		function() {
		}
	);*/
}