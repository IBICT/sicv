<html>
<head><title></title></head>
<body>
<p>
Prezado Revisor do Banco Nacional de Inventários do Ciclo de Vida,<br/>
Informamos que o inventário ${ilcdName} foi importado com sucesso para a base ${urlTrack} na data ${date}. Ele aguarda agora sua análise de conformidade.
</p>
<p>
Seguem os dados do contato:
</p>
<p>
<b>Nome:</b> ${ilcdUser.getFirstName()} ${ilcdUser.getLastName()}<br>
<b>E-mail:</b> ${ilcdUser.getEmail()}<br>
<b>Instituição:</b> ${ilcdUser.getInstituicao()}<br>
<b>Inventário:</b> ${ilcdTitle}<br>
<b>Objetivo do inventário:</b> objetivo do inventário
</p>
<p>
Atenciosamente, <br/>
Equipe <b>Avaliação do Ciclo de Vida</b><br/>
<b>Banco Nacional de Inventários do Ciclo de Vida</b><br/>
${url}
</p>

</body>
</html>

