function forgotEmailValidate(filledMailId){
	var email = $('#'+filledMailId).val();
	existEmail(email, exibir);
}

//assyc callback method
function exibir(exist){
	if( exist == 1 ){
    	$('#btnSendForgot').prop('disabled', false);
    	$('#resultEmailForgot').html("");
    }if( exist == 0 ){
    	$('#resultEmailForgot').html("e-mail não cadastrado.");
    	$('#btnSendForgot').prop('disabled', true);
    }if(exist == 2 ){
    	$('#resultEmailForgot').html("");
    	$('#btnSendForgot').prop('disabled', true);
    }if(exist == 444 )
    	$('#resultEmailForgot').html( "Ocorreu uma falha ao verificar o email informado.");
}

function existEmail(mail, callback) {
	var pattern = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	//verify if is a valid pattern mail
	if(pattern.test(mail)){
	    $.ajax({
	        type: "post",
	        url: 'getUser',
	        data: { email: mail},
	        success: function (result) {
	        	if(result == true)
	        		callback(1);
	        	else
	        		callback(0);
	        },
	        error: function (response) {
	        	callback(444);
	        }
	    });
	}else
		callback(2);

}