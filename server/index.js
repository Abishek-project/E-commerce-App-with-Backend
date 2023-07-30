// import
const express = require("express");
const authRouter = require("./routes/auth");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");
// init
const app = express();
const Port = 3000;
const DB = "mongodb+srv://abishekabi992:7339174247@cluster0.zzxxouo.mongodb.net/"
// middleware
app.use(express.json());

app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
// connections
mongoose.connect(DB).then(() => {
    console.log("DB conneted")
}).catch((e) => {
    console.log(e);
})
app.listen(Port, "0.0.0.0", () => {
    console.log(`connected at port ${Port}`);
})
