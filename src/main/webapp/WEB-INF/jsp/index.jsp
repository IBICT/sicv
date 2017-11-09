<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="resources.Strings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link href="<%=Strings.BASE%>/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=Strings.BASE%>/assets/materialize/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        html {
            font-family: 'Titillium Web', "Roboto", sans-serif;
        }
        
        .page-title {
            color: #00697c;
        }
        
        .btn-import {
            background-color: #accc5f;
        }
        .btn-save {
            background-color: #4dbcc4;
        }
        
    </style>

</head>

<body>
	<jsp:include page="/WEB-INF/jsp/partials/nav.jsp" />
	<div class="headerDiv">
        <jsp:include page="/WEB-INF/jsp/partials/header.jsp" />
	</div>
<div class="principalDiv bordered">
    <div class="row">
        <h5 class="page-title">Particle board, at plant, for indoor use, 7.4% water content, from virgin wood, BR 2012</h5>
    </div>
    <div class="row">
        <div class="row">
            <div class="col s6">
                <h5>Usuário</h5>
                <h6>Lucas</h6>
                <h6>Autor/es</h6>
                <p>Edivan Cherubini; Felipe Lion Motta; Paulo Trigo Ribeiro</p>
                <p>edivan@enciclo.com.br;felipe@acvbrasil.com.br;pribeiro@3drivers.pt</p>
                <hr />
                <h6>Categoria</h6>
                <p>Construction</p>
                <hr />
                <h6>Descrição</h6>
                <p>The data set represents a generic Portland cement production and covers some relevant process
steps. Post-clinker processing and raw materials preparation emissions are not considered in
the dataset. The inventory is based on an adaptation of LCI cement production in Mexico, with
adjusted data for raw material consumption and for the CO2 emissions due to clinker production
and emissions from thermal energy used in the kiln. The dataset considers an emission factor of
0.371 kg CO2/ ton of cement for the decarbonizing process of clinker production based on
Carvalho et al. (2010). The generic composition of the cement was based on estimates according
to Carpio (2005) and Costa et al. (2013) for limestone, clay and silicon. For iron it was assumed
the same amount from the Mexican dataset. Alternative additives (pozzolana, blast furnace slag
and fly ashes) and gypsum are based on data from the WBCSD (2012). The water consumption
were not considered due to lack of data. Inventory is also based on secondary data from the
national inventory of greenhouse gas emissions in the cement sector. The fuel mix of thermal
energy used in the cement production are based on coke petroleum (71.7%), electricity (12.2%),
charcoal (2.4%), fuel oil (0.4%), steam coal (1.9%), diesel (1.2%), wood (0.9%), natural gas (0.7%) and
other alternatives fuels (8.7%), such as tires, industrial waste and biomass(rice husk, bagasse,
among others). However, due to lack of data on the share of these alternative fuels, the dataset
only considers the fuel source from fossil fuels and electricity. Data on the fuel mix are weighted
average (2009-2013) from the Brazilian Energy Balance (EPE, 2014).</p>
                <hr />
                <button class="btn">Salvar alterações</button>
            </div>
            <div class="col s6">
                <h6>Histórico</h6>
                <div class="row">
                    <div class="col s3">Data</div>
                    <div class="col s3">Devolução técnica</div>
                    <div class="col s6">Minha resposta para esta revisão</div>
                </div>
                <div class="row">
                    <div class="col s3">30/08/2017</div>
                    <div class="col s3"><i class="material-icons">insert_drive_file</i></div>
                    <div class="col s6">
                        <div class="row">
                            <div class="file-field input-field">
                                <div class="btn">
                                    <span>Anexar ILCD</span>
                                    <input type="file">
                                </div>
                                <div class="file-path-wrapper">
                                    <input placeholder="Escolha arquivo em formato ILCD" class="file-path validate" type="text">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="file-field input-field">
                                <div class="btn">
                                    <span>Anexar ILCD</span>
                                    <input type="file">
                                </div>
                                <div class="file-path-wrapper">
                                    <input placeholder="Escolha arquivo em formato ILCD" class="file-path validate" type="text">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <button class="btn col s6 offset-s6">Enviar</button>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col s3">30/08/2017</div>
                    <div class="col s3"><i class="material-icons">insert_drive_file</i>PDF</div>
                    <div class="col s3">
                        <i class="material-icons">insert_drive_file</i>ILCD.doc
                    </div>
                    <div class="col s3">
                        <i class="material-icons">insert_drive_file</i>Comentário.doc
                    </div>
                </div>
                <div class="row">
                    <div class="col s3">30/08/2017</div>
                    <div class="col s3"><i class="material-icons">insert_drive_file</i>PDF</div>
                    <div class="col s3">
                        <i class="material-icons">insert_drive_file</i>ILCD.doc
                    </div>
                    <div class="col s3">
                        <i class="material-icons">insert_drive_file</i>Comentário.doc
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col s3">30/08/2017</div>
                    <div class="col s9">Qualidata aprovado | ILCD encaminhado para revisão Técnica |</div>
                </div>
                <hr />
                <div class="row">
                    <div class="col s6">Devolução Qualidata</div>
                    <div class="col s6">Minha resposta para esta revisão</div>
                </div>
                <div class="row">
                    <div class="col s3">30/08/2017</div>
                    <div class="col s3"><i class="material-icons">insert_drive_file</i>PDF</div>
                    <div class="col s3">
                        <i class="material-icons">insert_drive_file</i>ILCD.doc
                    </div>
                    <div class="col s3">
                        <i class="material-icons">insert_drive_file</i>Comentário.doc
                    </div>
                </div>
                <div class="row">
                    <div class="col s3">30/08/2017</div>
                    <div class="col s3"><i class="material-icons">insert_drive_file</i>PDF</div>
                    <div class="col s3">
                        <i class="material-icons">insert_drive_file</i>ILCD.doc
                    </div>
                    <div class="col s3">
                        <i class="material-icons">insert_drive_file</i>Comentário.doc
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col s6 offset-s6">Arquivo inicial</div>
                </div>
                <div class="row">
                    <div class="col s3">30/08/2017</div>
                    <div class="col s3 offset-s3">
                        <i class="material-icons">insert_drive_file</i>ILCD.doc
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script type="application/javascript" src="<%=Strings.BASE%>/assets/jquery-3.2.1.min.js"></script>
    <script type="application/javascript" src="<%=Strings.BASE%>/assets/materialize/js/materialize.min.js"></script>
    <script>
    </script>
</body>

</html>
