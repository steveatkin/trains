/*
The MIT License (MIT)

Copyright (c) 2015 IBM

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

package com.ibm;

import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibm.subway.NewYorkSubway;
import com.ibm.subway.StationList;



/**
 * Servlet implementation class BestSellers
 */
@WebServlet(urlPatterns = {"/Subway"})
public class SubwayServlet extends HttpServlet {
	private static final Logger logger = LoggerFactory.getLogger(SubwayServlet.class);
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubwayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json");
    	response.setCharacterEncoding("UTF-8");

    	OutputStream stream = response.getOutputStream();
    	OutputStreamWriter writer = new OutputStreamWriter(stream, "UTF-8");

    	String routeId = request.getParameter("route");
    	String stationId = request.getParameter("station");
    	String enable = request.getParameter("enable");
    	Locale locale = request.getLocale();
    	boolean translate = false;
    	
    	if(enable != null) {
    		translate = Boolean.parseBoolean(enable);
    	}

		NewYorkSubway subway = new NewYorkSubway();

		try {
			StationList stationList = new StationList();
			
			if(routeId != null) {
				logger.debug("Requested route {}", routeId);
				stationList = subway.getStationList(routeId);
			}
			else if(stationId != null) {
				logger.debug("Requested station {}", stationId);
				stationList = subway.getTrainList(stationId, locale, translate);
			}
			
			ObjectMapper mapper = new ObjectMapper();

			String listContents = mapper.writeValueAsString(stationList.getStationList());
			logger.debug("Station list is {}", listContents);
			writer.write(listContents);
			writer.flush();
			writer.close();
		}
		catch(Exception e) {
			logger.error("MTA list unavailable");
			throw new IOException("Could not get list from MTA");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
