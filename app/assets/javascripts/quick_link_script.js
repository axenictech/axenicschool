	$(document).ready(function(){
		
		$("#expanderHead").click(function(){
		$("#expanderContent").slideToggle();
		if ($("#expanderSign").text() == "+"){
			$("#expanderSign").html("−")
		}
		else {
			$("#expanderSign").text("+")
		}
	});

 
var detailmenu = [{
        name: 'Student Details',
        
        title: 'create button',
        fun: function () {
         
        }
    }, {
        name: 'Admission',
        
        title: 'update button',
        fun: function () {
            alert('i am update button')
        }
    }    ];
 

 $('#details').contextMenu(detailmenu,{
        triggerOn: 'hover'});


var settingsmenu = [{
        name: 'Manage course',
        
        title: 'create button',
        fun: function () {
            alert('i am add button')
        }
    }, {
        name: 'Manage batch',
        
        title: 'update button',
        fun: function () {
            alert('i am update button')
        }
    }, {
        name: 'Student category',
        
        title: 'update button',
        fun: function () {
            alert('i am update button')
        }
	}, {
        name: 'Manage Subject',
        
        title: 'update button',
        fun: function () {
            alert('i am update button')
        }
	}, {
        name: 'General Settings',
        
        title: 'update button',
        fun: function () {
            alert('i am update button')
        }
	}

    ];
 
$("#settings").contextMenu(settingsmenu,{
        triggerOn: 'hover'});





		});
	


