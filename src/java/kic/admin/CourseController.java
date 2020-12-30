package kic.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kic.admin.models.Course;

/**
 *
 * @author user0
 */
public class CourseController {

    public void process(HttpServletRequest request, HttpServletResponse response,
            ServletContext application)
            throws ServletException, IOException {
        String requestUri = request.getRequestURI().trim();
        String destUrl = requestUri.substring(requestUri.lastIndexOf("/") + 1);
        switch (destUrl) {
            case "course":
                request.getRequestDispatcher("/WEB-INF/jsp/Course.jsp").forward(request, response);
                break;
            case "course.form":
                request.getRequestDispatcher("/WEB-INF/jsp/CourseForm.jsp").forward(request, response);
                break;
            case "course.save":
                HashMap<String, String> errors = new HashMap<>();
                String[] courseCode = request.getParameterValues("courseCode");
                if ((courseCode == null)|| (courseCode[0]==null)) {
                    errors.put("courseCode (" + courseCode[0] + ")",
                            "Course Code can't be empty!");
                }
                String[] courseTitle = request.getParameterValues("courseTitle");
                if ((courseTitle == null) || (!courseTitle[0].matches("[a-zA-Z]++{1,30}"))) {
                    errors.put("courseTitle (" + courseTitle[0] + ")",
                            "Course Title can't be empty!");
                }
                String[] courseShortname = request.getParameterValues("courseShortname");
                if ((courseShortname == null) || (!courseShortname[0].matches("[a-zA-Z]++{1,30}"))) {
                    errors.put("courseShortname (" + courseShortname[0] + ")",
                            "Course short name can't be empty!");
                }
                String[] courseCategory = request.getParameterValues("courseCategory");
                if ((courseCategory == null) || (!courseCategory[0].matches("[a-zA-Z]++{1,30}"))) {
                    errors.put("courseCategory (" + courseCategory[0] + ")",
                            "Course category can't be empty!");
                }
                String[] courseCredits = request.getParameterValues("courseCredits");
                if (Integer.parseInt(courseCredits[0]) != 2 && Integer.parseInt(courseCredits[0]) !=4 && Integer.parseInt(courseCredits[0]) != 8) {
                    errors.put("courseCredits (" + courseCredits[0] + ")",
                            "Course credits must be 2 or 4 or 8!");
                }
                String[] courseIsElective = request.getParameterValues("courseIsElective");
                //boolean courseIsElective = "on".equals(request.getParameter("courseIsElective"))? true:false;
                if (errors.isEmpty()) {
                    ArrayList<Course> newCourses = new ArrayList<>();
                    for (int i=0; i< courseCode.length;i++){
                        newCourses.add(new Course(courseCode[i],courseTitle[i],courseShortname[i],courseCategory[i],Integer.parseInt(courseCredits[i]),Boolean.parseBoolean(courseIsElective[i])));
                    }
                    
                    try {
                        DbController dbController = (DbController) application.getAttribute("dbController");
                        
                        for(Course newCourse : newCourses){
                            dbController.insertCourseInDb(newCourse);
                        }
                        
                        request.setAttribute("newCourses", newCourses);
                        request.getRequestDispatcher("/WEB-INF/jsp/CourseDetails.jsp").forward(request, response);
                    } catch (SQLException ex) {
                        Logger.getLogger(CourseController.class.getName()).log(Level.SEVERE,
                                "Error while adding a course in the DB", ex);
                        response.sendRedirect("course.form");
                    }
                } else {
                    request.setAttribute("errors", errors);
                    request.getRequestDispatcher("/WEB-INF/jsp/CourseForm.jsp").forward(request, response);
                }
                break;
            default:
                response.sendRedirect("login.form");
                break;
        }
    }
}
