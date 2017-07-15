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
    <link rel="stylesheet" th:href="@{/static/css/chart.css}"/>

    <script th:src="@{/static/js/jquery/jquery.min.js}"/>
    <script th:src="@{/static/js/bootstrap/bootstrap.min.js}"/>
    <script th:src="@{/static/js/bootstrap-select/bootstrap-select.min.js}"/>


    <script th:src="@{/static/js/humane/humane.min.js}"/>
    <script th:src="@{/static/js/d3/d3.min.js}"/>
    <script th:src="@{/static/js/opengdsmobile/openGDSMobile-2.0.js}"/>

    <script th:inline="javascript">
        var contextRoot = /*[[@{/}]]*/ '';
    </script>

    <script th:src="@{/static/js/chart.js}"/>

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
        <h1 th:text="#{chart.title}">Data Visualization (Chart) </h1>
    </div>
    <div class="col-sm-12 col-lg-6">
        <h2 th:text="#{chart.step1}"> Step 1: Selecting open data</h2>
        <select class="selectpicker" data-style="btn-primary" id="collectName" data-width="100%"
                title="Select public data">
        </select>
    </div>
    <div class="col-sm-12 col-lg-6">
        <h2  th:text="#{chart.step2}"> Step 2: Selecting period of open data</h2>
        <select class="selectpicker" data-style="btn-info" id="collectStartTime" data-width="47%"
                title="Select start date" disabled="disabled" data-size="4">
        </select>
        <span> ~ </span>
        <select class="selectpicker" data-style="btn-info" id="collectEndTime" data-width="47%"
                title="Select end date" disabled="disabled" data-size="4">
        </select>
    </div>
    <div class="col-sm-12 col-lg-12">
        <h2 th:text="#{chart.step3}"> Step 3: Selecting key/value </h2>
        <div style="margin-bottom:5px;">
            <select class="selectpicker" data-style="btn-success" id="collectDataKey" data-width="98.5%"
                    title="Select data key" disabled="disabled" data-size="4">
            </select>
        </div>
        <!--selectpicker-->
        <select class="bs-select-hidden" data-style="btn-success" id="collectSearchKey" data-width="14%"
                title="Select Search Key" data-size="4">
        </select>

        <select class="bs-select-hidden" data-style="btn-success" id="collectSearchValue" data-width="14%"
                title="Select Search Value" data-size="4">
        </select>

        <select class="selectpicker" data-style="btn-success" id="collectKey" data-width="21%"
                title="Select Chart Label" disabled="disabled" data-size="4">
        </select>

        <select class="selectpicker" data-style="btn-success" id="collectValue" data-width="49%"
                title="Select Chart Value" disabled="disabled" data-size="4">
        </select>
    </div>

    <div class="col-sm-12 col-lg-12">
        <h2  th:text="#{chart.step4}">Step 4: Selecting chart type</h2>
        <select class="selectpicker" data-style="btn btn-outline-primary" id="chartType" data-width="49%"
                title="Select chart">
            <option value="vBar" th:text="#{chart.vbar}">Vertical Bar</option>
            <option value="hBar" th:text="#{chart.hbar}">Horizontal Bar</option>
            <option value="line" th:text="#{chart.line}">Line</option>
            <option value="area" th:text="#{chart.area}">Area</option>
        </select>
        <button id="visStart" type="button" class="btn btn-warning" data-text="Visualization" style="width:49%;"
                th:text="#{chart.button1}">Show visualization</button>

    </div>

    <div class="row">
        <div class="col-sm-12 col-lg-12">
            <h2 th:text="#{chart.result}">Show Result</h2>
            <div style="height:600px; outline: 1px solid #CCCCCC; padding: 5px; margin: 5px;" id="resultDiv">
                <pre id="jsonResult" >

                </pre>
                <div id="chartVis" style="width:95%; height:500px;">

                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>