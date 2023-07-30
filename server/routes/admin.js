const express = require("express");
const admin = require("../middleware/admin_middleware");
const { Product } = require("../models/product");
const app = express();
const adminRouter = express.Router();

// add product..
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

// Get all products..
adminRouter.post("/admin/get-product", admin, async (req, res) => {
    try {
        const product = await Product.find({});
        res.send(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
})
// delete the product
adminRouter.post('/admin/delete-product', async (req, res) => {
    const { id } = req.body;
    console.log(req.body);

    try {
        // Find data by ID and delete it
        const deletedData = await Product.findByIdAndDelete(id);
        if (!deletedData) {
            return res.status(404).json({ message: 'Data not found' });
        }
        return res.json({ message: 'Data deleted successfully' });
    } catch (err) {
        return res.status(500).json({ message: 'Error deleting data' });
    }
});

module.exports = adminRouter;