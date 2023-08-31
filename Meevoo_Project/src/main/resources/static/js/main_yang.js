(function ($) {
    "use strict";


    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Sidebar Toggler
    $('.sidebar-toggler').click(function () {
        $('.sidebar, .content').toggleClass("open");
        return false;
    });


    // Progress Bar
    $('.pg-bar').waypoint(function () {
        $('.progress .progress-bar').each(function () {
            $(this).css("width", $(this).attr("aria-valuenow") + '%');
        });
    }, {offset: '80%'});


    // Calender
    $('#calender').datetimepicker({
        inline: true,
        format: 'L'
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        items: 1,
        dots: true,
        loop: true,
        nav : false
    });
    
    
    
    
    
    
    
//=== 회원 그래프 그리기 ===========================================================================================
//     $(".fa-twitter").click(function () {     //이 function을 빼면 클릭 없이 바로 넘어간다
		
		var data1;
		var data2;
		var data3;
	    
		//ajax구문
		$.ajax({
			url: "/admin/adminStatic3",
			type: "post",
			data: {
				
			},
			success: function(data) {
			   //console.log(data);
               //alert("성공" + data);
               
                var data1 = data.data1;
                var data2 = data.data2;
                var data3 = data.data3;
               
               
               var ctx1 = $("#worldwide-sales").get(0).getContext("2d");
				var myChart1 = new Chart(ctx1, {
					type: "bar",
					data: {
						
						labels: ["2023.01","2023.02", "2023.03", "2023.04", "2023.05", "2023.06", "2023.07"],
						datasets: [{
							label: "신규회원수",
							data: data1,
							backgroundColor: "rgba(0, 156, 255, .7)"
						},
						{
							label: "탈퇴회원수",
							data: data2,
							backgroundColor: "rgba(0, 156, 255, .5)"
						},
						{
							label: "총 회원수",
							data: data3,
							backgroundColor: "rgba(0, 156, 255, .3)"
						}
						]
					},
					options: {
						responsive: true
					}
				});
               

			},//success
			error: function() {
            alert("실패");
            
			}//error
			
		});//ajax
//	});//click
//==회원그래프 END=====================================================================================================

//== 게시물 그래프 그리기 START ==========================================================================================
    // Salse & Revenue Chart
    // $(".fa-twitter").click(function () {
		
		var wdata1;
		var wdata2;
	    
		//ajax구문
		$.ajax({
			url: "/admin/adminStatic4",
			type: "post",
			data: {
				
			},
			success: function(data) {
			   console.log(data);
               
                var wdata1 = data.wdata1;
                var wdata2 = data.wdata2;
                //alert(wdata1);
               
                var ctx2 = $("#salse-revenue").get(0).getContext("2d");
			    var myChart2 = new Chart(ctx2, {
			        type: "line",
			        data: {
			            labels: ["2023.01","2023.02", "2023.03", "2023.04", "2023.05", "2023.06", "2023.07"],
			            datasets: [{
			                    label: "모임 게시물",
			                    data: wdata1,
			                    backgroundColor: "rgba(0, 156, 255, .5)",
			                    fill: true
			                },
			                {
			                    label: "시설 리뷰",
			                    data: wdata2,
			                    backgroundColor: "rgba(0, 156, 255, .3)",
			                    fill: true
			                }
			            ]
			            },
			        options: {
			            responsive: true
			        }
			    });
               

			},//success
			error: function() {
            alert("실패");
            
			}//error
			
		});//ajax
	//});//click
//== 게시물 그래프 그리기 END ==========================================================================================   
    
    
    
    
//== 오른쪽 하단 그래프 그리기 - 모임게시물 START ==========================================================================================   
    
        var dcclist;
	    
		//ajax구문
		$.ajax({
			url: "/admin/adminStatic5",
			type: "post",
			data: {
				
			},
			success: function(data) {
			   console.log(data);
               //alert("성공");
               //alert("data1 : "+data);
                var dcclist = data;
               //alert("data2 : "+dcclist[0].golf_count);    => 리스트 0번째의 ~값 을 찍어야 나온다....
                
               // Doughnut Chart
			    var ctx6 = $("#doughnut-chart").get(0).getContext("2d");
			    var myChart6 = new Chart(ctx6, {
			        type: "doughnut",
			        data: {
			            labels: ["골프", "농구", "배드민턴", "볼링", "스케이트", "클라이밍", "탁구", "테니스", "풋살"],
			            datasets: [{
			                backgroundColor: [
			                    "rgba(0, 156, 255, .7)",
			                    "rgba(0, 156, 255, .6)",
			                    "rgba(0, 156, 255, .5)",
			                    "rgba(0, 156, 255, .4)",
			                    "rgba(0, 156, 255, .3)"
			                ],
			                data: [dcclist[0].golf_count, dcclist[0].basketball_count, dcclist[0].badminton_count, dcclist[0].bowling_count, dcclist[0].skate_count,
			                       dcclist[0].climbing_count,dcclist[0].pingpong_count,dcclist[0].tennis_count,dcclist[0].soccer_count]
			            }]
			        },
			        options: {
			            responsive: true,
						plugins: {
							legend: {
								position: "left"
							}
						}
			        }
			    });
               

			},//success
			error: function() {
            alert("실패");
            
			}//error
			
		});//ajax
    
 //== 오른쪽 하단 그래프 그리기 - 모임게시물 END ==========================================================================================   
    
//== 오른쪽 하단 그래프 그리기 - 모임게시물 2222222222 START ==========================================================================================   
        var dcclist;
	    
		//ajax구문
		$.ajax({
			url: "/admin/adminStatic5",
			type: "post",
			data: {
				
			},
			success: function(data) {
			   console.log(data);
               //alert("성공");
               //alert("data1 : "+data);
                var dcclist = data;
               //alert("data2 : "+dcclist[0].golf_count);    => 리스트 0번째의 ~값 을 찍어야 나온다....
                
               // Doughnut Chart
			    var ctx6 = $("#doughnut-chart2222").get(0).getContext("2d");
			    var myChart6 = new Chart(ctx6, {
			        type: "doughnut",
			        data: {
			            labels: ["골프", "농구", "배드민턴", "볼링", "스케이트", "클라이밍", "탁구", "테니스", "풋살"],
			            datasets: [{
			                backgroundColor: [
			                    "rgba(0, 156, 255, .7)",
			                    "rgba(0, 156, 255, .6)",
			                    "rgba(0, 156, 255, .5)",
			                    "rgba(0, 156, 255, .4)",
			                    "rgba(0, 156, 255, .3)"
			                ],
			                data: [dcclist[0].golf_count, dcclist[0].basketball_count, dcclist[0].badminton_count, dcclist[0].bowling_count, dcclist[0].skate_count,
			                       dcclist[0].climbing_count,dcclist[0].pingpong_count,dcclist[0].tennis_count,dcclist[0].soccer_count]
			            }]
			        },
			        options: {
			            responsive: true,
						plugins: {
							legend: {
								position: "left"
							}
						}
			        }
			    });
               

			},//success
			error: function() {
            alert("실패");
            
			}//error
			
		});//ajax
 //== 오른쪽 하단 그래프 그리기 - 모임게시물 222222222 END ==========================================================================================   
    
    
 //== 오른쪽 탭 메뉴 그리기 START ==========================================================================================   
  $(function(){
  $('.tabcontent > div').hide();
  $('.tabnav a').click(function () {
    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
    $('.tabnav a').removeClass('active');
    $(this).addClass('active');
    return false;
  }).filter(':eq(0)').click();
  });
    
 //== 오른쪽 탭 메뉴 그리기 END ==========================================================================================   
    
    
    
    
    
    
    
    
    
})(jQuery);



