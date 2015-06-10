<%
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
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.util.ResourceBundle.Control" %>
<%@ page import="com.ibm.gaas.CloudResourceBundle" %>
<%@ page import="com.ibm.gaas.ServiceAccount" %>
<%@ page import="com.ibm.gaas.CloudResourceBundleControl" %>
<%@ page import="com.ibm.globalization.Globalization" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>

<%
//ResourceBundle res=ResourceBundle.getBundle( "com.ibm.trains", request.getLocale());

ServiceAccount account = ServiceAccount.getInstance();
Control control = CloudResourceBundleControl.getInstance(account, ResourceBundle.Control.TTL_DONT_CACHE);
ResourceBundle res = ResourceBundle.getBundle("com.ibm.trains", request.getLocale(), control);
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>
    <%=res.getString("product")%>
  </title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css">
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.6.0/bootstrap-table.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/css/bootstrap-datepicker.standalone.min.css">

  <style type="text/css">
  <%@ include file="css/grid.css" %>
  <%@ include file="css/bookclub.css" %>
  </style>
</head>

<body>

  <nav id="myNavbar" class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarCollapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">
          <%=res.getString("product")%>
        </a>
      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="nav navbar-nav">
          <li>
            <a href="index.jsp">
              <%=res.getString("home")%>
            </a>
          </li>
          <li class="active">
            <a href="form.jsp">
              <%=res.getString("start")%>
                   </a>
                 </li>
               </ul>
             </div>
           </div>
         </nav>
         <div class="container">

           <div class="page-header">
             <h1><small><%=res.getString("explore_ny")%></small></h1>
           </div>

           <label for="tranlslation" class="control-label"><%=res.getString("enable_translation")%></label>
           <div class="form-group">
           <select class="selectpicker form-control" data-width="auto" id="translation">
             <option value="true">
             <%=res.getString("yes")%>
             </option>
             <option value="false" selected="selected">
             <%=res.getString("no")%>
             </option>
           </select>
           </div>


    <label for="routeList" class="control-label"><%=res.getString("route_list")%></label>
    <div class="form-group">
      <select class="selectpicker form-control" data-width="auto" id="routeList" title='<%=res.getString("select_list")%>'>
        <option data-hidden="true"></option>
        <option value="1" data-url="http://en.wikipedia.org/wiki/1_(New_York_City_Subway_service)">
          <%=res.getString("route1")%>
        </option>
        <option value="2" data-url="http://en.wikipedia.org/wiki/2_(New_York_City_Subway_service)">
          <%=res.getString("route2")%>
        </option>
        <option value="3" data-url="http://en.wikipedia.org/wiki/3_(New_York_City_Subway_service)">
          <%=res.getString("route3")%>
        </option>
        <option value="4" data-url="http://en.wikipedia.org/wiki/4_(New_York_City_Subway_service)">
          <%=res.getString("route4")%>
        </option>
        <option value="5" data-url="http://en.wikipedia.org/wiki/5_(New_York_City_Subway_service)">
          <%=res.getString("route5")%>
        </option>
        <option value="6" data-url="http://en.wikipedia.org/wiki/6_(New_York_City_Subway_service)">
          <%=res.getString("route6")%>
        </option>
        <option value="6X" data-url="http://en.wikipedia.org/wiki/6_(New_York_City_Subway_service)">
          <%=res.getString("route6x")%>
        </option>
        <option value="L" data-url="http://en.wikipedia.org/wiki/L_(New_York_City_Subway_service)">
          <%=res.getString("routel")%>
        </option>
        <option value="S" data-url="http://en.wikipedia.org/wiki/42nd_Street_Shuttle">
          <%=res.getString("routes")%>
        </option>
      </select>

    </div>


    <div class="panel panel-default">
        <div class="panel-heading">
        <h3 class="panel-title"><%=res.getString("word_cloud")%></h3>
        	<div class="panel-body" id="cloud">
            </div>
        </div>
    </div>

    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><%=res.getString("panel_ny_subway")%></h3>
      </div>

             <div class="panel-body">
               <div class="panel-group" id="accordionPanel">
                 <div class="accordion" id="accordion" >
                       <div class="panel panel-default template" style="display: none;">
                         <div class="panel-heading">
                           <h4 class="panel-title">
							<a class="accordion-toggle" id="anchor0" data-toggle="collapse" data-parent="#accordion" href="#accordion-item"></a>
							</h4>
                          </div>
                          <div id="accordion-item" class="panel-collapse collapse" data-station="" data-number=0>
                  <div class="panel-body">

                    <div class="row-fluid">
                      <div class="col-md-12 column-white">
                        <span class="label label-primary"><%=res.getString("twitter")%></span>
                             <table data-toggle="table" class="table" id="table-tweets">
                        </table>
                      </div>
                    </div>

                    <div class="row-fluid">
                      <div class="col-md-12 column-white">
                        <span class="label label-primary"><%=res.getString("sentiment")%></span>
                          <p>
                           <span class="badge badge-positive" id="badgePositive">0</span>
                          <br>
                          <span class="badge badge-neutral" id="badgeNeutral">0</span>
                          <br>
                          <span class="badge badge-negative" id="badgeNegative">0</span>
                        </p>
                      </div>
                    </div>

                    <div class="row-fluid">
                      <div class="col-md-12 column-white">
                        <span class="label label-primary"><%=res.getString("trains")%></span>
                             <table data-toggle="table" class="table" id="table-trains">
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

          </div>
        </div>
      </div>

    </div>
  </div>

  <div id='ajax_loader' style="position: fixed; left: 50%; top: 50%; display: none;">
    <img src="${pageContext.request.contextPath}/images/ajax-loader.gif" />
  </div>

  <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.6.0/bootstrap-table.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/js/bootstrap-datepicker.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/locales/bootstrap-datepicker.zh-CN.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/locales/bootstrap-datepicker.zh-TW.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/locales/bootstrap-datepicker.ja.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/locales/bootstrap-datepicker.fr.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/locales/bootstrap-datepicker.es.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/locales/bootstrap-datepicker.it.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/locales/bootstrap-datepicker.pt-BR.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.0/locales/bootstrap-datepicker.de.min.js"></script>

  <script type="text/javascript">
  <%@ include file = "js/eventsource.min.js" %>
  <%@ include file = "js/jqTagCloud.js" %>
  </script>

  <script>

  function polarityFormatter(value) {
  	var span = "";

    if (value === 'Positive') {
    	span = "<span class='badge badge-positive'>+</span>";
    } else if (value === "Negative") {
        span = "<span class='badge badge-negative'>-</span>";
    }
    return span;
  }


  function millisecondsToStr (milliseconds) {
    // TIP: to find current time in milliseconds, use:
    // var  current_time_milliseconds = new Date().getTime();

    function numberEnding (number) {
        return (number > 1) ? 's' : '';
    }

    var temp = Math.floor(milliseconds / 1000);
    var years = Math.floor(temp / 31536000);
    if (years) {
        return years + ' year' + numberEnding(years);
    }
    //TODO: Months! Maybe weeks?
    var days = Math.floor((temp %= 31536000) / 86400);
    if (days) {
        return days + ' day' + numberEnding(days);
    }
    var hours = Math.floor((temp %= 86400) / 3600);
    if (hours) {
        return hours + ' hour' + numberEnding(hours);
    }
    var minutes = Math.floor((temp %= 3600) / 60);
    if (minutes) {
        return minutes + ' minute' + numberEnding(minutes);
    }
    var seconds = temp % 60;
    if (seconds) {
        return seconds + ' second' + numberEnding(seconds);
    }
    return 'less than a second'; //'just now' //or other string you like;
}


  function timeFormatter(value) {
    var enable = $('#translation').val();
  	var date = new Date(value.time);
    var diff = Math.abs(date - new Date());
    var remaining = millisecondsToStr(diff);

    // Translate the time string if required
    if(enable === 'true') {
    	$.post('Watson',
      		{text: remaining},
      		function(data, status) {
      			if(status === 'success') {
      				remaining = data;
      			}
      			else {
      				alert('<%=res.getString("closed")%>');
      			}
      		});
     }

     return remaining;
  }

  function trainTimes(trains) {
  	for(var i = 0; i < trains.length; ++i) {
  		var remain = timeFormatter(trains[i]);
  		trains[i].time = remain;
  	}
  }

  function setupTrains(IdNum) {
  	// Remove all the entries from the table
    var tableId = '#table-trains' + IdNum;

    var jsonData = $('#accordion-item' + IdNum).data('station');
   	var station = JSON.parse(jsonData);

    $(tableId).bootstrapTable({
      	columns: [
      		{
      			field: "route",
      			title: "<%=res.getString("route")%>"
      		},
      		{
      			field: "time",
      			title: "<%=res.getString("time")%>"
      		},
      		{
      			field: "direction",
      			title: "<%=res.getString("direction")%>"
      		}
      	]
     });

     $(tableId).bootstrapTable('load', []);

     var enable = $('#translation').val();

     // Call the servlet to get back the trains for a station
     $.ajax({
     	url: 'Subway',
      	type: 'GET',
      	data: {station: station.id,
      		   enable: enable},
        success: function(data) {
        	for (var i = 0; i < data.length; ++i) {
        		trainTimes(data[i].N);
        		trainTimes(data[i].S);
        		$(tableId).bootstrapTable('append', data[i].N);
     			$(tableId).bootstrapTable('append', data[i].S);
        	}
        },
        error: function(xhr) {
        	alert('<%=res.getString("ny_mta_error")%>');
        },
        dataType: 'json',
        timeout: 30000,
      });
  }


  function setupTwitterEventSource(IdNum) {
    if (typeof(EventSource) !== 'undefined') {
      // Remove all the entries from the table
      var tableId = '#table-tweets' + IdNum;

      $(tableId).bootstrapTable({
      	columns: [
      		{
      			field: "screenName",
      			title: "<%=res.getString("screen_name_table")%>"
      		},
      		{
      			field: "tweet",
      			title: "<%=res.getString("message_table")%>"
      		}
      	]
      });

      $(tableId).bootstrapTable('load', []);

	  var enable = $('#translation').val();

      var jsonData = $('#accordion-item' + IdNum).data('station');
      var station = JSON.parse(jsonData);

      var source = new EventSource('Twitter?station=' + station.name + '&enable=' + enable);

      source.onmessage = function(event) {
        var tweet = JSON.parse(event.data);

        $(tableId).bootstrapTable('append', [{
        		screenName: tweet.screenName,
        		tweet: tweet.tweet.message}]);
      };

      source.onerror = function(event) {
      	alert('<%=res.getString("closed")%>');
      };

      source.addEventListener('finished', function(event) {
      	source.close();
      },false);

      } else {
      	alert('<%=StringEscapeUtils.escapeJavaScript(res.getString("sse_error"))%>');
    }
    return false;
  }


  function setupConceptEventSource(url) {
    if (typeof(EventSource) !== 'undefined') {
      var enable = $('#translation').val();
      var words = new Array();
      var source = new EventSource('Concept?url=' + url + '&enable=' + enable);

      // Cleanup the word cloud list
      $('#cloud').empty();

      source.onmessage = function(event) {
        var concept = JSON.parse(event.data);
        words.push({
          text: concept.concept,
          weight: concept.score
        });
      };

      source.onerror = function(event) {
      	alert('<%=res.getString("closed")%>');
      };

      source.addEventListener('finished', function(event) {
        for (i = 0; i < words.length; ++i) {
          $('#cloud').append('<span class="word-cloud" count="' + (words[i].weight * 100 | 0) + '">' + words[i].text + '</span>');
        }

        $('#cloud').jqTagCloud({
          maxSize: 32,
          minSize: 14
        });
        source.close();
      }, false);
    } else {
      alert('<%=StringEscapeUtils.escapeJavaScript(res.getString("sse_error"))%>');
    }
    return false;
  }


  function setupSentimentEventSource(IdNum) {
    if (typeof(EventSource) !== 'undefined') {
      var jsonData = $('#accordion-item' + IdNum).data('station');
      var station = JSON.parse(jsonData);

      var source = new EventSource('Sentiment?station=' + station.name);

      source.onmessage = function(event) {
        var sentiment = JSON.parse(event.data);
        if (sentiment.sentiment == "positive") {
          $('#badgePositive' + IdNum).text(sentiment.count);
        } else if (sentiment.sentiment === "negative") {
          $('#badgeNegative' + IdNum).text(sentiment.count);
        } else if (sentiment.sentiment === "neutral") {
          $('#badgeNeutral' + IdNum).text(sentiment.count);
        }
      };

      source.onerror = function(event) {
      	alert('<%=res.getString("closed")%>');
      };

      source.addEventListener('finished', function(event) {
        source.close();
      }, false);
    } else {
      alert('<%=StringEscapeUtils.escapeJavaScript(res.getString("sse_error"))%>');
    }
    return false;
  }


  // Load the translated string to show in the table when there is no data
  $.extend($.fn.bootstrapTable.defaults, {
  	formatNoMatches: function() {
            return '<%=res.getString("no_data")%>';
        }
    });

  // wait for the DOM to be loaded
  $(document).ready(function() {

    $('#translation').change(function() {
      $('#bestSellerList').trigger("change");
    });

    // When an accordion panel is opened make the request for the details
    $('#accordion').on('show.bs.collapse', function(e) {
      // Determine which accordion panel is open
      var IdNum = $('#' + e.target.id).data('number');
      setupTrains(IdNum);
      setupTwitterEventSource(IdNum);
      setupSentimentEventSource(IdNum);
    });

    // Initialize the select picker list
    $('.selectpicker').selectpicker();

    // Find the base template panel for the accordion
    var $template = $(".template");

    // Listen for the selection of the route list
    $('#routeList').change(function() {
      var list = $('#routeList').val();

      // If we have a selected item
      if(list !== "") {
        var conceptName = $('#routeList').find(":selected").data('url');
        setupConceptEventSource(conceptName);

        // remove all the old stations
      	$('#accordion').empty();

      	// Call the servlet to get back the stations for a route
      	$.ajax({
        	url: 'Subway',
      		type: 'GET',
      		data: {route: list},
      		beforeSend: function() {
      			// Show the loading gif
      			$('#ajax_loader').show();
      			// Hide the list of while we are updating
      			$('#accordion').hide();
      		},
        	success: function(data) {
        		for (var i = 0; i < data.length; ++i) {

        		    var $newPanel = $template.clone();
    				$newPanel.find(".collapse").removeClass("in");

    				$newPanel.find(".accordion-toggle").attr("id",  "anchor" + (i));
      				$newPanel.find(".accordion-toggle").attr("href",  "#accordion-item" + (i))
      					.text(data[i].name);
      				$newPanel.find(".panel-collapse").data("number", i);
      				$newPanel.find(".panel-collapse").attr("id", "accordion-item" + (i)).addClass("collapse").removeClass("in");
      				$newPanel.find("#badgePositive").attr("id", "badgePositive" + (i));
      				$newPanel.find("#badgeNeutral").attr("id", "badgeNeutral" + (i));
      				$newPanel.find("#badgeNegative").attr("id", "badgeNegative" + (i));
      				$newPanel.find("#table-tweets").attr("id", "table-tweets" + (i));
      				$newPanel.find("#table-trains").attr("id", "table-trains" + (i));

      				var value = JSON.stringify(data[i]);
        		    $newPanel.find('#accordion-item' + (i)).data('station', value);

        		    $("#accordion").append($newPanel.fadeIn());
        		}
        		// Show the list of stations
        		$('#accordion').show();
        	},
        	error: function(xhr) {
        		alert('<%=res.getString("ny_mta_error")%>');
        	},
        	complete: function() {
        		// Hide the loading gif
        		$('#ajax_loader').hide();
        	},
        	dataType: 'json',
        	timeout: 30000,
      	});

      }

    });

  });
  </script>
</body>

</html>
