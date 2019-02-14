# SICV
Este é o sicv 2.0

## Projeto
Projetado em java com Spring Boot - mais informações em [documentation](https://github.com/tibastral/markdownify)

O projeto depende das seguintes variáveis de ambiente definidas para execução:


    export SICV_TOKEN_GLAD="(token-do-glad)"
    export SICV_DB_USER="(usuario-db)"
    export SICV_DB_PSWD="(senha-db)"

Este projeto utiliza a biblioteca
[IBICT/ilcd-ecospold-converter](https://github.com/IBICT/ilcd-ecospold-converter)
para realizar a conversão entre formatos do dataset submetido. Para que a
submissão de arquivos em formato EcoSpold 2 funcione, é necessária,
também, a seguinte variável:

    export SICV_WORKSPACE_PATH="(caminho-do-workspace-do-conversor)"
 
A variável SICV-CONVERSOR-URL deve apontar para o caminho da pasta onde está o workspace do conversor.
Uma explicação mais detalhada do funcionamento do conversor pode ser vista na página da biblioteca 
[IBICT/ilcd-ecospold-converter](https://github.com/IBICT/ilcd-ecospold-converter).

Oferecimentos ACV IBICT Brasil.
