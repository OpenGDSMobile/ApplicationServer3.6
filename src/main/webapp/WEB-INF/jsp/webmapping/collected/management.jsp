<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width" />

    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/humane/libnotify.css"/>
    <link rel="stylesheet" href="css/collected/main.css"/>
    <link rel="stylesheet" href="css/collected/modal-center.css"/>

    <script type="text/javascript"  src="js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
    <script type="text/javascript"  src="js/bootstrap/bootstrap.min.js"></script>


	<script type="text/javascript" src="js/humane/humane.min.js"/></script>


    <script>
    	var contextRoot ='${pageContext.request.contextPath}' + '/';
    </script>
 
    <script src="js/collected/management.js"></script>

    <title>Dashboard for Open Data Management</title>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#siderbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span>Dashboard for</span>
                <span class="blue">Open Data</span>
                <span>Management</span>
            </a>
        </div>
    </div>
</nav>
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <div class="brand"><img src="images/logo_hansung.png" width="120px"/></div>
        <ul class="nav menu">
            <li class="active">
                <a href="./ODM_Dashboard.do">
                    <span class="glyphicon glyphicon-off icon"></span>
                    <span>Dashboard</span>
                </a>
            </li>
            <li>
                <a href="./ODM_Management.do">
                    <span class="glyphicon glyphicon-scale icon"></span>
                    <span>Collect Management Process</span>
                </a>
            </li>
            <li class="parent">
                <a href="#">
                    <span data-toggle="collapse" href="#sub-item-1">
                        <span class="glyphicon glyphicon-chevron-down icon"></span>
                        <span>Visualization</span>
                    </span>
                </a>
                <ul class="children collapse" id="sub-item-1">
                    <li>
                        <a href="./ODM_Original.do">
                            <span class="glyphicon glyphicon-list-alt icon"></span>
                            <span>Source</span>
                        </a>
                    </li>
                    <li>
                        <a href="./ODM_Chart.do">
                            <span class="glyphicon glyphicon-signal icon"></span>
                            <span>Chart</span>
                        </a>
                    </li>
                    <li>
                        <a href="./ODM_Map.do">
                            <span class="glyphicon glyphicon-globe icon"></span>
                            <span>Map</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

    <div class="row" style="padding-bottom: 20px;">
        <h1>Collection management of open data</h1>
    </div>

    <div class="row">
        <div style="padding-bottom: 10px; margin-left:20px; margin-right:20px;">
            <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-text="Add"
                    data-header='Add Collect Public Data' data-target="#infoModal">Add public data</button>
        </div>
        <div class="table-responsive">
            <table class="table" id="managementTable">
                <thead>
                <tr>
                    <th>Name of open data</th>
                    <th>Provider</th>
                    <th>End-Point</th>
                    <th>Time(Per)</th>
                    <th>Parameters</th>
                    <th>Collecting</th>
                    <th>Edit</th>
                </tr>
                </thead>
                <tbody>
                <!--
                  <tr>&lt;!&ndash;test data&ndash;&gt;
                      <td>1</td>
                      <td>Seoul Environment in Korea</td>
                      <td>Seoul</td>
                      <td>data.seoul.go.kr</td>
                      <td>http://openAPI.seoul.go.kr:8088</td>
                      <td>1 Hour</td>
                      <td>ON</td>
                  </tr>
                 -->
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel">
    <!--<div class="modal-dialog" role="document">-->
    <div class="vertical-alignment-helper">
        <div class="modal-dialog vertical-align-center">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="infoModalTitle">Add Public Data</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <label for="modalName">Name of open data (Collection Name) :</label>
                        <div style="margin-left:10px;"><input type="text" class="form-control" id="modalName"/></div>
                    </div>
                    <div class="row">
                        <label for="modalVisName">Name of visualization :</label>
                        <div style="margin-left:10px;"><input type="text" class="form-control" id="modalVisName"/></div>
                    </div>
                    <div class="row">
                        <label for="modalProvider">Provider :</label>
                        <div style="margin-left:10px;"><input type="text" class="form-control" id="modalProvider"/></div>
                    </div>
                    <div class="row">
                        <label for="modalUrl">Provider URL :</label>
                        <div style="margin-left:10px;"><input type="text" class="form-control" id="modalUrl"/></div>
                    </div>
                    <div class="row">
                        <label for="modalEp">Collection end-point :</label>
                        <div style="margin-left:10px;"><input type="text" class="form-control" id="modalEp"/></div>
                    </div>
                    <div class="row">
                        <label for="modalTime">Time (unit: minute) :</label>
                        <div style="margin-left:10px;"><input type="text" class="form-control" id="modalTime"/></div>
                    </div>
                    <div class="row">
                        <label for="modalKeys">Parameters :</label>
                        <div style="margin-left:10px;"><input type="text" class="form-control" id="modalKeys"/></div>
                    </div>
                    <div class="row">
                        <label for="modalComment">Remark :</label>
                        <div style="margin-left:10px;"><textarea class="form-control" row="5" id="modalComment"></textarea></div>
                    </div>
                    <div class="row">
                        <label for="modalStatus">Collecting stage :</label>
                        <select class="form-control" id="modalStatus">
                            <option value="true">True</option>
                            <option value="false">False</option>
                        </select>
                    </div>
                    <div class="row">
                        <label for="modalType">Request Type :</label>
                        <select class="form-control" id="modalType">
                            <option value=""></option>
                            <option value="GeoData">GeoData</option>
                            <option value="JSON">JSON</option>
                            <option value="XML">XML</option>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btn-save" id="saveBtn">Add </button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>