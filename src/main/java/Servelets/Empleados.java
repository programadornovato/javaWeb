/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servelets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import com.mysql.jdbc.Driver;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author eugenio
 */
@WebServlet(name = "Empleados", urlPatterns = {"/Empleados"})
public class Empleados extends HttpServlet {

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            try {

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=eugenio&password=123456");
                st = con.createStatement();
                String query="SELECT * FROM `empledos` ";
                String where=" where 1=1 ";
                String nombre=request.getParameter("nombre");
                if(nombre!=null){
                    //nombre=nombre.replaceAll("'", "\\\\'");
                    nombre=this.mysql_real_scape_string(nombre);
                    where=where+" and nombre=? "; 
                }
                query=query+where;
                //out.println(query);
                PreparedStatement preparar=con.prepareStatement(query);
                if(nombre!=null){
                    preparar.setString(1, nombre);
                }
                rs=preparar.executeQuery();
                while (rs.next()) {

                    out.print("<tr>"
                            + "<th scope=\"row\">" + rs.getString(1) + "</th>"
                            + "<td>" + rs.getString(2) + "</td>"
                            + "<td>" + rs.getString(3) + "</td>"
                            + "<td>" + rs.getString(4) + "</td>"
                            + "<td>"
                            + "  <a href=\"editar.jsp?id=" + rs.getString(1) + "&nombre=" + rs.getString(2) + "&direccion=" + rs.getString(3) + "&telefono=" + rs.getString(4) + "\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>"
                            + "  <a href=\"borrar.jsp?id=" + rs.getString(1) + "\" class=\"ml-1\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"
                            + "</td>"
                            + "</tr>"
                    );

                }
            } catch (Exception e) {
                out.print("error mysql " + e);
            }finally{
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Empleados.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }
    }
    public String mysql_real_scape_string(String texto){
        texto=texto.replaceAll("\\\\", "\\\\\\\\'");
        texto=texto.replaceAll("\\n", "\\\\n'");
        texto=texto.replaceAll("\\r", "\\\\r'");
        texto=texto.replaceAll("\\t", "\\\\t'");
        texto=texto.replaceAll("\\n", "\\\\n'");
        texto=texto.replaceAll("'", "\\\\'");
        return texto;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
