<html>
<head><title></title></head>
<body>
<p>
Prezado (a) Sr./Sra. ${user.getFirstName()} ${user.getLastName()},<br/>
Seja bem-vindo ao Banco Nacional de Inventários do Ciclo de Vida!
</p>
<p>
Ao acessar os SICV Brasil você poderá consultar diversos inventários públicos, realizar pesquisas de processos, fluxos, fontes, grupos de 
unidades e contatos. Você pode, ainda, submeter o seu inventário ao SICV Brasil para análise dos dados e futura publicação.
</p>
<p>
Obrigado por se inscrever! Seus dados de acesso são:
</p>
<b>Endereço do banco:</b> ${urlLogin}<br/>
<b>Usuário:</b> ${user.getEmail()}<br/>
<b>Senha:</b> ${senha}

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
