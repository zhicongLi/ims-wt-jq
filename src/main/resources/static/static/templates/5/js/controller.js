$(function(){
    //指针图
    function p2Echarts(Array) {
     var myChart_p2 = echarts.init(document.getElementById('zzt')); 
        var dataArr = 66;
        option_p2 = {
            title: [{
                text: '当前预警指数',
                x: 'center',
                top: '75%',
                textStyle: {
                    color: '#333',
                    fontSize: 16,
                }
            }],
             series: [{
                    type: 'gauge',
                    splitNumber: 4,
                    radius: '90%',
                    center: ["50%", "60%"],
                    startAngle: 180,
                    endAngle: 0,
                    min: 0,
                    max: 100,
                    pointer: {
                        show: true,
                        width:8,
                        length: "80%",
                        borderColor:'#000',
                        borderWidth:'10',
                    },
                    itemStyle: {
                         normal:{
                            color: '#414141'
                         }
                    },
                    axisLine: {
                        show: true,
                        lineStyle: {
                            width: 20,
                            color: [
                                [0.3, '#0be06f'],
                                [0.5, '#f9f112'],
                                [0.7, '#fdbc17'],
                                [1, '#ff1716'],
                            ],
                            //borderColor:'#000',
                            //borderWidth:'5',
                        },
                    },
                    axisLabel: {
                        show: false,
                        color: "#414141",
                        fontSize: 16,
                        distance: -65,
                        formatter: function(value) {
                            return value.toFixed(0);
                        },
                    },
                    axisTick: {
                        show: false,

                    },          
                    splitLine: {
                        show: false,
                    },
                    detail: {
                        show: false,
                        color:'#414141',
                        fontSize: 24,
                        offsetCenter: [0, '25%'],
                    },
                    title: {
                        show: false
                    },
                    data: [{
                        value: 77,
                        name: ''
                    }],
                    z:99,

                },{
                    type: 'gauge',
                    splitNumber: 4,
                    radius: '100%',
                    center: ["50%", "60%"],
                    min: 0,
                    max: 100,
                    startAngle: 180,
                    endAngle: 0,
                    pointer: {
                        show: false,
                    },
                    axisLine: {
                        show: true,
                        lineStyle: {
                            width: 12,
                            color: [
                                [0.3, "#e0e6f1"],
                                [0.5, "#e0e6f1"],
                                [0.7, "#e0e6f1"],
                                [1, "#e0e6f1"],
                            ],
                        },
                    },
                    axisLabel: {
                        show: true,
                        color: "#414141",
                        fontSize: 16,
                        distance: -50,
                        formatter: function(value) {
                            return value.toFixed(0);
                        },
                    }, 
                    axisTick: {
                        show: false,
                    },         
                    splitLine: {
                        show: false,
                    }, 
                    detail: {
                        show: true,
                        color:'#414141',
                        fontSize: 24,
                        offsetCenter: [0, '25%'],
                    },
                    title: {
                        show: false
                    },
                    data: [{
                        value: 77,
                        name: ''
                    }],
                }]

        }
        myChart_p2.setOption(option_p2);
    }




    setTimeout(function () {
    window.onresize = function () { 
             var myChart_p2 = echarts.init(document.getElementById('zzt')); 
             myChart_p2.resize();
      }
    })
    p2Echarts();


}); 

