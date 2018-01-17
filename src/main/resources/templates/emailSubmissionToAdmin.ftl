<html>
<head><title></title></head>
<body>
<p>
Prezado Administrador,<br/>
O inventário ${ilcdName} foi importado com sucesso para a base ${urlTrack} na data ${date}. Seguem os dados do contato:
</p>
<p>
<b>Nome:</b> ${ilcdUser.getFirstName()} ${ilcdUser.getLastName()}<br/>
<b>E-mail:</b> ${ilcdUser.getEmail()}<br/>
<b>Instituição:</b> ${ilcdUser.getOrganization()}<br/>
<b>Inventário:</b> ${ilcdTitle}<br/>
<b>Objetivo do inventário:</b> objetivo do inventário
</p>
<p>
Atenciosamente, <br/>
E-mail enviado automaticamente pela plataforma <b>SICV Brasil</b><br/>
${url}
</p>

</body>
</html>