/**
 * @license e-Calendar v0.9.3
 * (c) 2014-2016 - Jhonis de Souza
 * License: GNU
 */

(function ($) {
	
    var eCalendar = function (options, object) {
        // Initializing global variables
        var adDay = new Date().getDate();
        var adMonth = new Date().getMonth();
        var adYear = new Date().getFullYear();
        var dDay = adDay;
        var dMonth = adMonth;
        var dYear = adYear;
        var instance = object;

        var settings = $.extend({}, $.fn.eCalendar.defaults, options);

        function lpad(value, length, pad) {
            if (typeof pad == 'undefined') {
                pad = '0';
            }
            var p;
            for (var i = 0; i < length; i++) {
                p += pad;
            }
            return (p + value).slice(-length);
        }

        var mouseOver = function () {
            $(this).addClass('c-nav-btn-over');
        };
        var mouseLeave = function () {
            $(this).removeClass('c-nav-btn-over');
        };
        var mouseOverEvent = function () {
            $(this).addClass('c-event-over');
            var d = $(this).attr('data-event-day');
            $('div.c-event-item[data-event-day="' + d + '"]').addClass('c-event-over');
        };
        var mouseLeaveEvent = function () {
            $(this).removeClass('c-event-over')
            var d = $(this).attr('data-event-day');
            $('div.c-event-item[data-event-day="' + d + '"]').removeClass('c-event-over');
        };
        var mouseOverItem = function () {
            $(this).addClass('c-event-over');
            var d = $(this).attr('data-event-day');
            $('div.c-event[data-event-day="' + d + '"]').addClass('c-event-over');
        };
        var mouseOnclick = function () {	
        	var date = dYear+"-"+(parseInt(dMonth)+1)+"-"+($(this).text()>9?$(this).text():"0"+$(this).text())+" 00:00:00";
        	newTabPage("工作详情",ctx+"/oa/oaWorkPlan/form?action=view&showList=0&planStartDate="+date,true);
        };
        var mouseLeaveItem = function () {
            $(this).removeClass('c-event-over')
            var d = $(this).attr('data-event-day');
            $('div.c-event[data-event-day="' + d + '"]').removeClass('c-event-over');
        };
        var nextMonth = function () {
            if (dMonth < 11) {
                dMonth++;
            } else {
                dMonth = 0;
                dYear++;
            }
            print();
        };
        var previousMonth = function () {
            if (dMonth > 0) {
                dMonth--;
            } else {
                dMonth = 11;
                dYear--;
            }
            print();
        };

        function loadEvents() {
            if (typeof settings.url != 'undefined' && settings.url != '') {
                $.ajax({url: settings.url,
                    async: false,
                    success: function (result) {
                    	var result = eval("(" + result + ")");
                        settings.events = result;
                    }
                });
            }
           // console.log(settings.events);
        }

        function print() {
            loadEvents();
            var dWeekDayOfMonthStart = new Date(dYear, dMonth, 1).getDay() - settings.firstDayOfWeek;
            if (dWeekDayOfMonthStart < 0) {
                dWeekDayOfMonthStart = 6 - ((dWeekDayOfMonthStart + 1) * -1);
            }
            var dLastDayOfMonth = new Date(dYear, dMonth + 1, 0).getDate();
            var dLastDayOfPreviousMonth = new Date(dYear, dMonth + 1, 0).getDate() - dWeekDayOfMonthStart + 1;

            var cBody = $('<div/>').addClass('c-grid');
            var cEvents = $('<div/>').addClass('c-event-grid');
            var cEventsBody = $('<div/>').addClass('c-event-body');
            cEvents.append($('<div/>').addClass('c-event-title c-pad-top').html(settings.eventTitle));
            cEvents.append(cEventsBody);
            var cNext = $('<div/>').addClass('c-next c-grid-title c-pad-top');
            var cMonth = $('<div/>').addClass('c-month c-grid-title c-pad-top');
            var cPrevious = $('<div/>').addClass('c-previous c-grid-title c-pad-top');
            cPrevious.html(settings.textArrows.previous);
            cMonth.html( dYear+ '年' + settings.months[dMonth]);
            cNext.html(settings.textArrows.next);

            cPrevious.on('mouseover', mouseOver).on('mouseleave', mouseLeave).on('click', previousMonth);
            cNext.on('mouseover', mouseOver).on('mouseleave', mouseLeave).on('click', nextMonth);

            cBody.append(cPrevious);
            cBody.append(cMonth);
            cBody.append(cNext);
            var dayOfWeek = settings.firstDayOfWeek;
            for (var i = 0; i < 7; i++) {
                if (dayOfWeek > 6) {
                    dayOfWeek = 0;
                }
                var cWeekDay = $('<div/>').addClass('c-week-day c-pad-top');
                cWeekDay.html(settings.weekDays[dayOfWeek]);
                cBody.append(cWeekDay);
                dayOfWeek++;
            }
            var day = 1;
            var dayOfNextMonth = 1;
            for (var i = 0; i < 42; i++) {
                var cDay = $('<div/>');
                cDay.on('dblclick',mouseOnclick);
                if (i < dWeekDayOfMonthStart) {
                    cDay.addClass('c-day-previous-month c-pad-top');
                    cDay.html(dLastDayOfPreviousMonth++);
                } else if (day <= dLastDayOfMonth) {
                    cDay.addClass('c-day c-pad-top');
                    if (day == dDay && adMonth == dMonth && adYear == dYear) {
                        cDay.addClass('c-today');
                    }
                    var cBadge = $('<span/>').addClass('mui-badge mui-badge-danger');
                    var cBadgeCount=0;
                    for (var j = 0; j < settings.events.length; j++) {
                    	var syear = settings.events[j].year;
                    	var smonth = settings.events[j].month;
                    	var sday = settings.events[j].day;
                    	var shour = settings.events[j].hour;
                        var d = new Date(syear, smonth-1, sday, shour);
                        if (d.getDate() == day && d.getMonth() == dMonth && d.getFullYear() == dYear) {
                            cDay.addClass('c-event').attr('data-event-day', d.getDate());
                            cDay.on('mouseover', mouseOverEvent).on('mouseleave', mouseLeaveEvent);
                            cBadgeCount++;

                        }
                    }
                    cDay.html(day++);
                    if(cBadgeCount>0){
                        cBadge.html(cBadgeCount);
                        cDay.append($('<BR>'));
                        cDay.append(cBadge);
                    }

                } else {
                    cDay.addClass('c-day-next-month c-pad-top');
                    cDay.html(dayOfNextMonth++);
                }

                cBody.append(cDay);
            }
            var eventList = $('<div/>').addClass('c-event-list');
            for (var i = 0; i < settings.events.length; i++) {
            	var syear = settings.events[i].year;
            	var smonth = settings.events[i].month;
            	var sday = settings.events[i].day;
            	var shour = settings.events[i].hour;
                var d = new Date(syear, smonth-1, sday, shour);
                if (d.getMonth() == dMonth && d.getFullYear() == dYear) {
                    //var date = lpad(d.getMonth() + 1, 2) + '-' + lpad(d.getDate(), 2) + ' ' + lpad(d.getHours(), 2) + ':' + lpad(d.getMinutes(), 2);
                	var date =lpad(d.getFullYear(), 4) + '-' + lpad(d.getMonth() + 1, 2) + '-' + lpad(d.getDate(), 2);
                    var item = $('<div/>').addClass('c-event-item');
                    var title = $('<div/>').addClass('title').html(date + '  ' + settings.events[i].title + '<br/>');
                    if(settings.events[i].description){
                    	var description = $('<div/>').addClass('description').html(settings.events[i].description + '<br/>');
                    }
                    item.attr('data-event-day', d.getDate());
                    item.on('mouseover', mouseOverItem).on('mouseleave', mouseLeaveItem);
                    if(settings.events[i].description){
                    	item.append(title).append(description);
                    }else{
                    	item.append(title).append("");
                    }
                    eventList.append(item);
                }
            }
            $(instance).addClass('calendar');
            cEventsBody.append(eventList);
            $(instance).html(cBody).append(cEvents);
        }

        return print();
    }

    $.fn.eCalendar = function (oInit) {
        return this.each(function () {
            return eCalendar(oInit, $(this));
        });
    };

    // plugin defaults
    $.fn.eCalendar.defaults = {
        weekDays: ['日', '一', '二', '三', '四', '五', '六'],
        months: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
        textArrows: {previous: '<', next: '>'},
        eventTitle: '工作安排',
        url: ctx+'/oa/oaWorkPlan/getMapData',
        events: [
            {title: '提醒', description: '<a style="color: red; "  >领导视察,必须交周报</a>', datetime: new Date(2016, new Date().getMonth(), 12, 17)},
            {title: '重要', description: '工作计划', datetime: new Date(2016, new Date().getMonth(), 23, 16)},
            {title: '重要', description: '同学聚会', datetime: new Date(2016, new Date().getMonth(), 23, 16)},
            {title: '一般', description: '<a style="color: red; " target="_blank" href="http://www.baidu.com">百度搜索菜谱1</a>', datetime: new Date(2016, new Date().getMonth(), 31, 16)},
            {title: '一般', description: '<a style="color: red; " target="_blank" href="http://www.baidu.com">百度搜索菜谱2</a>', datetime: new Date(2016, new Date().getMonth(), 31, 16)},
            {title: '一般', description: '<a style="color: red; " target="_blank" href="http://www.baidu.com">百度搜索菜谱3</a>', datetime: new Date(2016, new Date().getMonth(), 31, 16)},
            {title: '一般', description: '<a style="color: red; " target="_blank" href="http://www.baidu.com">百度搜索菜谱4</a>', datetime: new Date(2016, new Date().getMonth(), 31, 16)},
            {title: '一般', description: '<a style="color: red; " target="_blank" href="http://www.baidu.com">百度搜索菜谱5</a>', datetime: new Date(2016, new Date().getMonth(), 31, 16)},
            {title: '一般', description: '<a style="color: red; " target="_blank" href="http://www.baidu.com">百度搜索菜谱6</a>', datetime: new Date(2016, (new Date().getMonth()-4), 22, 16)},
            {title: '一般', description: '<a style="color: red; " target="_blank" href="http://www.baidu.com">百度搜索菜谱6</a>', datetime: new Date(2016, (new Date().getMonth()), 1, 16)}
        ],
        firstDayOfWeek: 1
    };

}(jQuery));
