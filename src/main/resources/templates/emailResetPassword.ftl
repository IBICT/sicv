<html>
<head><title></title></head>
<body>
<p>
Prezado (a) Sr./Sra. ${user.getFirstName()} ${user.getLastName()},<br/>
Atenção!
</p>
<p>
Você solicitou a redefinição de senha para o email <b>${user.getEmail()}</b> na data ${date}. Acesse o link </b> ${urlReset}<br/> para redefinir sua senha. 
Caso não tenha feito essa solicitação desconsidere essa mensagem e entre em contato conosco.
</p>

<p>
Em Caso de dúvidas, entre em contato pelo e-mail: acv@ibict.br ou telefone (61) 3217.6286.
</p>
<p>
Atenciosamente, <br/>
Equipe <b>Avaliação do Ciclo de Vida</b><br/>
<b>Banco Nacional de Inventários do Ciclo de Vida</b><br/>
${url}

</p>
</body>
</html>
