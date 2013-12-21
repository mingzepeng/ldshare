var browser = {
	refresh:function () {
		var str = window.location.toString();
		if (str.lastIndexOf('#') != -1) str = str.substring(0, str.length-1);
		window.location=str;
	},

	go:function (url,time){
		time = time || 2000;
		if(!url) 
			setTimeout(refreshself,time);
		else
			setTimeout("window.location.href = '"+url+"';",time);
	},

	getUrlParms :function (url){
		var args = new Object();
		var query = url ? url.substr(url.lastIndexOf('?')+1) : location.search.substring(1);
		var pairs = query.split("&");
		//在逗号处断开
		for (var i = 0; i < pairs.length; i++) {
		    var pos = pairs[i].indexOf('=');
		     //查找name=value
		    if (pos == -1) continue;
		    //如果没有找到就跳过
		    var argname = pairs[i].substring(0, pos);
		    //提取name
		    var value = pairs[i].substring(pos + 1);
		    //提取value
		    args[argname] = unescape(value);
		    //存为属性
		}
		//getUrlParms = function(){return args;}
		//return getUrlParms();
		return args;
	}
}