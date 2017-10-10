<html>
<head><title></title></head>
<body>
<p>
Prezado Administrador,<br/>
</p>
<p>
O usuário ${user.getFirstName()} ${user.getLastName()} foi cadastrado com sucesso no Banco Nacional SICV Brasil ${urlTrack} na 
data ${date}. Seguem os dados do contato:
</p>

<b>Nome:</b> ${user.getFirstName()} ${user.getLastName()}<br/>
<b>E-mail:</b> ${user.getEmail()}<br/>
<b>Instituição:</b> ${user.getInstituicao()}

<p>
Atenciosamente, <br/>
E-mail enviado automaticamente pela plataforma <b>SICV Brasil</b><br/>
${url}
</p>
</body>
</html>
