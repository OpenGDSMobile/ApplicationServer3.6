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
    <link rel="stylesheet" th:href="@{/static/css/original.css}"/>

    <script th:src="@{/static/js/jquery/jquery.min.js}"/>
    <script th:src="@{/static/js/bootstrap/bootstrap.min.js}"/>
    <script th:src="@{/static/js/bootstrap-select/bootstrap-select.min.js}"/>


    <script th:src="@{/static/js/humane/humane.min.js}"/>

    <script th:inline="javascript">
        var contextRoot = /*[[@{/}]]*/ '';
    </script>

    <script th:src="@{/static/js/original.js}"/>

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
        <h1 th:text="#{original.title}">Data Visualization (Original) </h1>
    </div>
    <div class="row" style="padding-bottom: 20px;">
        <div class="col-sm-12 col-lg-6">
            <h2 th:text="#{original.step1}"> Step 1: Selecting open data</h2>
            <select class="selectpicker" data-style="btn-primary" id="collectName" data-width="100%"
                    title="Select public data">

            </select>
        </div>
        <div class="col-sm12 col-lg-6">
            <h2 th:text="#{original.step2}"> Step 2: Selecting date of open data</h2>
            <select class="selectpicker" data-style="btn-info" id="collectDate" data-width="100%"
                    title="Select collect date" disabled="disabled" data-size="10">

            </select>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 col-lg-12">
            <h2 th:text="#{original.result}">Show result</h2>
            <pre id="jsonResult">

            </pre>
        </div>
    </div>


</div>
</body>
</html>