const express = require("express");
const admin = require("../middleware/admin_middleware");
const { Product } = require("../models/product");
const app = express();
const adminRouter = express.Router();
const Order = require(
    "../models/order"
)

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
// Get all Orders..
adminRouter.post("/admin/get-orders", admin, async (req, res) => {
    try {
        const order = await Order.find({});
        res.send(order);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
})
adminRouter.post("/admin/change-order-status", admin, async (req, res) => {
    try {
        const { id, status } = req.body;
        let order = await Order.findById(id);
        order.status = status;
        order = await order.save();
        res.json(order);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

adminRouter.get("/admin/analytics", admin, async (req, res) => {
    try {
        const orders = await Order.find({});
        let totalEarnings = 0;

        for (let i = 0; i < orders.length; i++) {
            for (let j = 0; j < orders[i].products.length; j++) {
                totalEarnings +=
                    orders[i].products[j].quantity * orders[i].products[j].product.price;
            }
        }
        // CATEGORY WISE ORDER FETCHING
        let mobileEarnings = await fetchCategoryWiseProduct("Mobiles");
        let fashsionEarnings = await fetchCategoryWiseProduct("Fashion");
        let applianceEarnings = await fetchCategoryWiseProduct("Appliances");
        let furnitureEarnings = await fetchCategoryWiseProduct("Furniture");


        let earnings = {
            totalEarnings,
            mobileEarnings,
            fashsionEarnings,
            applianceEarnings,
            furnitureEarnings,
        };

        res.json(earnings);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

async function fetchCategoryWiseProduct(category) {
    let earnings = 0;
    let categoryOrders = await Order.find({
        "products.product.category": category,
    });

    for (let i = 0; i < categoryOrders.length; i++) {
        for (let j = 0; j < categoryOrders[i].products.length; j++) {
            earnings +=
                categoryOrders[i].products[j].quantity *
                categoryOrders[i].products[j].product.price;
        }
    }
    return earnings;
}

module.exports = adminRouter;