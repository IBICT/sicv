<html>
<head><title></title></head>
<body>
<p>
Prezado Administrador Banco Nacional de Inventários do Ciclo de Vida,<br/>
Informamos que o inventário ${ilcdTitle} foi analisado na data ${date} e aguarda seu parecer. Seguem os dados:
</p>
<p>
<b>Inventário:</b> ${ilcdTitle}<br>
<b>Objetivo do inventário:</b> objetivo do inventário.<br>
<b>Autor:</b> ${ilcdUser.getFirstName()} ${ilcdUser.getLastName()}<br>
<b>E-mail:</b> ${ilcdUser.getEmail()}<br>
<b>Instituição:</b> ${ilcdUser.getOrganization()}<br>
<b>Revisor:</b> ${reviewer.getFirstName()} ${reviewer.getLastName()}<br>
<b>E-mail:</b> ${reviewer.getEmail()}<br>
<b>Instituição:</b> ${reviewer.getOrganization()}
</p>
<p>
Atenciosamente, <br/>
E-mail enviado automaticamente pela plataforma <b>SICV Brasil</b><br/>
${url}
</p>

</body>
</html>
