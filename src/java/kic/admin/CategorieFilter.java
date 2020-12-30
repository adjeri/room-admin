package kic.admin;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kic.admin.models.Categorie;


public class CategorieFilter implements Filter {

    /**
     *
     */
    protected FilterConfig filterConfig;

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        ServletContext application = filterConfig.getServletContext();
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String httpMethod = httpRequest.getMethod();
        if (httpRequest.getSession().getAttribute("userName") != null) {
            DbController dbController = (DbController) application.getAttribute("dbController");
            ArrayList<Categorie> Categories = new ArrayList<>();
            try (ResultSet results = dbController.fetchCategoriesFromDb()) {
                while (results.next()) {
                    Categories.add(new Categorie(results.getString("id"), results.getString("name")));
                }
            } catch (SQLException ex) {
                Logger.getLogger(DashboardFilter.class.getName()).log(Level.SEVERE,
                        "SQL error in the CategorieFilter.", ex);
            }
            request.setAttribute("categories", Categories);
            //Continue to the next stage
            chain.doFilter(request, response);
        } else {
            ((HttpServletResponse) response).sendRedirect("login.form");
        }
    }

    /**
     * Destroy method for this filter
     */
    @Override
    public void destroy() {
    }

    /**
     * Init method for this filter
     *
     * @param filterConfig
     */
    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        Logger.getLogger(CategorieFilter.class.getName()).log(Level.INFO,
                "CategorieFilter:Initializing filter");
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        return ("CategorieFilter()");
    }
}
