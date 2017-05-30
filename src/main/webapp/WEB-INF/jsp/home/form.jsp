<%@page import="resources.Strings"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="description" content="Metro, a sleek, intuitive, and powerful framework for faster and easier web development for Windows Metro Style." />
        <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development" />
        <meta name="author" content="Sergey Pimenov and Metro UI CSS contributors" />

        <title>Sicv2</title>


    </head>
    <body class="bg-steel">
        <form action="${Strings.BASE}/admin/ilcd/new" method="POST" enctype="multipart/form-data">
            <div class="grid">

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> O conjunto de dados está em inglês?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q1" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q1" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A identificação do conjunto de dados segue o padrão Nome do produto_tecnologia_outra especificação?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q2"  value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q2"  value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As citações e referências estão completas?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q3"  value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q3"  value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Os campos de administração são informados?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q4"  value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q4"  value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> É informada a cobertura temporal do conjunto de dados?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q5"  value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q5" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"> É informado o período de validade do conjunto de dados?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q6" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q6" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A cobertura tecnológica é informada?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q7" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q7" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A descrição da tecnologia é apresentada?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q8" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q8" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A cobertura geográfica é informada?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q9" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q9" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> É informada a representatividade do conjunto de dados?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q10" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q10" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <h3>Requisitos de Método e Processos</h3>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Informada a abordagem utilizada?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q11" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q11" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foi aplicado critério de corte? Se sim, qual foi o critério utilizado?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q12" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q12" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Qual?</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Houve agregação dos dados? Qual o nível de agregação utilizado?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q13" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q13" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Qual?</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> O fluxograma do sistema do produto foi apresentado, incluindo as fronteiras do conjunto de dados?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q14" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q14" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As conexões dos fluxos intermediários com os processos elementares secundários foram apresentadas?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q15" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q15" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> O conjunto de dados representa um sistema multifuncional?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q16" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q16" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Como lidou com a multifuncionalidade?</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foi considerado o uso da terra (ocupação e transformação)?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q17" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q17" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Qual foi o método utilizado para transformação do uso da terra?</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Os dados foram validados de alguma forma?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q18" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q18" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Qual foi o método utilizado?</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Se o balanço de massa foi realizado, quanto foi fechado nos processos elementares primários?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q19" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q19" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Quanto? (0 a 100%)</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Se o balanço de água foi realizado, quanto foi fechado nos processos elementares primários?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q20" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q20" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Quanto? (0 a 100%)</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Se o balanço de energia foi realizado, quanto foi fechado nos processos elementares primários?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q21" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q21" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Quanto? (0 a 100%)</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foi adotado algum método para analisar a qualidade dos dados?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q22" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q22" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Qual?</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Os bens de capital foram incluídos?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q23" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q23" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>


                <h3>Requisitos de Fluxos</h3>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> A identificação dos fluxos seguiu o padrão definido no Guia? Em caso negativo, adequar.</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q24" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q24" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> O fluxo de referência foi informado?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q25" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q25" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As unidades estão no Sistema Internacional (SI)?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q26" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q26" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Se não, descrever as possíveis relações com as unidades do SI.</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Cada fluxo tecnológico está especificado por região?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q27" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q27" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> São informados os compartimentos e subcompartimentos?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q28" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q28" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;">Há informação da origem e destino dos fluxos de água?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q29" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q29" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;">Os materiais particulados foram separados em frações?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q30" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q30" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;">Os compostos orgânicos voláteis (COV) foram discriminados?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q31" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q31" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;">Os hidrocarbonetos aromáticos policíclicos (PAH) foram discriminados?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q32" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q32" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;">As dioxinas e furanos foram discriminados?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q33" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q33" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As fontes de CO2 e CH4 foram discriminadas?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q34" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q34" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;">As emissões de longo prazo foram informadas?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q35" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q35" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> As emissões diretas de CO2 de MUT foram incluídas e discriminadas?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q36" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q36" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foram incluídos os dados do transporte?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q37" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q37" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foram informados os dados faltantes?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q38" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q38" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foram informados os tipos de dados para cada fluxo?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q39" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q39" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Foi informada a incerteza dos dados para cada fluxo?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q40" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q40" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <h3>Requisitos de Revisão</h3>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Caso tenha havido revisão crítica de terceira parte, as informações necessárias foram fornecidas?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q41" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q41" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <h4 class="text-light" style="margin-right: 20px;"><span style="color: red;">*</span> Se houve revisão crítica, o relatório da revisão pode ser disponibilizado para os revisores do SICV, junto com o conjunto de dados?</h4><br />
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q42" value="sim" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Sim</span>
                    </label>
                    <label class="input-control radio small-check" style="margin-right: 20px;">
                        <input name="q42" value="não" type="radio" />
                        <span class="check"></span>
                        <span class="caption">Não</span>
                    </label>
                    <div class="input-control checkbox"><span class="caption">Comentário</span></div>
                    <div class="input-control text">
                        <input type="text" />
                    </div>
                </div>

                <div class="row">
                    <div class="input-control checkbox"><span class="caption">ILCD File: </span></div>
                    <div class="input-control file" data-role="input">
                        <input name="file" type="file" />
                        <button type="button" class="button"><span class="mif-folder"></span></button>
                    </div>
                </div>

                <div class="row">
                    <input class="button primary" style="margin-right: 20px;" value="Salvar" type="submit" /><a href="/admin/ilcd" class="button warning">Cancelar</a>
                </div>

            </div>
        </form>
    </body>
</html>
