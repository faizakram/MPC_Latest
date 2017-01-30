<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
 
<html lang="en"> 
 
<head>
        <meta charset="utf-8" />
        <title>Trending Topics</title>
        
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css" />
         <link href="resources/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
         
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="resources/css/datatables.min.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
        
        <link href="resources/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="resources/css/plugins.min.css" rel="stylesheet" type="text/css" />  
        </head>

    <body>
        <div>
              
            <div class="page-container">
                <!-- BEGIN SIDEBAR -->
                <div class="page-sidebar-wrapper">
                    
                <div class="page-content-wrapper">
                    <!-- BEGIN CONTENT BODY -->
                    <div> 
                        <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                <div class="portlet box blue">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-globe"></i>Trending Topics</div>
                                    </div>
                                    <div class="portlet-body">

                                    
                                        <table class="table table-striped table-bordered table-hover " width="100%" id="sample_4" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th class="all">Topic</th>
                                                    <th class="min-phone-l">Sub Topic</th>
                                                    <th class="min-tablet">Started On</th>
                                                    <th class="min-tablet">Followed From Date</th>
                                                    <th class="min-tablet">No. Of Conv</th>
                                                    <th class="all">Follow or Removed</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                             <c:forEach var="conversationInfo" items="${conversationInfo}">
                                                <tr>
                                                    <td>${conversationInfo.topic.topicName}</td>
                                                    <td>${conversationInfo.subtopic.subTopicName}</td>
                                                    <td>2011/07/25</td>
                                                    <td>2011/07/25</td>
                                                    <td>${conversationInfo.conversationcomments.size()}</td>
                                                    <td> 
                                                    <button type="submit" class="btn blue">View</button>
                                                    <button type="submit" class="btn blue">Follow</button>
                                                    </td>
                                                </tr>
                                               </c:forEach>
                                            </tbody>
                                            <tfoot> 
                                                <tr>
                                                    <th class="all">Topic</th>
                                                    <th class="min-phone-l">Sub Topic</th>
                                                    <th class="min-tablet">Started On</th>
                                                    <th class="none">Followed From Date</th>
                                                    <th class="none">No. Of Conv</th>
                                                    <th class="all">Follow or Removed</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                            
                        </div>
                    </div>
                    <!-- END CONTENT BODY -->
                </div>
                 
        <script src="resources/js/jquery.min.js" type="text/javascript"></script>
        <script src="resources/js/datatable.js" type="text/javascript"></script>
        <script src="resources/js/datatables.min.js" type="text/javascript"></script>
        <script src="resources/js/datatables.bootstrap.js" type="text/javascript"></script>
        <script src="resources/js/table-datatables-responsive.min.js" type="text/javascript"></script>
        <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/js/select2.full.min.js" type="text/javascript"></script>
        <script src="resources/js/app.min.js" type="text/javascript"></script>
        <script src="resources/js/components-select2.min.js" type="text/javascript"></script> 
        <script src="resources/js/quick-nav.min.js" type="text/javascript"></script>
</body>
 
</html>