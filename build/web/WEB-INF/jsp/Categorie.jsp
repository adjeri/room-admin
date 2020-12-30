

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>KIC Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
    </head>
    <body>

        <div class="header">
            <span><h1>KIC Admin</h1><p style="direction: rtl">Welcome ${sessionScope.userName}(<a href="logout">logout</a>)</p></span>
        </div>

        <div class="row">

            <div class="col-4 col-s-5 menu">
                <ul>
                    <li><a href="room.form">Add a room</a></li>
                    <li><a href="categorie">Categories</a></li>
                    <li><a href="course">Courses</a></li>
                </ul>
            </div>

            <div class="col-8 col-s-7">

                <c:if test = "${not empty sessionScope.categorieIdA}">
                    
                    <a style="color:green" href="#" id="add" onclick="document.getElementById('add').style.display='none'"> New Category "${sessionScope.categorieIdA}" added!</a>

                    <c:remove var="categorieIdA"/>
                
                </c:if>

                
                <h1>KIC Categories</h1>
                
                <a href="categorie.form">New category</a>

                <c:forEach items="${requestScope.categories}" var="categorie">
                        <dl>
                            <dt>Category ID: ${categorie.id}</dt>
                            <dd>Category name: ${categorie.name}</dd>
                        </dl>
                        --------------
                </c:forEach>
                <p></p>
                <p></p>
                <p></p>
                <p></p>

            </div>

        </div>

        <div class="footer">
            <p>KIC Admin has been developed with Web Application Development Course</p>
        </div>

    </body>
</html>
