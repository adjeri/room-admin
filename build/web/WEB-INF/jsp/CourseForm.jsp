
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add a Course</title>
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
                
                <div style="display: none">
                    <div  id="formMain">
                    <fieldset>
                        <legend>New Course</legend>
                        <p>
                            <label for="courseCode">Code:</label>
                            <input type="text" id="courseCode" name="courseCode" value="${param.courseCode==null? '':param.courseCode}" required>
                        </p>
                        <p>
                            <label for="courseTitle">Title</label>
                            <input type="text" id="courseTitle" name="courseTitle" value="${param.courseTitle==null? '':param.courseTitle}" required>
                        </p>
                        <p>
                            <label for="courseShortname">Short name</label>
                            <input type="text" id="courseShortname" name="courseShortname" value="${param.courseShortname==null? '':param.courseShortname}" required>
                        </p>
                        <p>
                            <label for="courseCategory">Category</label>
                            <select name="courseCategory">
                            <c:forEach items="${requestScope.categories}" var="categorie">
                                <option value="${categorie.id}">${categorie.name}</option>
                            </c:forEach>
                            </select> 
                        </p>
                        <p>
                            <label for="courseCredits">Credits</label>
                             <select name = "courseCredits">
                                 <option value="2">2</option>
                                 <option value="4">4</option>
                                 <option value="8">8</option>
                             </select> 
                        </p>
                        <p>
                            <label for="courseIsElective">Is Elective</label>
                            <select name = "courseIsElective">
                                 <option name = "courseIsElective" value="True">Yes</option>
                                 <option name = "courseIsElective" value="False">No</option>
                             </select> 
                        </p>
                    </fieldset>
                </div>
                </div>        
                <input type="button" value="Add a new form" class="add-more-btn" onclick="addform();">
                <form action="course.save" method="post">
                    <fieldset>
                        <legend>New Course</legend>
                        <p>
                            <label for="courseCode">Code:</label>
                            <input type="text" id="courseCode" name="courseCode" value="${param.courseCode==null? '':param.courseCode}" required>
                        </p>
                        <p>
                            <label for="courseTitle">Title</label>
                            <input type="text" id="courseTitle" name="courseTitle" value="${param.courseTitle==null? '':param.courseTitle}" required>
                        </p>
                        <p>
                            <label for="courseShortname">Short name</label>
                            <input type="text" id="courseShortname" name="courseShortname" value="${param.courseShortname==null? '':param.courseShortname}" required>
                        </p>
                        <p>
                            <label for="courseCategory">Category</label>
                            <select name="courseCategory">
                            <c:forEach items="${requestScope.categories}" var="categorie">
                                <option value="${categorie.id}">${categorie.name}</option>
                            </c:forEach>
                            </select> 
                        </p>
                        <p>
                            <label for="courseCredits">Credits</label>
                             <select name = "courseCredits">
                                 <option value="2">2</option>
                                 <option value="4">4</option>
                                 <option value="8">8</option>
                             </select> 
                        </p>
                        <p>
                            <label for="courseIsElective">Is Elective</label>
                            <select name = "courseIsElective">
                                 <option name = "courseIsElective" value="True">Yes</option>
                                 <option name = "courseIsElective" value="False">No</option>
                            </select> 
                        </p>
                    </fieldset>
                        <span id="formBlock"></span>
                    <p class="right-btn">
                            <input type="submit" value="Submit">
                            <input type="button" value="Cancel" onclick="document.getElementById('courseLink').click()">
                    </p>
                </form>
                <a id="courseLink" href="course" style="visibility: hidden">Category</a>
            </div>
            <div class="col-3 col-s-3"></div>
        </div>
        <div class="footer">
            <p>Room Admin has been developed with Web Application Development Course</p>
        </div>
    </body>
</html>
<script>
    function addform(){
        var newFields = document.getElementById('formMain').cloneNode(true);
        var insertion = document.getElementById('formBlock');
        insertion.parentNode.insertBefore(newFields,insertion);
    }
</script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>