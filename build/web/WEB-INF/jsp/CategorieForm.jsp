
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add a category</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="css/styles.css" type="text/css"/>

    </head>
    <body>
        <div class="header">
            <h1>KIC Admin</h1>
        </div>
        <div class="row">
            <div class="col-3 col-s-3"></div>
            <div class="col-6 col-s-6">
                <c:forEach items="${requestScope.errors}" var="error">
                    <dl>
                        <dt>Error place: ${error.key}</dt>
                        <dd>Error type:  ${error.value}</dd>
                    </dl>
                </c:forEach>
                <form action="categorie.save" method="post">
                    <fieldset>
                        <legend>New Category</legend>
                        <p>
                            <label for="categorieId">Category ID:</label>
                            <input type="text" id="categorieId" name="categorieId" value="${param.categorieId==null? '':param.categorieId}" required>
                        </p>
                        <p>
                            <label for="categorieName">Category Name</label>
                            <input type="text" id="categorieName" name="categorieName" value="${param.categorieName==null? '':param.categorieName}" required>
                        </p>
                        <p class="right-btn">
                            <input type="submit" value="Submit">
                            <input type="button" value="Cancel" onclick="document.getElementById('categorieLink').click()">
                        </p>
                    </fieldset>
                </form>
                <a id="categorieLink" href="categorie" style="visibility: hidden">Category</a>
            </div>
            <div class="col-3 col-s-3"></div>
        </div>
        <div class="footer">
            <p>Room Admin has been developed with Web Application Development Course</p>
        </div>
    </body>
</html>
