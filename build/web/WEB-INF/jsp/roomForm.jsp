<%-- 
    Document   : roomForm
    Created on : May 24, 2018, 10:31:01 AM
    Author     : user0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add a room</title>
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
                <form action="room.save" method="post">
                    <fieldset>
                        <legend>New room</legend>
                        <p>
                            <label for="roomId">Room ID:</label>
                            <input type="text" id="roomId" name="roomId" value="${param.roomId==null? '':param.roomId}" required>
                        </p>
                        <p>
                            <label for="roomCap">Capacity</label>
                            <input type="number" id="roomCap" name="roomCap" value="${param.roomCap==null? '':param.roomCap}" required>
                        </p>
                        <p class="right-btn">
                            <input type="submit" value="Submit">
                            <input type="button" value="Cancel" onclick="document.getElementById('dashboardLink').click()">
                        </p>
                    </fieldset>
                </form>
                <a id="dashboardLink" href="dashboard" style="visibility: hidden">Dashboard</a>
            </div>
            <div class="col-3 col-s-3"></div>
        </div>
        <div class="footer">
            <p>Room Admin has been developed with Web Application Development Course</p>
        </div>
    </body>
</html>
