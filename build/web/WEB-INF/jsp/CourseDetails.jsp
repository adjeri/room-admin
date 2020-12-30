

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add a course</title>
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
                <c:forEach items = "${requestScope.newCourses}" var="newCourse">
                    <fieldset>
                    <legend>New course(s) added</legend>
                    <dl>
                        <dt>Course code:</dt>
                        <dd>${newCourse.code}"</dd>
                        <dt>Course title</dt>
                        <dd>${newCourse.title}"</dd>
                        <dt>Course short name</dt>
                        <dd>${newCourse.short_name}"</dd>
                        <dt>Course category</dt>
                        <dd>${newCourse.category}"</dd>
                        <dt>Course credits</dt>
                        <dd>${newCourse.credits}"</dd>
                        <dt>Course is elective</dt>
                        <dd>${newCourse.is_elective}"</dd>
                        <p class="right-btn">
                            <input type="button" value="OK" onclick="document.getElementById('courseLink').click()">
                        </p>
                </fieldset>
                </c:forEach>
                <a id="courseLink" href="course" style="visibility: hidden">Course</a>
            </div>
            <div class="col-3 col-s-3"></div>
        </div>
        <div class="footer">
            <p>Room Admin has been developed with Web Application Development Course</p>
        </div>
    </body>
</html>
