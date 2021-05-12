$(function(){

    function m1Echarts(Array) {
     var myChart_m1 = echarts.init(document.getElementById('yhfx1')); 
        option_m1 = {
            tooltip: {
                trigger: 'item',
                backgroundColor: 'rgba(0,0,0,0.7)',
                borderRadius: 6,
                borderWidth: 1,
                padding: 10,
                formatter: '{a}{b} : <br/>{c} ({d}%)',
                axisPointer: {
                   type: "shadow",
                   shadowStyle:{
                     color: "rgba(0,98,255,0.2)", 
                   }
                },
                textStyle: {
                     fontSize: 14,
                }, 
            },
            legend:{
                show:true,
                icon: "circle",  
            　　 itemWidth: 8,  
            　　 itemHeight: 8, 
            　　 itemGap: 20,           
                x:'center',  
                bottom:'0',
                data:['重大隐患','一般隐患'],
                textStyle:{
                    fontSize: 14,
                    color: "#6c6f76"
                }
            },
            series: [{
                name: '',
                type: 'pie',
                center: ['50%', '50%'],
                radius: ['32%', '48%'],
                clockwise: true,
                avoidLabelOverlap: true,
                hoverOffset: 5,
                label: {
                    show: true, 
                    normal: {
                        show: false, 
                    }
                },
                labelLine:{
                    normal: {
                       show: false, 
                    }
                },
                z:99,
                data:[{
                        value: 20,
                        name: '重大隐患',
                        itemStyle: {
                          normal: {
                                color: { 
                                    x: 0,
                                    y: 0,
                                    x2: 0,
                                    y2: 1,
                                    colorStops: [{
                                        offset: 0,
                                        color: '#fbb605'
                                    }, {
                                        offset: 1,
                                        color: '#fa9705' 
                                    }],
                                },
                          },
                        }   
                    },
                    {
                        value: 75,
                        name: '一般隐患',
                        itemStyle: {
                        normal: {
                                color: { 
                                    x: 0,
                                    y: 0,
                                    x2: 0,
                                    y2: 1,
                                    colorStops: [{
                                        offset: 0,
                                        color: '#0088f1'
                                    }, {
                                        offset: 1,
                                        color: '#0071c7' 
                                    }],
                                },
                          },
                        }                         
                    }],
                z:99
            }, {
                name: "",
                value: 100,
                type: "pie",
                radius: ['34%', '58%'],
                center: ["50%", "50%"],
                hoverAnimation: false,
                label: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: false
                    }
                },
                tooltip: {
                    show: false
                },                
                itemStyle: {
                    normal: {
                        color: 'rgba(232,236,242,0.51)'
                    },
                     emphasis: { 
                        color: 'rgba(232,236,242,0.51)' 
                    },
                },
                data: [{
                    name: '',
                    value: 100
                }]
        }]
        }
        myChart_m1.setOption(option_m1);
    }





    function m2Echarts(Array) {
     var myChart_m2 = echarts.init(document.getElementById('yhfx2')); 
        option_m2 = {
            tooltip: {
                trigger: 'item',
                backgroundColor: 'rgba(0,0,0,0.7)',
                borderRadius: 6,
                borderWidth: 1,
                padding: 10,
                formatter: '{a}{b} : <br/>{c} ({d}%)',
                axisPointer: {
                   type: "shadow",
                   shadowStyle:{
                     color: "rgba(0,98,255,0.2)", 
                   }
                },
                textStyle: {
                     fontSize: 14,
                }, 
            },
            legend:{
                show:true,
                icon: "circle", 
            　　 itemWidth: 8,  
            　　 itemHeight: 8, 
            　　 itemGap: 10,       
                x:'center',  
                bottom:'-2%',
                data:['设备设施','人身安全','电力安全','安全管理','其他事故'],
                textStyle:{
                    fontSize: 14,
                    color: "#6c6f76"
                }
            },
            series: [{
                name: '',
                type: 'pie',
                center: ['50%', '50%'],
                radius: ['32%', '48%'],
                clockwise: true,
                avoidLabelOverlap: true,
                hoverOffset: 5,
                label: {
                    show: true, 
                    normal: {
                       show: false, 
                    }
                },
                labelLine:{
                    normal: {
                       show: false, 
                    }
                },
                z:99,
                data:[{
                        value: 75,
                        name: '设备设施',
                        itemStyle: {
                          normal: {
                                color: { 
                                    x: 0,
                                    y: 0,
                                    x2: 0,
                                    y2: 1,
                                    colorStops: [{
                                        offset: 0,
                                        color: '#0c7ce8'
                                    }, {
                                        offset: 1,
                                        color: '#095cad' 
                                    }],
                                },
                          },
                        }   
                    },
                    {
                        value: 20,
                        name: '人身安全',
                        itemStyle: {
                          normal: {
                                color: { 
                                    x: 0,
                                    y: 0,
                                    x2: 0,
                                    y2: 1,
                                    colorStops: [{
                                        offset: 0,
                                        color: '#fbb505'
                                    }, {
                                        offset: 1,
                                        color: '#fa9805' 
                                    }],
                                },
                          },
                        }                         
                    },
                    {
                        value: 20,
                        name: '电力安全',
                        itemStyle: {
                          normal: {
                                color: { 
                                    x: 0,
                                    y: 0,
                                    x2: 0,
                                    y2: 1,
                                    colorStops: [{
                                        offset: 0,
                                        color: '#e53f58'
                                    }, {
                                        offset: 1,
                                        color: '#bf3347' 
                                    }],
                                },
                          },
                        }                         
                    },
                    {
                        value: 20,
                        name: '安全管理',
                        itemStyle: {
                          normal: {
                                color: { 
                                    x: 0,
                                    y: 0,
                                    x2: 0,
                                    y2: 1,
                                    colorStops: [{
                                        offset: 0,
                                        color: '#883ee3'
                                    }, {
                                        offset: 1,
                                        color: '#3919c9' 
                                    }],
                                },
                          },
                        }                         
                    },
                    {
                        value: 20,
                        name: '其他事故',
                        itemStyle: {
                          normal: {
                                color: { 
                                    x: 0,
                                    y: 0,
                                    x2: 0,
                                    y2: 1,
                                    colorStops: [{
                                        offset: 0,
                                        color: '#06e5bd'
                                    }, {
                                        offset: 1,
                                        color: '#03c46a' 
                                    }],
                                },
                          },
                        }                         
                    }],
                z:99
            }, {
                name: "",
                value: 100,
                type: "pie",
                radius: ['34%', '58%'],
                hoverAnimation: false,
                center: ["50%", "50%"],
                label: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: false
                    }
                },
                tooltip: {
                    show: false
                },                
                itemStyle: {
                    normal: {
                        color: 'rgba(232,236,242,0.51)'
                    },
                     emphasis: { 
                        color: 'rgba(232,236,242,0.51)' 
                    },
                },
                data: [{
                    name: '',
                    value: 100
                }]
        }]
        }
        myChart_m2.setOption(option_m2);
    }




    function m3Echarts(Array) {
     var myChart_m3 = echarts.init(document.getElementById('yhfx3')); 
        option_m3 = {
            tooltip: {
                trigger: 'item',
                backgroundColor: 'rgba(0,0,0,0.7)',
                borderRadius: 6,
                borderWidth: 1,
                padding: 10,
                formatter: '{a}{b} : <br/>{c} ({d}%)',
                axisPointer: {
                   type: "shadow",
                   shadowStyle:{
                     color: "rgba(0,98,255,0.2)", 
                   }
                },
                textStyle: {
                     fontSize: 14,
                }, 
            },
            legend:{
                show:true,
                icon: "circle",  
            　　 itemWidth: 8,  
            　　 itemHeight: 8, 
            　　 itemGap: 20,           
                x:'center',  
                bottom:'0',
                data:['未整改','已整改'],
                textStyle:{
                    fontSize: 14,
                    color: "#6c6f76"
                }
            },
            series: [{
                name: '',
                type: 'pie',
                center: ['50%', '50%'],
                radius: ['32%', '48%'],
                clockwise: true,
                avoidLabelOverlap: true,
                hoverOffset: 5,
                label: {
                    normal: {
                        show: false, 
                    }
                },
                labelLine:{
                    normal: {
                       show: false, 
                    }
                },
                z:99,
                data:[{
                        value: 25,
                        name: '未整改',
                        itemStyle: {
                          normal: {
                                color: { 
                                    x: 0,
                                    y: 0,
                                    x2: 0,
                                    y2: 1,
                                    colorStops: [{
                                        offset: 0,
                                        color: '#fbb605'
                                    }, {
                                        offset: 1,
                                        color: '#fa9705' 
                                    }],
                                },
                          },
                        }   
                    },
                    {
                        value: 70,
                        name: '已整改',
                        itemStyle: {
                          normal: {
                                color: { 
                                    x: 0,
                                    y: 0,
                                    x2: 0,
                                    y2: 1,
                                    colorStops: [{
                                        offset: 0,
                                        color: '#0088f1'
                                    }, {
                                        offset: 1,
                                        color: '#0071c7' 
                                    }],
                                },
                          },
                        }                         
                    }],
                z:99
            }, {
                name: "",
                value: 100,
                type: "pie",
                radius: ['34%', '58%'],
                center: ["50%", "50%"],
                hoverAnimation: false,
                label: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: false
                    }
                },
                tooltip: {
                    show: false
                },                
                itemStyle: {
                    normal: {
                        color: 'rgba(232,236,242,0.51)'
                    },
                     emphasis: { 
                        color: 'rgba(232,236,242,0.51)' 
                    },
                },
                data: [{
                    name: '',
                    value: 100
                }]
        }]
        }
        myChart_m3.setOption(option_m3);
    }






    function m4Echarts(Array) {
     var myChart_m4 = echarts.init(document.getElementById('zxjhtjfx')); 
        option_m4 = {
            tooltip: {
                trigger: 'axis',
                backgroundColor: 'rgba(0,0,0,0.7)',
                borderColor: '#0062ff',
                borderRadius: 6,
                borderWidth: 1,
                padding: 10,
                axisPointer: {
                   type: "shadow",
                   shadowStyle:{
                     color: "rgba(0,98,255,0.2)", 
                   }
                },
                textStyle: {
                 fontSize: 14,
              }, 
            },
            grid: {
                top:"10%",
                left: '0%',
                right: '2%',
                bottom: '12%',
                containLabel: true
            },
            legend:{
                show:true,
                icon: "circle",  
            　　 itemWidth: 8,  
            　　 itemHeight: 8, 
            　　 itemGap: 20,           
                x:'center',  
                data:['公司级检查','部门级检查'],
                textStyle:{
                    fontSize: 14,
                    color: "#6c6f76"
                }
            },

            xAxis: [{
                type: 'category',
                axisLine: {
                    show: false,  
                },
                splitLine: {
                    show: false,                 
                },
                axisLabel: {
                    textStyle: {
                        fontSize: 14,
                        color: '#76808d',
                        fontFamily: '思源',
                    }
                },
                axisTick: {
                    show: false
                },
                 data: ['1','2','3','4','5','6','7','8','9','10','11','12']
            }],
            yAxis: [{
                type: 'value',
                axisLine:{
                    show:false
                },
                axisTick:{
                   show:false  
                },
                axisLabel: {
                    show:true,
                    formatter: '{value}',
                    color:'#76808d',
                    fontSize: 14,
                },
                splitLine: {
                    show:false,
                }
            }],
            series: [{
                name:'公司级检查',
                type: 'line',
                symbol:'circle',
                showSymbol: false,
                lineStyle: {
                  normal: {
                     width: 2,
                     shadowBlur: 3,
                     shadowColor: 'rgba(0,136,241,0.15)',
                     shadowOffsetY: 8
                  }
                },
                itemStyle: {
                    normal: {
                        color: '#008ef2',
                        areaStyle: { 
                            color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
                                offset: 0,
                                color: 'rgba(0,136,241,0)'
                            }, {
                                offset: 1,
                                color: 'rgba(0,136,241,0.15)'
                            }]),
                        }
                    },
                },                
                data: [{
                    "value": 3
                }, {
                    "value": 6
                },{
                    "value": 10
                }, {
                    "value": 6
                },{
                    "value": 1
                }, {
                    "value": 6
                }, {
                    "value": 6
                },{
                    "value": 10
                }, {
                    "value": 6
                },{
                    "value": 1
                }, {
                    "value": 6
                }]
            },
            {
                name:'部门级检查',
                lineStyle: {
                  normal: {
                     width: 2,
                     shadowBlur: 3,
                     shadowColor: 'rgba(109,39,242,0.15)',
                     shadowOffsetY: 8
                  }
                },                
                type: 'line',
                symbol:'circle',
                showSymbol: false,
                itemStyle: {
                    normal: {
                        color: '#521de9',
                        areaStyle: { 
                            color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
                                offset: 0,
                                color: 'rgba(109,39,242,0)'
                            }, {
                                offset: 1,
                                color: 'rgba(109,39,242,0.15)'
                            }]),
                        }                        
                    },
                },                 
                data: [{
                    "value": 5
                }, {
                    "value": 2
                },{
                    "value": 2
                }, {
                    "value": 1
                },{
                    "value": 6
                }, {
                    "value": 3
                }, {
                    "value": 2
                },{
                    "value": 2
                }, {
                    "value": 1
                },{
                    "value": 6
                }, {
                    "value": 3
                }, {
                    "value": 2
                }]
            }
        ]

        }
        myChart_m4.setOption(option_m4);
    }







    setTimeout(function () {
         window.onresize = function () {
             var myChart_m1 = echarts.init(document.getElementById('yhfx1')); 
             var myChart_m2 = echarts.init(document.getElementById('yhfx2'));  
             var myChart_m3 = echarts.init(document.getElementById('yhfx3')); 
             var myChart_m4 = echarts.init(document.getElementById('zxjhtjfx'));  
             myChart_m1.resize(); 
             myChart_m2.resize(); 
             myChart_m3.resize(); 
             myChart_m4.resize();
         }
    })
    m1Echarts();
    m2Echarts();
    m3Echarts();
    m4Echarts();
}); 
