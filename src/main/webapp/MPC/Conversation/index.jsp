<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
 
<html lang="en"> 
 
<head>
        <meta charset="utf-8" />
        <title>Conversations</title>
         
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css" />
         <link href="resources/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
         
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="resources/css/datatables.min.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
        
        <link href="resources/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="resources/css/plugins.min.css" rel="stylesheet" type="text/css" />  
          <style>
.modal {
	text-align: center;
	padding: 0 !important;
}

.modal:before {
	content: '';
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	margin-right: -4px;
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
</style>

        
         </head> 
    <body>
      
              
            
                <!-- BEGIN SIDEBAR -->
                <div class="page-sidebar-wrapper">
                    
                <div class="page-content-wrapper">
                    <!-- BEGIN CONTENT BODY -->
                    
                        <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                <div class="portlet box blue">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-globe"></i>Conversations Screen</div>
                                    </div>
                                    <div class="portlet-body">
							<form action="addConversation" id="addConversation" method="post">
                                    <div class="col-sm-12 table-bordered">
                                    <div class="row">
                                        <div class="form-group col-sm-2">
                                            <label for="single" class="control-label">Select Topic</label>
                                            <select id="single" name ="topicName" class="form-control select2" required = "required">
                                                <option>Select Topic</option>
                                                    <c:forEach var="conversationTopicInfo" items="${conversationTopicInfo}">
                                                    	<option value="${conversationTopicInfo.topicName}">${conversationTopicInfo.topicName}</option>
                                                    </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-2">
                                            <label for="single" class="control-label">Select Sub Topic</label>
                                            <select id="single" name ="subTopicName" class="form-control select2" required = "required">
                                                <option>Select Sub Topic</option>
                                                    <c:forEach var="conversationSubTopicInfo" items="${conversationSubTopicInfo}">
                                                    	<option value="${conversationSubTopicInfo.subTopicName}">${conversationSubTopicInfo.subTopicName}</option>
                                                    </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-2">
                                            <label for="multiple"  class="control-label">Select User</label>
                                            <select id="multiple" name ="userlist" required="required" class="form-control select2-multiple" multiple>
                                               <option>Select User</option>
                                                    <c:forEach var="userInfo" items="${userInfo}">
                                                    	<option value="${userInfo.userName}">${userInfo.userName}</option>
                                                    </c:forEach>
                                            </select>
                                        </div>
                                        </div>
                                        <div class="row">
                                        <div class="form-group col-sm-8">
                                                    <label>Write your Content</label>
                                                    <textarea placeholder="Write Your Content" name ="conversationContent" class="form-control" rows="3"></textarea>
                                                   
                                          </div>
                                          <div class="form-group col-sm-8">
                                          <button type="submit" class="btn blue">Send</button>
                                          <button type="rest" class="btn blue">Clear</button>
                                          </div>
                                        </div>
                                        </div>
                                        </form>
                                        <table class="table table-striped table-bordered table-hover " width="100%" id="sample_4" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th class="all">Group / User</th>
                                                    <th class="min-phone-l">Date / Time</th>
                                                    <th class="min-tablet">Vessel Name</th>
                                                    <th class="min-tablet">QC No.</th>
                                                    <th class="min-tablet">alert</th>
                                                    <th class="all">Comment</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="conversationInfo" items="${conversationInfo}">
                                                <tr>
                                                    	<td>${conversationInfo.user.userName}</td>
                                                    	<td>${conversationInfo.startedDate}</td>
                                                    	<td>${conversationInfo.topic.vesselName}</td>
                                                    	<td>${conversationInfo.topic.qcno}</td>
                                                    	<c:choose>
                                                    		<c:when test="${conversationInfo.topic.alertNo eq 1}">
                                                    			<td style="font-size: 24px; color:green;"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></td>
                                                    		</c:when>
                                                    		<c:when test="${conversationInfo.topic.alertNo eq 2}">
                                                    			<td style="font-size: 24px; color:yellow;"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></td>
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    			<td style="font-size: 24px; color:red;"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></td>
                                                    		</c:otherwise>
                                                    	</c:choose>
                                                    	<td><button type="button" class="btn blue" data-toggle="modal" data-target="#${conversationInfo.conversationId}">Comment</button>
                                                    
                                                    </td>
                                                    <div class="modal fade" id="${conversationInfo.conversationId}" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title text-center">Add Your Comment</h4>
								</div>
								<form action="commentConversation" class="commentConversation"
									method="post">
									<input type="hidden" name="ConversationId" value="${conversationInfo.conversationId}"/>
									<div class="modal-body">
										<div class="col-sm-4">
											<div class="form-group">
                                            	<label for="single" class="control-label">Select Topic</label>
                                            	<input type="text" name="topicName"
												autocomplete="off" value="${conversationInfo.topic.topicName}" readonly="readonly"
												required="required" class="form-control" />
                                        	</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
                                            	<label for="single" class="control-label">Select Sub Topic</label>
                                            	<input type="text" name="topicName"
												autocomplete="off" value="${conversationInfo.subtopic.subTopicName}" readonly="readonly"
												required="required" class="form-control" />
                                        	</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
                                            	<label for="multiple"  class="control-label">Select User</label>
                                            <select id="multiple" name ="userlist" class="form-control select2-multiple" multiple>
                                               <option value="">Select User</option>
                                                    <c:forEach var="userInfo" items="${userInfo}">
                                                    	<option value="${userInfo.userName}">${userInfo.userName}</option>
                                                    </c:forEach>
                                            </select>
                                        	</div>
										</div>
										<div class="form-group">
											<label>Enter Comment Content</label>
                                              <textarea placeholder="Enter Comment Contentt" 
                                              name ="conversationcommentContent" class="form-control" rows="3">
                                              </textarea>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">Save
											Comment</button>
									</div>
								</form>
							</div>
						</div>
					</div>
                                                    </tr>
                                                    </c:forEach>
                                                
                                                 
                                                
                                            </tbody>
                                            <tfoot> 
                                            	
                                                <tr>
                                                    <th class="all">Group / User</th>
                                                    <th class="min-phone-l">Date / Time</th>
                                                    <th class="min-tablet">Vessel Name</th>
                                                    <th class="min-tablet">QC No.</th>
                                                    <th class="min-tablet">alert</th>
                                                    <th class="all">Comment</th>
                                                </tr>
                                                <tr>
                                                   <th class="all"><button type="submit" class="btn blue">Filter By</button></th>
                                                    <th class="min-tablet"></th>
                                                    <th class="min-tablet">
                                                   
                                                    </th>
                                                    <th class="min-tablet"></th>
                                                    <th class="min-tablet"></th>
                                                    <th class="min-tablet"></th>
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
                 
        <!-- BEGIN CORE PLUGINS -->
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
      
 <script type="text/javascript">
$(document).ready(function(){
	$("#addConversation").submit(function(){
	    var formData = new FormData($(this)[0]);
	    var formURL = $(this).attr("action");
	    $.ajax({
	        url: formURL,
	        type: 'POST',
	        data: formData,
	        async: false,
	        success: function (response) {
	        	if(response.status == "Success")
		         {
	        		alert("Updated");
	        		/*  setTimeout(function(){
	    				location.href="findAllPartner"} , 2000); */
	        		location.reload();
	    		}      		
		         
	        	else{
	        		alert("Error");
		        	}
	        },
	        cache: false,
	        contentType: false,
	        processData: false
	    });

	    return false;
	});

	$(".commentConversation").submit(function(){
	    var formData = new FormData($(this)[0]);
	    var formURL = $(this).attr("action");
	    $.ajax({
	        url: formURL,
	        type: 'POST',
	        data: formData,
	        async: false,
	        success: function (response) {
	        	if(response.status == "Success")
		         {
	        		alert("Updated");
	        		/* setTimeout(function(){
	    				location.href="findAllPartner"} , 2000); */
	    		}      		
		         
	        	else{
	        		alert("Error");
		        	}
	        },
	        cache: false,
	        contentType: false,
	        processData: false
	    });

	    return false;
	});
});
</script>
</body>


 
</html>