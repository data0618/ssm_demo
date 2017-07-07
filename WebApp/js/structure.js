/**
 * 
 */
$(document).ready(function() {

});

function unfoldDept(deptId) {
	var ul = $("#dept_" + deptId).find('ul');
	if (ul.find('li').length > 0) {
		ul.html('');
		return;
	}
	$.get('departmentUser?deptId=' + deptId, {}, function(data, status) {
		if ('success' == status) {
			var html = "";
			$.each(data.userList, function(index, item) {
				html += '<li id="user_' + item.id + '">';
				html += '<a href="#" onclick="unfoldUser(' + item.id + ');">';
				html += item.userName + '</a></li>';
			});
			ul.html('').append(html);
		}
	});
}

function unfoldUser(userId) {
	$.get('userDeatil?userId=' + userId, {}, function(data, status) {
		if ('success' == status) {
			var user = data.userDetail;
			var html = '<div>';
			html += '<label>姓名：' + user.userName + '</label></br>';
			html += '<label>年龄：' + user.age + '</label></br>';
			html += '<label>职务：' + user.role + '</label></br>';
			html += '<label>权限：' + user.operation + '</label></br>';
			html += '</div>';
			$(".right").html('').append(html);
		}
	});

}