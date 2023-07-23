const express = require("express");
const admin = require("../middleware/admin_middleware");
const Product = require("../models/product");
const app = express();
const adminRouter = express.Router();


adminRouter.post("/admin/add-product", admin, async (req, res) => {
    try {
        const { name, description, images, price, quantity, category } = req.body;

        // Create a new product object using the model and the received data
        const product = new Product({
            name,
            description,
            images,
            price,
            quantity,
            category,
        });

        // Save the product to the database asynchronously and wait for it to complete
        const savedProduct = await product.save();

        return res.json(savedProduct);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

adminRouter.post("/admin/get-product", admin, async (req, res) => {
    try {
        const product = await Product.find({});
        res.send(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
})

module.exports = adminRouter;