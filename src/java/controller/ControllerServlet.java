/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.Category;
import entity.Product;
import java.io.IOException;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.CategoryFacade;

/**
 *
 * @author tgiunipero
 */
@WebServlet(name = "Controller",
            loadOnStartup = 1,
            urlPatterns = {"/category",
                           "/addToCart",
                           "/viewCart",
                           "/updateCart",
                           "/checkout",
                           "/purchase",
                           "/review",
                           "/help",
                           "/about",
                           "/contact",
                           "/login",
                           "/create",
                           "/edit",
                           "/confirmation",
                           "/product",
                           "/chooseLanguage"})
public class ControllerServlet extends HttpServlet {
    @EJB
    private CategoryFacade categoryFacade;

    public void init() throws ServletException {

        // store category list in servlet context
        getServletContext().setAttribute("categories", categoryFacade.findAll());
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String userPath = request.getServletPath();
        Category selectedCategory;
        Collection<Product> categoryProducts;

        // if category page is requested
        if (userPath.equals("/category")) {
            // TODO: Implement category request
             // get categoryId from request
            String categoryId = request.getQueryString();

            if (categoryId != null) {
                // get selected category
                selectedCategory = categoryFacade.find(Short.parseShort(categoryId));

                // place selected category in request scope
                request.setAttribute("selectedCategory", selectedCategory);

                // get all products for selected category
                categoryProducts = selectedCategory.getProductCollection();

                // place category products in request scope
                request.setAttribute("categoryProducts", categoryProducts);
            }

        // if item review page is requested
        } else if (userPath.equals("/review")) {
            // TODO: Implement item review page request

        // if cart page is requested
        } else if (userPath.equals("/viewCart")) {
            // TODO: Implement cart page request

            userPath = "/cart";

        // if checkout page is requested
        } else if (userPath.equals("/checkout")) {
            // TODO: Implement checkout page request

        // if help page is requested
        } else if (userPath.equals("/help")) {
            // TODO: Implement help page request

        // if about page is requested
        } else if (userPath.equals("/about")) {
            // TODO: Implement about page request

        // if contact page is requested
        } else if (userPath.equals("/contact")) {
            // TODO: Implement contact page request

        // if account page is requested
        } else if (userPath.equals("/login")) {
            // TODO: Implement login page request

        // if account creation page is requested
        } else if (userPath.equals("/create")) {
            // TODO: Implement account creation page request

        // if account edit page is requested
        } else if (userPath.equals("/edit")) {
            // TODO: Implement account edit page request

        // if product page is requested
        } else if (userPath.equals("/product")) {
            // TODO: Implement product page request

        // if user switches language
        } else if (userPath.equals("/chooseLanguage")) {
            // TODO: Implement language request

        }

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String userPath = request.getServletPath();

        // if addToCart action is called
        if (userPath.equals("/addToCart")) {
            // TODO: Implement add product to cart action

        // if updateCart action is called
        } else if (userPath.equals("/updateCart")) {
            // TODO: Implement update cart action

        // if purchase action is called
        } else if (userPath.equals("/purchase")) {
            // TODO: Implement purchase action

            userPath = "/confirmation";
        }

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private Object getServletContext() {
        throw new UnsupportedOperationException("Not yet implemented");
    }

}