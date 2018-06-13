var qntdClone = 0;
var submitForm = false;

function removeAuthor(id){
	var nameDiv = id.slice(-1);
	var i = nameDiv+1;
	$("#divAuthorEmail" + nameDiv).remove();
	if(qntdClone > 0){
		for (i; i < qntdClone; i++) {
			var id = i-1;
			$("#divAuthorEmail"+i).find("#btnRemoveAuthor").attr("id", "btnRemoveAuthor" + id);
			$("#divAuthorEmail"+i).find(".aut").attr("name", "authors[" + id + "].author");
			$("#divAuthorEmail"+i).find(".mail").attr("name", "authors[" + id + "].email");
			$("#divAuthorEmail"+i).attr("id", "divAuthoremail" + id);
		}
		qntdClone--;
	}
}

function showFileInput() {
    $('#fileInput').show(500);
    $("#review").attr('required', '');
}
function hiddeFileInput() {
    $('#fileInput').hide(500);
    $("#review").removeAttr("required");
}

function getData() {
	var data = {};
	$("#formILCD").serializeArray().map(function(x) {
		data[x['name']] = x['value'];
	});
	return data;
}

function validFile(id){
	var fileName = $("#"+id).val().slice(-4);
	if( fileName != ".zip"){
		$("#file").removeClass('valid');
		$("#file").addClass('invalid');
		$("#btnSubmit").attr("disabled","disabled");
	}
	else{
		var formData = new FormData();
		formData.append('file', document.getElementById("btnFile").files[0]);
		$.ajax({
	        type: "post",
	        url: '../getILCD',
	        data: formData,
	        contentType: false,
	        processData: false,
	        success: function (result) {
	        	if(result == true){
	        		$('#modalILCDExist').modal('open');
	        		$("#file").removeClass('valid');
	        		$("#file").addClass('invalid');
	        		$("#btnSubmit").attr("disabled","disabled");
	        	}
	            if(result == false){
	            }
	        },
	        error: function (response) {
	        }
	    });
		$("#file").removeClass('invalid');
		$("#file").addClass('valid');
		$("#btnSubmit").removeAttr("disabled");
	}
}

function submitFormILCD(){
	$('#modalConfirmSubmit').modal('close');
	$("#btnSubmitForm").css("display", "");
	$('#btnSubmitForm').click();
	$("#btnSubmitForm").css("display", "none");
}

$(document).ready(
	//$('#modal').modal('open');
	function() {
		$("form").submit(
			function() {
				var data = getData();
				$(this).find("input[name^='q']").each(function() {
					$(this).val('');
				});
				
				var result = {};
				$.each($('form').serializeArray(), function() {
					result[this.name] = this.value;
				});
				
				var authors = $('.aut').serializeArray();
				var mails = $('.mail').serializeArray();
				var input = $("<input />").attr("type", "hidden").attr(
						"name", "authors").val(JSON.stringify(authors));
				$('form').append($(input));
				var input = $("<input />").attr("type", "hidden").attr(
						"name", "emails").val(JSON.stringify(mails));
				$('form').append($(input));
				// reference to form object
				$(":input[value='']").attr('disabled', true);
				var input = $("<input />").attr("type", "hidden").attr(
						"name", "json").val(JSON.stringify(data));
				$('form').append($(input));
				var input = $("<input />").attr("type", "hidden").attr(
						"name", "ilcd").val(JSON.stringify(result));
				$('form').append($(input));
		});
	
	$('.modal').modal();
	$('#modalILCDSuccess').modal('open');
	$('select').material_select();
	$("select[required]").css({position: "absolute", display: "inline", height: 0, padding: 0, width: 0});
	
	if ($("#yesReview").is(":checked")) {
		$('#fileInput').show(500);
		$("#review").attr('required', '');
	} else{
		$("#review").removeAttr("required");		
	}
	
	$('#btnAuthor').click(function () {
		var clone2 = $('#divAuthorEmail').clone();

		$(clone2).find(".aut").val("");
		$(clone2).find(".mail").val("");
		$(clone2).attr("id", "divAuthorEmail" + qntdClone);
		if( qntdClone == 0){
			$(clone2).insertAfter("#divAuthorEmail");
		}else
			$(clone2).insertAfter("#divAuthorEmail"+(qntdClone-1));
		
		$(clone2).find("#divRemoveAuthor").removeAttr("hidden");
		$(clone2).find("#divRemoveAuthor").attr("id", "divRemoveAuthor" + qntdClone);
		$(clone2).find("#btnRemoveAuthor").attr("id", "btnRemoveAuthor" + qntdClone);
		$(clone2).find(".aut").attr("name", "authors[" + qntdClone + "].author");
		$(clone2).find(".mail").attr("name", "authors[" + qntdClone + "].email");
	    qntdClone++;
	});
	
});