const jsonwebtoken = require("jsonwebtoken");
const User = require("../models/user")
const admin = async (req, res, next) => {
    try {

        const token = req.header("auth-token");
        if (!token) {
            res.status(401).json({ msg: "No auth token, access denied" });
        }
        const verifed = jsonwebtoken.verify(token, "passwordKey");
        if (!verifed) {
            res.status(401).json({ msg: "Token verification failed, authorization denied" });
        }
        const user = await User.findById(verifed.id);
        if (user.type == "user" || user.type == "seller") {
            res.status(401).json({ msg: "you are not admin!" });
        }
        req.user = verifed.id;
        req.token = token;
        next();
    }
    catch (e) {
        return res.status(500).json({ error: e.message });
    }
}
module.exports = admin;