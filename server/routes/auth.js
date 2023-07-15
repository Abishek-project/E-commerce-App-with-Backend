const express = require("express");
const User = require("../models/user");
const bcrypt = require("bcrypt");
const authRouter = express.Router();
const jsonwebtoken = require("jsonwebtoken")
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


module.exports = authRouter;
