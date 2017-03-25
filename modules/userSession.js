function getSession(req){
    sess=req.session;
    return sess;
}

function setSessionId(session, id){
    session.userId = id;
}

function getSessionId(session){
    return session.userId;
}

function checkIfConnected(req){
    return getSession(req).userId;
}





module.exports.getSession = getSession;
module.exports.setSessionId = setSessionId;
module.exports.getSessionId = getSessionId;
module.exports.checkIfConnected = checkIfConnected;
