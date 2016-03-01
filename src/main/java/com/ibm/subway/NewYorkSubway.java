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

package com.ibm.subway;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URI;
import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.http.HttpResponse;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibm.watson.WatsonTranslate;

public class NewYorkSubway {
	private static final Logger logger = LoggerFactory.getLogger(NewYorkSubway.class);
	private static String url;
	
	static {
		url = System.getenv("MTA_URL");
		logger.debug("MTA url {}", url);
	}

	public NewYorkSubway() {
	}
	
	public StationList getTrainList(String stationId, Locale locale, boolean translate) throws Exception {
		logger.debug("Station {}", stationId);
		StationList returnedList = new StationList();
		WatsonTranslate watson = new WatsonTranslate(locale);
		
		try {
			if(stationId != null) {
				RequestConfig config = RequestConfig.custom()
					    .setSocketTimeout(10 * 1000)
					    .setConnectTimeout(10 * 1000)
					    .build();
				CloseableHttpClient httpclient = HttpClients.custom().setDefaultRequestConfig(config).build();

				URIBuilder builder = new URIBuilder();
				builder.setScheme("http").setHost(url).setPath("/by-id/" + stationId);
				URI uri = builder.build();
				HttpGet httpGet = new HttpGet(uri);
				httpGet.setHeader("Content-Type", "text/plain");

				HttpResponse httpResponse = httpclient.execute(httpGet);

				if (httpResponse.getStatusLine().getStatusCode() == 200) {
					BufferedReader rd = new BufferedReader(
				        new InputStreamReader(httpResponse.getEntity().getContent(), "UTF-8"));

					// Read all the trains from the list
					ObjectMapper mapper = new ObjectMapper();
					returnedList = mapper.readValue(rd, StationList.class);
					
					// Set the direction of the trains
					ArrayList<Station> stations = returnedList.getStationList();
					for(Station station : stations) {
						String northString = "North";
						String southString = "South";
						
						if(translate) {
							northString = watson.translate(northString);
							southString = watson.translate(southString);
						}
						
						ArrayList <Train> north = station.getNorthTrains();
						for(Train train : north) {
							train.setDirection(northString);
						}
						ArrayList <Train> south = station.getSouthTrains();
						for(Train train : south) {
							train.setDirection(southString);
						}
					}
				}
				else {
					logger.error("could not get list from MTA http code {}", httpResponse.getStatusLine().getStatusCode());
				}
			}
		}
		catch(Exception e) {
			logger.error("could not get list from MTA {}", e.getMessage());
			throw e;
		}

		return returnedList;
	}

	public StationList getStationList(String routeId) throws Exception {
		logger.debug("Route {}", routeId);
		StationList returnedList = new StationList();

		try {
			if(routeId != null) {
				RequestConfig config = RequestConfig.custom()
					    .setSocketTimeout(10 * 1000)
					    .setConnectTimeout(10 * 1000)
					    .build();
				CloseableHttpClient httpclient = HttpClients.custom().setDefaultRequestConfig(config).build();

				URIBuilder builder = new URIBuilder();
				builder.setScheme("http").setHost(url).setPath("/by-route/" + routeId);
				URI uri = builder.build();
				HttpGet httpGet = new HttpGet(uri);
				httpGet.setHeader("Content-Type", "text/plain");

				HttpResponse httpResponse = httpclient.execute(httpGet);

				if (httpResponse.getStatusLine().getStatusCode() == 200) {
					BufferedReader rd = new BufferedReader(
				        new InputStreamReader(httpResponse.getEntity().getContent(), "UTF-8"));

					// Read all the trains from the list
					ObjectMapper mapper = new ObjectMapper();
					returnedList = mapper.readValue(rd, StationList.class);
				}
				else {
					logger.error("could not get list from MTA http code {}", httpResponse.getStatusLine().getStatusCode());
				}
			}
		}
		catch(Exception e) {
			logger.error("could not get list from MTA {}", e.getMessage());
			throw e;
		}

		return returnedList;
	}

}
