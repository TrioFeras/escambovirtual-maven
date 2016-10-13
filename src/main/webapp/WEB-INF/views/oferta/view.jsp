<%-- 
    Document   : view
    Created on : 23/09/2016, 09:39:22
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Ofertas Recebidas</title>
        <!--Import Google Icon Font-->
        <link href="<c:url value="/resources/css/icon.css"/>" rel="stylesheet">    
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/materialize.min.css"/>"  media="screen,projection"/>
        <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="<c:url value="/resources/css/ghpages-materialize.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico"/>" type="image/x-icon">

        <link href="<c:url value="/resources/css/modulo-anunciante/base-style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="<c:url value="/resources/css/modulo-anunciante/oferta-view-style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <!--SCRIPTS-->
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
        <script src="<c:url value="/resources/js/init.js"/>"></script>

        <script>
            $(document).ready(function () {
                // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                $('.modal-trigger').leanModal();
            });
        </script> 
    </head>
    <body>
        <header>             
            <!--MODAL ACEITAR OFERTA-->
            <div id="aceitarOferta" class="modal">
                <div class="modal-content">
                    <form method="post" action="/web/anunciante/oferta/${oferta.id}/aceitar">
                        <h4>Aceitar Oferta e Realizar a Troca</h4>
                        <p><strong>Atenção, após você aceitar esta oferta, os itens relacionados à mesma serão colocados no status "Aguardando a troca", 
                                portanto não poderão mais ser visualizados por outros anunciantes que realizarem pesquisas no sistema.</strong></p>
                        <p>Recomendamos que esta ação seja confirmada apenas quando a troca já tenha sido finalizada de fato.</p>
                        <p>Com a sua confirmação, o anunciante que realizou esta oferta, será notificado que você a aceitou e poderá confirmar a troca dos itens.</p>
                        <button class="btn blue waves-effect modal-close">Aceitar</button>
                        <a class="btn brown waves-effect modal-close">Cancelar</a>
                    </form>
                </div>
            </div>
            <!--FIM MODAL-->
            <jsp:include page="/resources/templates/menu-lateral-anunciante.jsp"/>           

            <div class="row container nav-breadcrumb">                                    
                <div class="col s12 m12 l12 links">
                    <a href="<c:url value="/anunciante/home"/>" class="breadcrumb link-anterior">Home</a>
                    <a href="<c:url value="/anunciante/oferta/list"/>" class="breadcrumb link-anterior">Ofertas Recebidas</a>
                    <a href="#!" class="breadcrumb link-ativo">Ver Oferta</a>
                </div>       
            </div>
            <div class="linha"></div>

            <div class="container">                
                <div class="oferta">
                    <div class="info-header">
                        <h5 class="center-align">Oferta enviada pelo anunciante <span>${anuncianteOferta.nome}</span></h5>
                        <h5 class="center-align">Para seu item <span>${oferta.item.nome}</span></h5>
                    </div>
                    <div class="row">                    
                        <h5 style="margin-top: 4%;">Foram ofertados os seguintes itens:</h5>
                    </div>
                    <div class="row item">
                        <c:forEach items="${oferta.ofertaItem.itemList}" var="itemOferta">
                            <div class="card small col s12 m4 l4">
                                <div class="card-image waves-effect waves-block waves-light">
                                    <a href="<c:url value="/anunciante/oferta/${oferta.id}/item/view/${itemOferta.id}"/>">
                                        <c:if test="${empty itemOferta.itemImagemList}">
                                            <img src="<c:url value="/resources/img/sem-imagem.jpg"></c:url>" class="responsive-img" style="padding-top: 8%;">                                                        
                                        </c:if>
                                        <c:if test="${not empty itemOferta.itemImagemList}">                                                            
                                            <c:forEach items="${itemOferta.itemImagemList}" var="itemImagem">                                                            
                                                <img class="responsive-img" src="<c:url value="/anunciante/item/img/${itemImagem.hash}"/>" height="200" width="200" style="padding-top: 9%;">                                                                                                   
                                            </c:forEach>                                                            
                                        </c:if>
                                    </a>
                                </div>
                                <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4">${itemOferta.nome}</span>
                                    <br/>
                                    <span class="center-align">Clique sobre a imagem para ver mais detalhes</span>
                                </div>                                    
                            </div>
                        </c:forEach>
                    </div>
                    <div class="row">
                        <a class="btn blue waves-effect btn-large modal-trigger" href="#aceitarOferta">Aceitar Oferta</a>
                        <a class="btn grey darken-3 btn-large " href="<c:url value="/anunciante/oferta/list"/>">Voltar</a>                            
                    </div>
                </div>
            </div>
        </header>        
    </body>
</html>
