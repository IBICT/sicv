# SICV
Este é o sicv 2.0

## Projeto
Projetado em java com Spring Boot - mais informações em [documentation](https://github.com/tibastral/markdownify)

O projeto depende das seguintes variáveis de ambiente definidas para execução:


    export SICV_TOKEN_GLAD="(token-do-glad)"
    export SICV_DB_USER="(usuario-db)"
    export SICV_DB_PSWD="(senha-db)"

Para que a submissão de arquivos em formato EcoSpold 2 funcione, é necessária,
também, a seguinte variável:

    export SICV_CONVERSOR_URL="(url-do-servico-de-conversao)"
 
A variável SICV-CONVERSOR-URL deve apontar para a url da instância do serviço
de conversão, do qual o projeto depende. O serviço, junto com uma explicação de
sua configuração, encontra-se disponível em
[GreenDelta/olca-conversion-service](https://github.com/GreenDelta/olca-conversion-service/).

Oferecimentos ACV IBICT Brasil.
