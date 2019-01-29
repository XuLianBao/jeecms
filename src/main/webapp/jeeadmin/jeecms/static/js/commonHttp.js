var httpCommon={
    postAction: window.parent.postAction,
    ajaxAction:function (type,url,param,thenFunction,isAsync) {
        if(!isAsync){
            isAsync = true;
        }
        if(!type){
            type = "get";
        }
        var tempSign = "appId=1580387213331704&sessionKey="
                       +localStorage.getItem("sessionKey")
                       + "&nonceSt="
                       + window.parent.uploadSign;
        if(url.indexOf("?") ==-1){
            tempSign = "?"+tempSign;
        }
        $.ajax({
                   type: type,
                   url:url+tempSign,
                   data: param,
                   async: isAsync,
                   success: thenFunction
               });

    }
}