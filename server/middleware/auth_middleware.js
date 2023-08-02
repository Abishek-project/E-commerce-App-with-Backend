const jsonwebtoken = require("jsonwebtoken");
const auth = async (req, res, next) => {
    try {

        const token = req.header("auth-token");
        console.log(token);
        if (!token) {
            return res.status(401).json({ msg: "No auth token, access denied" });
        }
        const verifed = jsonwebtoken.verify(token, "passwordKey");
        if (!verifed) {
            return res.status(401).json({ msg: "Token verification failed, authorization denied" });
        }
        req.user = verifed.id;
        req.token = token;
        next();
    }
    catch (e) {
        return res.status(500).json({ error: e.message });
    }
}
module.exports = auth;