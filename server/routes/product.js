const express = require("express");
const auth = require("../middleware/auth_middleware");
const Product = require("../models/product");
const productRouter = express.Router();
productRouter.get("/product", auth, async (req, res) => {
    try {
        console.log(req.query.category);
        const product = await Product.find({ category: req.query.category });
        res.send(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
})
module.exports = productRouter;