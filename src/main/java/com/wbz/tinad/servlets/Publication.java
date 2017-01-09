/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wbz.tinad.servlets;

import com.wbz.tinad.services.AnnonceService;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author davra
 */
public class Publication {

    public void init() throws ServletException {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        AnnonceService util = new AnnonceService();
        
        if (request.getParameter("type").compareTo("0") == 0) {
            out.print(util.demandepublic());
        }
        if (request.getParameter("type").compareTo("1") == 0) {
            out.print(util.offrepublic());
        } else {
            out.print("none");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
