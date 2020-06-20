<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxWeatherCall.aspx.cs" Inherits="WeatherAPI.AjaxWeatherCall" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h3>Get weather data using jQuery.getJSON() method</h3>
    <br />
    <p>Please enter the details of city weather to check </p>
    City:
    <input id="cityName" />

    <br />
    Number of days:
    <input id="numOfdays" type="number" />
    <br />
    <input type="button" id="getWeatherButton" value="Get Weather" />

    <table id="resultBox">
    </table>

    <style>
        #getWeatherButton {
            margin-top: 10px;
        }

        input {
            margin-top: 8px;
        }

        #resultBox {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 70%;
            margin: auto;
        }

            #resultBox td, #resultBox th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #resultBox tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            #resultBox tr:hover {
                background-color: #ddd;
            }

            #resultBox th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }
    </style>

    <script src="Scripts/jquery-3.3.1.min.js"></script>

<script>

    $('#getWeatherButton').on('click', getWeatherData);

    function getWeatherData() {
        var cityName = $(`#cityName`).val();
        var apiKey = "****************************";
        var numOfdays = $(`#numOfdays`).val();
        // build URI:
        var uri = "http://api.worldweatheronline.com/premium/v1/weather.ashx?" + "&key=" + apiKey + "&q=" + cityName + "&format=json&no_of_days=" + numOfdays + "&includeLocation=yes";
        uri = encodeURI(uri);
        var $tableheader = $(`<thead>Weather in ${cityName} for ${numOfdays} Day(s)</thead>`);
        $('#resultBox').append($tableheader);

        var $tableCol = $(`<tr><th>Highest Temprature (Celcius)</th><th>Lowest Temprature (Celcius)</th><th>Date</th></tr>`);
        $('#resultBox').append($tableCol);
        $.getJSON(uri).done(function (responseData) {
            var weatherData = responseData.data.weather;
            var $tablerow;
            for (index = 0; index < weatherData.length; index++) {
                maxTemperatureInCelcius = weatherData[index].maxtempC;
                minTemperatureInCelcius = weatherData[index].mintempC;
                weatherDate = weatherData[index].date;
                $tablerow = $(`<tr><td>${maxTemperatureInCelcius}</td><td>${minTemperatureInCelcius}</td><td>${weatherDate}</td></tr>`);
                $('#resultBox').append($tablerow);
            }
        });
    }
</script>

</body>
</html>