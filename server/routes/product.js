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

productRouter.get("/product/search/:name", auth, async (req, res) => {
    try {
        console.log(req.params.name);
        const product = await Product.find({ name: { $regex: req.params.name, $options: "i" } });
        res.send(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
})

productRouter.post("/rate-product", auth, async (req, res) => {
    try {
        const { id, rating } = req.body;
        let product = await Product.findById(id);
        console.log(product);
        for (let i = 0; i < product.ratings.length; i++) {
            if (product.ratings[i].userId == req.user) {
                product.ratings.splice(i, 1);
            }
            break;
        }
        const ratingSchema = {
            userId: req.user,
            ratings: rating
        }
        product.ratings.push(ratingSchema);
        product = await product.save();
        res.json(product);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
})
module.exports = productRouter;