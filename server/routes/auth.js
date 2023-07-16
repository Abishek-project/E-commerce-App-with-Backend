const express = require("express");
const User = require("../models/user");
const bcrypt = require("bcrypt");
const authRouter = express.Router();
const jsonwebtoken = require("jsonwebtoken");
const auth = require("../middleware/auth_middleware");
authRouter.post("/signup", async (req, res) => {
    try {
        const { name, email, password } = req.body
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).
                json({ msg: "User email already exists" })
        }
        const hashedPassword = await bcrypt.hash(password, 8);
        let user = new User({
            name,
            email,
            password: hashedPassword,
        })
        user = await user.save();
        return res.json(user);

    }
    catch (e) {
        return res.status(500).json({ error: e.message });

    }

})

authRouter.post("/signin", async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await User.findOne({ email }).lean();
        if (!user) {
            return res.status(400).json({ msg: "User with this email does not exist!" });
        }
        const isPasswordMatch = await bcrypt.compare(password, user.password);
        if (!isPasswordMatch) {
            return res.status(400).json({ msg: "Incorrect Password!" });
        }
        const token = jsonwebtoken.sign({ id: user._id }, "passwordKey");

        return res.json({ token, ...user });

    } catch (e) {
        return res.status(500).json({ error: e.message });
    }
});
authRouter.post(
    "/tokenIsValid", async (req, res) => {
        try {
            const token = req.header("auth-token");
            if (!token) return res.json(false);
            const verifed = jsonwebtoken.verify(token, "passwordKey")
            if (!verifed) return res.json(false);
            const user = User.findById(verifed.id);
            if (!user) return res.json(false);
            res.json(true);
        }
        catch (e) {
            return res.status(500).json({ error: e.message });
        }
    }
);

authRouter.get("/", auth, async (req, res) => {
    try {
        const user = await User.findById(req.user);

        if (!user) {
            // Handle case when user is not found
            return res.status(404).json({ error: "User not found" });
        }

        const responseObject = { ...user._doc, token: req.token };

        res.json(responseObject);
    } catch (error) {
        // Handle any errors that occur during the process
        console.error(error);
        res.status(500).json({ error: "Internal server error" });
    }
});


module.exports = authRouter;
