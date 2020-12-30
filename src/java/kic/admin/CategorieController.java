package kic.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kic.admin.models.Categorie;

/**
 *
 * @author user0
 */
public class CategorieController {

    public void process(HttpServletRequest request, HttpServletResponse response,
            ServletContext application)
            throws ServletException, IOException {
        String requestUri = request.getRequestURI().trim();
        String destUrl = requestUri.substring(requestUri.lastIndexOf("/") + 1);
        switch (destUrl) {
            case "categorie":
                request.getRequestDispatcher("/WEB-INF/jsp/Categorie.jsp").forward(request, response);
            case "categorie.form":
                request.getRequestDispatcher("/WEB-INF/jsp/CategorieForm.jsp").forward(request, response);
                break;
            case "categorie.save":
                HashMap<String, String> errors = new HashMap<>();
                String categorieId = request.getParameter("categorieId");
                if ((categorieId == null)) {
                    errors.put("categorieId (" + categorieId + ")",
                            "Categorie Id should not be empty");
                }
                String categorieName = request.getParameter("categorieName");
                if ((categorieName == null)) {
                    errors.put("categorieName (" + categorieName + ")",
                            "Categorie name should not be empty");
                }
                if (errors.isEmpty()) {
                    Categorie newCategorie = new Categorie(categorieId, categorieName);
                    try {
                        DbController dbController = (DbController) application.getAttribute("dbController");
                        dbController.insertCategorieInDb(newCategorie);
                        request.setAttribute("newCategorie", newCategorie);
                        request.getSession().setAttribute("categorieIdA", categorieId);
                        response.sendRedirect("categorie");
                    } catch (SQLException ex) {
                        Logger.getLogger(CategorieController.class.getName()).log(Level.SEVERE,
                                "Error while adding a category in the DB", ex);
                        response.sendRedirect("categorie");
                    }
                } else {
                    request.setAttribute("errors", errors);
                    request.getRequestDispatcher("/WEB-INF/jsp/CategorieForm.jsp").forward(request, response);
                }
                break;
            default:
                response.sendRedirect("login.form");
                break;
        }
    }
}
