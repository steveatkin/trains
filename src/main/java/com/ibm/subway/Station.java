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

import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Station {
	@JsonProperty("name")
	private String name = "";
	
	@JsonProperty("id")
	private long id = 0;
	
	@JsonProperty("routes")
	private ArrayList<String> routes = new ArrayList<String>();
	
	@JsonProperty("N")
	private ArrayList<Train> northTrains = new ArrayList<Train>();
	
	@JsonProperty("S")
	private ArrayList<Train> southTrains = new ArrayList<Train>();
	
	@JsonProperty("name")
	public String getName() {
		return name;
	}
	
	@JsonProperty("name")
	public void setName(String n) {
		name = n;
	}
	
	@JsonProperty("id")
	public long getId() {
		return id;
	}
	
	@JsonProperty("id")
	public void setId(long i) {
		id = i;
	}
	
	@JsonProperty("routes")
	public ArrayList<String> getRouteList() {
		return routes;
	}
	
	@JsonProperty("routes")
	public void setRouteList(ArrayList<String> r) {
		routes = r;
	}
	
	@JsonProperty("N")
	public ArrayList<Train> getNorthTrains() {
		return northTrains;
	}
	
	@JsonProperty("N")
	public void setNorthTrains(ArrayList<Train> n) {
		northTrains = n;
	}
	
	@JsonProperty("S")
	public ArrayList<Train> getSouthTrains() {
		return southTrains;
	}
	
	@JsonProperty("S")
	public void setSouthTrains(ArrayList<Train> s) {
		southTrains = s;
	}
}
