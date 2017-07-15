<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name ="ctx" th:content="${#httpServletRequest.getContextPath()}" />
    <meta name="viewport" content="width=device-width" />

    <link rel="stylesheet" th:href="@{/static/css/bootstrap/bootstrap.min.css}"/>
    <link rel="stylesheet" th:href="@{/static/css/bootstrap-select/bootstrap-select.min.css}"/>
    <link rel="stylesheet" th:href="@{/static/css/humane/libnotify.css}"/>
    <link rel="stylesheet" th:href="@{/static/css/main.css}"/>
    <link src="stylesheet" th:href="@{/static/css/ol3/ol.css}"/>

    <script th:src="@{/static/js/jquery/jquery.min.js}"/>
    <script th:src="@{/static/js/bootstrap/bootstrap.min.js}"/>
    <script th:src="@{/static/js/bootstrap-select/bootstrap-select.min.js}"/>


    <script th:src="@{/static/js/humane/humane.min.js}"/>
    <script th:src="@{/static/js/d3/d3.min.js}"/>
    <script th:src="@{/static/js/proj4/proj4.js}"/>
    <script th:src="@{/static/js/proj4/EPSGdefs.js}"/>


    <script th:src="@{/static/js/ol3/ol-debug.js}"/>
    <script th:src="@{/static/js/geojson.min.js}"/>
    <script th:src="@{/static/js/opengdsmobile/openGDSMobile-2.0.js}"/>


    <script th:inline="javascript">
        var contextRoot = /*[[@{/}]]*/ '';

    </script>

    <script th:src="@{/static/js/map.js}"/>

    <title th:text="#{common.title}">Dashboard for Open Data Management</title>
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
            <a class="navbar-brand" href="#"><span th:text="#{common.title_1}">Dashboard for</span>
                <span class="blue" th:text="#{common.title_2}">Open Data</span>
                <span th:text="#{common.title_3}">Management</span>
            </a>
        </div>
    </div>
</nav>
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <div class="brand"><img th:src="@{/static/images/logo_hansung.png}" width="120px"/></div>
        <ul class="nav menu">
            <li class="active">
                <a href="./ODM_Dashobard.do">
                    <span class="glyphicon glyphicon-off icon"></span>
                    <span th:text="#{common.menu.dashboard}">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="./ODM_Management.do">
                    <span class="glyphicon glyphicon-scale icon"></span>
                    <span th:text="#{common.menu.cm}">Collect Management Process</span>
                </a>
            </li>
            <li class="parent">
                <a href="#">
                    <span data-toggle="collapse" href="#sub-item-1">
                        <span class="glyphicon glyphicon-chevron-down icon"></span>
                        <span th:text="#{common.menu.vis}">Visualization</span>
                    </span>
                </a>
                <ul class="children collapse" id="sub-item-1">
                    <li>
                        <a href="./ODM_Original.do">
                            <span class="glyphicon glyphicon-list-alt icon"></span>
                            <span th:text="#{common.menu.src}">Source</span>
                        </a>
                    </li>
                    <li>
                        <a href="./ODM_Chart.do">
                            <span class="glyphicon glyphicon-signal icon"></span>
                            <span th:text="#{common.menu.chart}">Chart</span>
                        </a>
                    </li>
                    <li>
                        <a href="./ODM_Map.do">
                            <span class="glyphicon glyphicon-globe icon"></span>
                            <span th:text="#{common.menu.map}">Map</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row" style="padding-bottom: 20px;">
        <h1 th:text="#{map.title}">Data visualization (Map) </h1>
    </div>
    <div class="row" style="margin-bottom:20px;">
        <h2 th:text="#{map.step1}">Selecting geo-based data</h2>
        <select class="selectpicker" data-style="btn-primary" id="geoBasedName" data-width="95%"
                title="GeoServer or Public Data" data-size="10">
            <optgroup label="GeoServer" id="selectGeoServer">

            </optgroup>
            <optgroup label="Public Data" id="selectPublicData">

            </optgroup>
        </select>
    </div>
    <div class="row" id="addValues"  style="margin-bottom:20px;">
        <select class="bs-select-hidden add-values" data-style="btn-success" id="latValue" data-width="35%"
                title="Select latitude field" data-size="4">
        </select>

        <select class="bs-select-hidden add-values" data-style="btn-success" id="longValue" data-width="35%"
                title="Select longitude field" data-size="4">
        </select>

        <select class="bs-select-hidden add-values" data-style="btn-success" id="typeValue" data-width="10%"
                title="Select data type" data-size="4">
            <option value="point">point</option>
            <option value="polygon">polygon</option>
        </select>

        <select class="bs-select-hidden add-values" data-style="btn-success" id="coordValue" data-width="15%"
                title="Select coordinate type(EPSG)" data-size="4">
            <option value="EPSG:3857">EPSG:3857(Spherical Mercator)</option>
            <option value="EPSG:4326">EPSG:4326(WGS84)</option>
        </select>

    </div>

    <div class="row" >
        <div id="visMap" style="width:95%; height: 500px;">

        </div>
    </div>

</div>
</body>
</html>