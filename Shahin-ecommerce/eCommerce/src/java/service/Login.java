package service;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import ecommerce.business.User;
import ecommerce.database.UserIO;
import ecommerce.utility.MailUtility;
import java.sql.SQLException;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session;
        User user = new User();
        String redirect;
        try {
            UserIO userio = new UserIO();
            ServletContext context = getServletContext();
            
            session = request.getSession();
            user = userio.getUser(request.getParameter("email"));
            redirect = (String) context.getAttribute("referer");
            context.removeAttribute("referer");
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(11*60);
            if(!redirect.contains("log_in.jsp") && 
               !redirect.contains("registration.jsp")){
                response.sendRedirect(redirect);
            } else{
                response.sendRedirect("index.jsp");
            }
        }catch(Exception e){
                System.out.println(e.getMessage());
                out.close();
            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        processRequest(request, response);
    }
}
