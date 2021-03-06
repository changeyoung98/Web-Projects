var statCategoryAPI = contextPath + '/admin/api/stat/category';
var statBookAPI = contextPath + '/admin/api/stat/book';
var statUserAPI = contextPath + '/admin/api/stat/user';

$(document).ready(function () {
    var theday = new Date();
    var currentDate = theday.format('yyyy-mm-dd');
    theday.setDate(theday.getDate() - 7);
    var weekAgoDate = theday.format('yyyy-mm-dd');
    $('#filterCategoryStartDate').val(weekAgoDate);
    $('#filterCategoryEndDate').val(currentDate);
    $('#filterBookStartDate').val(weekAgoDate);
    $('#filterBookEndDate').val(currentDate);
    $('#filterUserStartDate').val(weekAgoDate);
    $('#filterUserEndDate').val(currentDate);
});

$('#filterBook').keydown(function (event) {
    if (event.keyCode == 13)
        return false;
});

$('#filterUser').keydown(function (event) {
    if (event.keyCode == 13)
        return false;
});

$('#btnFilterCategory').click(function () {
    var getData = {
        'categoryId': $('#filterCategory').val(),
        'startDate': $('#filterCategoryStartDate').val(),
        'endDate': $('#filterCategoryEndDate').val()
    };
    $('#filterCategoryHR').removeClass('hidden');
    $('#filterCategoryStatus').removeClass('hidden');
    $('#filterCategoryResult').addClass('hidden');
    $('#filterCategoryStatus').html(shortProcessingText('Searching...'));
    $.get(statCategoryAPI, getData, function (data, status) {
        $('#filterCategoryStatus').addClass('hidden');
        $('#filterCategoryResult').removeClass('hidden');
        $('#filterCategoryPerson').text('Number of bought：' + data[0]);
        $('#filterCategoryQuantity').text('Total sales：' + data[1]);
        $('#filterCategoryPrice').html('Total amount：&#65509;' + (data[2] / 100.0).toFixed(2));
    }).fail(function (xhr, status, error) {
        $('#filterCategoryStatus').removeClass('hidden');
        $('#filterCategoryResult').addClass('hidden');
        $('#filterCategoryStatus').html(shortFailText(tryJSONParse(xhr.responseText).msg || error));
    });
});

$('#btnFilterBook').click(function () {
    var getData = {
        'bookId': $('#filterBook').val(),
        'startDate': $('#filterBookStartDate').val(),
        'endDate': $('#filterBookEndDate').val()
    };
    $('#filterBookHR').removeClass('hidden');
    $('#filterBookStatus').removeClass('hidden');
    $('#filterBookResult').addClass('hidden');
    $('#filterBookStatus').html(shortProcessingText('Searching...'));
    $.get(statBookAPI, getData, function (data, status) {
        $('#filterBookStatus').addClass('hidden');
        $('#filterBookResult').removeClass('hidden');
        $('#filterBookPerson').text('Number of bought：' + data[0]);
        $('#filterBookQuantity').text('Total sales：' + data[1]);
        $('#filterBookPrice').html('Total amount：&#65509;' + (data[2] / 100.0).toFixed(2));
    }).fail(function (xhr, status, error) {
        $('#filterBookStatus').removeClass('hidden');
        $('#filterBookResult').addClass('hidden');
        $('#filterBookStatus').html(shortFailText(tryJSONParse(xhr.responseText).msg || error));
    });
});

$('#btnFilterUser').click(function () {
    var getData = {
        'username': $('#filterUser').val(),
        'startDate': $('#filterUserStartDate').val(),
        'endDate': $('#filterUserEndDate').val()
    };
    $('#filterUserHR').removeClass('hidden');
    $('#filterUserStatus').removeClass('hidden');
    $('#filterUserResult').addClass('hidden');
    $('#filterUserStatus').html(shortProcessingText('Searching...'));
    $.get(statUserAPI, getData, function (data, status) {
        $('#filterUserStatus').addClass('hidden');
        $('#filterUserResult').removeClass('hidden');
        $('#filterUserOrders').text('Number of orders：' + data[0]);
        $('#filterUserItems').text('Number of items：' + data[1]);
        $('#filterUserQuantity').text('Number of bought：' + data[2]);
        $('#filterUserPrice').html('Total amount：&#65509;' + (data[3] / 100.0).toFixed(2));
    }).fail(function (xhr, status, error) {
        $('#filterUserStatus').removeClass('hidden');
        $('#filterUserResult').addClass('hidden');
        $('#filterUserStatus').html(shortFailText(tryJSONParse(xhr.responseText).msg || error));
    });
});