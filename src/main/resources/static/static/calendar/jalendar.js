
$(function () {    
    (function ($) {
        $.fn.jalendar = function (options) {
            
            var settings = $.extend({
                customDay: new Date(),
                color: '#65c2c0',
                lang: 'EN'
            }, options);
            
            // Languages            
            var dayNames = {};
            var monthNames = {};
            var lAddEvent = {};
            var lAllDay = {};
            var lTotalEvents = {};
            var lEvent = {};
      
            //设置星期
            dayNames['EN'] = new Array('星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日');         
            //设置月份
            monthNames['EN'] = new Array('1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月');
            //输入框提示信息
            lAddEvent['EN'] = '请输入待办事项';
            //显示本月有几项待办信息                     
            lTotalEvents['EN'] = '这个月待办事项: ';
            
            lEvent['EN'] = 'Event(s)';
            lAllDay['EN'] = 'All Day';
            
            var $this = $(this);
            var div = function (e, classN) {
                return $(document.createElement(e)).addClass(classN);
            };
            
            var clockHour = [];//提醒小时
            var clockMin = [];//提醒分钟
            for (var i=0;i<24;i++ ){//小时
                clockHour.push(div('div', 'option').text(i))
            }
            for (var i=0;i<59;i+=5 ){//分钟
                clockMin.push(div('div', 'option').text(i))
            }
            
            // HTML Tree 添加右侧的待办事项
            $this.append(
                div('div', 'wood-bottom'), 
                div('div', 'jalendar-wood').append(
                    //2018-1-4修改		
                    /*div('div', 'close-button'),*/  //右上角隐藏按钮
                    div('div', 'jalendar-pages').append(//左侧整个部分
                        div('div', 'pages-bottom'),
                        div('div', 'header').css('background-color', '#88ABC6').append(//显示年月和星期
                            div('a', 'prv-m'),//左边时间小箭头
                            div('h1'),//年月
                            div('a', 'nxt-m'),//右边时间小箭头
                            div('div', 'day-names')//显示星期几
                        ),
                        //可以忽略
                        div('div', 'total-bar').html( lTotalEvents[settings.lang] + '<b style="color: '+settings.color+'"></b>'+"项"),
                        div('div', 'days')
                    ),
                    //右侧显示的主菜单add-event
                    div('div', 'add-event').append(
                        //右侧上半部分（输入框和时间）
                        div('div', 'add-new').append(
                            '<input type="text" select="select" placeholder="' + lAddEvent[settings.lang] + '" value="' + lAddEvent[settings.lang] + '" />',
                            div('div', 'submit'),//添加待办事项
                            div('div', 'clear'),//清除浮动的干扰
                            div('div', 'add-time').append(//待办时间
                                div('div', 'disabled'),
                                div('div', 'select').addClass('hour').css('background-color', settings.color).append(
                                    div('span').text('00'),
                                    div('div', 'dropdown').append(clockHour)//下拉框添加小时
                                ),
                                div('div', 'left').append(':'),
                                div('div', 'select').addClass('min').css('background-color', settings.color).append(
                                    div('span').text('00'),
                                    div('div', 'dropdown').append(clockMin)//下拉框添加小时
                                )
                            ),
                            div('div', 'all-day').append(
                                div('fieldset').attr('data-type','disabled').append(
                                    div('div', 'check').append(
                                        div('span', '')
                                    ),
                                    div('label').text(lAllDay[settings.lang])
                                )
                            ),
                            div('div', 'clear')//清除浮动的干扰
                        ),
                        //右侧下半部分显示总的事项和详情
                        div('div', 'events').append(
                            div('h3','').append(                            
                                div('span', '').html('<b></b> ' + "条待办事项")
                            ),
                            div('div', 'gradient-wood'),
                            div('div', 'events-list') 
                        )
                    )
                )
            );
           
            
            // Adding day boxes 添加日期
            for (var i = 0; i < 42; i++) {
                $this.find('.days').append(div('div', 'day'));
            }
            
            // Adding day names fields 添加星期
            for (var i = 0; i < 7; i++) {
                $this.find('.day-names').append(div('h2').text(dayNames[settings.lang][i]));
            }

            var d = new Date(settings.customDay);
            var year = d.getFullYear();
            var date = d.getDate();
            var month = d.getMonth();
            
            var isLeapYear = function(year1) {
                var f = new Date();
                f.setYear(year1);
                f.setMonth(1);
                f.setDate(29);
                return f.getDate() == 29;
            };
        
            var feb;
            var febCalc = function(feb) { 
                if (isLeapYear(year) === true) { feb = 29; } else { feb = 28; } 
                return feb;
            };
            var monthDays = new Array(31, febCalc(feb), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

           
            function calcMonth() {

                monthDays[1] = febCalc(feb);                
                var weekStart = new Date();
                weekStart.setFullYear(year, month, 0);
                var startDay = weekStart.getDay();  
                
                $this.find('.header h1').html(monthNames[settings.lang][month] + ' ' + year);
        
                $this.find('.day').html('&nbsp;');
                $this.find('.day').removeClass('this-month');
                for (var i = 1; i <= monthDays[month]; i++) {
                    startDay++;
                    $this.find('.day').eq(startDay-1).addClass('this-month').attr('data-date', i+'/'+(month+1)+'/'+year).html(i);
                }
                if ( month == d.getMonth() ) {
                    $this.find('.day.this-month').removeClass('today').eq(date-1).addClass('today').css('color', settings.color);
                } else {
                    $this.find('.day.this-month').removeClass('today').attr('style', '');
                }
                
                // added event  添加待办事项
                $this.find('.added-event').each(function(i){
                    $(this).attr('data-id', i);
                    $this.find('.this-month[data-date="' + $(this).attr('data-date') + '"]').append(
                        div('div','event-single').attr('data-id', i).append(
                            div('p','').text($(this).attr('data-title')),
                            div('div','details').append(
                                div('div', 'clock').text($(this).attr('data-time')),
                                div('div', 'erase')
                            )
                        )
                    );
                    $this.find('.day').has('.event-single').addClass('have-event').prepend(div('i',''));
                  
                });
                
                
                
                
             
                //给含有待办事项的日期添加一个待办事项数目的提示
                /*var num=$this.find('.day').find('.events .event-single').length;
                console.log("含有"+num);*/
                
                /*$this.find('.day').has('.event-single').append(
                  	  div('span','matter').text("2")  
                     )*/
                calcTotalDayAgain();  
                
            }
            
           
            calcMonth();
           
            //左右小箭头
            var arrows = new Array ($this.find('.prv-m'), $this.find('.nxt-m'));
            //右侧时间
            var dropdown = new Array ($this.find('.add-time .select span'), $this.find('.add-time .select .dropdown .option'), $this.find('.add-time .select'));
            var allDay = new Array ('.all-day fieldset[data-type="disabled"]', '.all-day fieldset[data-type="enabled"]');
            var $close = $this.find('.jalendar-wood > .close-button');
            var $erase = $this.find('.event-single .erase');
            $this.find('.jalendar-pages').css({'width' : $this.find('.jalendar-pages').width() });
            $this.find('.events').css('height', ($this.height()-152) );//右侧高度设定
            $this.find('.events').css('width', '320px' );//右侧宽度设定
            $this.find('.select .dropdown .option').hover(function() {
                $(this).css('background-color', settings.color); 
            }, function(){
                $(this).css('background-color', 'inherit'); 
            });
            var jalendarWoodW = $this.find('.jalendar-wood').width();
            var woodBottomW = $this.find('.wood-bottom').width();

            // calculate for scroll
            function calcScroll() {
                if ( $this.find('.events-list').height() < $this.find('.events').height() ) { $this.find('.gradient-wood').hide(); $this.find('.events-list').css('border', 'none') } else { $this.find('.gradient-wood').show(); }
            }
            
            // Calculate total event again
            function calcTotalDayAgain() {
                var eventCount = $this.find('.this-month .event-single').length;
                $this.find('.total-bar b').text(eventCount);
                $this.find('.events h3 span b').text($this.find('.events .event-single').length)
            }
            
            function prevAddEvent() {
                $this.find('.day').removeClass('selected').removeAttr('style');
                $this.find('.today').css('color', settings.color);
                $this.find('.add-event').hide();
                $this.children('.jalendar-wood').animate({'width' : jalendarWoodW}, 200);
                $this.children('.wood-bottom').animate({'width' : woodBottomW}, 200);
                $close.hide();
            }
            
            arrows[1].on('click', function () {//右侧小箭头事件
                if ( month >= 11 ) {
                    month = 0;
                    year++;
                } else {
                    month++;   
                }
                calcMonth();
                prevAddEvent();
                //添加右侧显示的内容
                var eventSingle = $(this).find('.event-single');
                $this.find('.add-event').show().find('.events-list').html(eventSingle.clone());
            });
            arrows[0].on('click', function () {//左侧小箭头事件
                dayClick = $this.find('.this-month');
                if ( month === 0 ) {
                    month = 11;
                    year--;
                } else {
                    month--;   
                }
                calcMonth();
                prevAddEvent();
                //添加右侧显示内容
                var eventSingle = $(this).find('.event-single');
                $this.find('.add-event').show().find('.events-list').html(eventSingle.clone());
            });
            
            //点击当前日期显示右侧待办事项
            $this.on('click', '.this-month', function () {            	
                var eventSingle = $(this).find('.event-single');
                $this.find('.events .event-single').remove();
                prevAddEvent();
                $(this).addClass('selected').css({'background-color': settings.color});
              //2018-1-4修改
               /* $this.children('.jalendar-wood, .wood-bottom').animate({width : '+=300px' }, 200, function() {*/
                    $this.find('.add-event').show().find('.events-list').html(eventSingle.clone());
                    $this.find('.add-event').show().find('.close-button').css('display','none');
                    $this.find('.add-new input').select();
                    calcTotalDayAgain();
                    calcScroll();
                    $close.show();//关闭的按钮显示
                //2018-1-4修改  
                /*});*/
            });

            //右侧待办事项     选择时间
            dropdown[0].click(function(){
                dropdown[2].children('.dropdown').hide(0);
                $(this).next('.dropdown').show(0);
            });
            dropdown[1].click(function(){
                $(this).parent().parent().children('span').text($(this).text());
                dropdown[2].children('.dropdown').hide(0);
            });
            $('html').click(function(){
                dropdown[2].children('.dropdown').hide(0); 
            });
            $('.add-time .select span').click(function(event){
                event.stopPropagation(); 
            });
            
            $this.on('click', allDay[0], function(){
                $(this).removeAttr('data-type').attr('data-type', 'enabled').children('.check').children().css('background-color', settings.color);
                dropdown[2].children('.dropdown').hide(0);
                $(this).parents('.all-day').prev('.add-time').css('opacity', '0.4').children('.disabled').css('z-index', '10');
            });
            $this.on('click', allDay[1], function(){
                $(this).removeAttr('data-type').attr('data-type', 'disabled').children('.check').children().css('background-color', 'transparent');
                $(this).parents('.all-day').prev('.add-time').css('opacity', '1').children('.disabled').css('z-index', '-1');
            });
            
            // add new event with panel 添加一个新的待办事项的ID标记
            var dataId = parseInt($this.find('.total-bar b').text());
            //动态添加待办事项
            $this.find('.submit').on('click', function(){
                var title = $(this).prev('input').val();//输入框的信息
                var hour = $(this).parents('.add-new').find('.hour > span').text();
                var min = $(this).parents('.add-new').find('.min > span').text();
                var isAllDay = $(this).parents('.add-new').find('.all-day fieldset').attr('data-type');
                var isAllDayText = $(this).parents('.add-new').find('.all-day fieldset label').text();
                var thisDay = $this.find('.day.this-month.selected').attr('data-date');
                var time;
                if ( isAllDay == 'disabled' ) {
                    time = hour + ':' + min;
                } else {
                    time = isAllDayText;
                }
                $this.prepend(div('div', 'added-event').attr({'data-date':thisDay, 'data-time': time, 'data-title': title, 'data-id': dataId}));
                
                $this.find('.day.this-month.selected').prepend(
                    div('div','event-single').attr('data-id', dataId).append(
                        div('p','').text(title),
                        div('div','details').append(
                            div('div', 'clock').text(time),
                            div('div', 'erase')
                        )
                    )
                );
                $this.find('.day').has('.event-single').addClass('have-event').prepend(div('i',''));
                $this.find('.events-list').html($this.find('.day.this-month.selected .event-single').clone())
                $this.find('.events-list .event-single').eq(0).hide().slideDown();
                calcTotalDayAgain();
                calcScroll();
                // scrolltop after adding new event
                $this.find('.events-list').scrollTop(0);
                // form reset
                $this.find('.add-new > input[type="text"]').val(lAddEvent[settings.lang]).select();
                dataId++;
                //每次新增一个事项时先清除之前的span
               // $this.find('.day .matter').remove();
                //给含有待办事项的日期添加一个待办事项数目的提示
               /* $this.find('.day').has('.event-single').append(
                  	  div('span','matter').text($this.find('.events .event-single').length)  
                     )*/
            });
            
          //2018-1-4修改
           /* $close.on('click', function(){
                prevAddEvent(); 
            });*/
            
            // delete event 删除
            $this.on('click', '.event-single .erase', function(){
                $('div[data-id=' + $(this).parents(".event-single").attr("data-id") + ']').animate({'height': 0}, function(){ 
                    $(this).remove();
                    calcTotalDayAgain();
                    calcScroll();
                });
            });

        };

    }(jQuery));

});

