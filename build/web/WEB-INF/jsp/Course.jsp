

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

                

                
                <h1>KIC Courses</h1>
                
                <a href="course.form">New course</a>

                <c:forEach items="${requestScope.courses}" var="course">
                        <dl>
                        <dt>Course code:</dt>
                        <dd>"${course.code}"</dd>
                        <dt>Course title</dt>
                        <dd>"${course.title}"</dd>
                        <dt>Course short name</dt>
                        <dd>"${course.short_name}"</dd>
                        <dt>Course category</dt>
                        <dd>"${course.category}"</dd>
                        <dt>Course credits</dt>
                        <dd>"${course.credits}"</dd>
                        <dt>Course is_elective</dt>
                        <dd>"${course.is_elective}"</dd>
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
