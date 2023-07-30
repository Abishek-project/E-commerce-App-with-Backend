const express = require("express");
const auth = require("../middleware/auth_middleware");
const Product = require("../models/product");
const userRouter = express.Router();

userRouter.get("/popular-products", auth, async (req, res) => {
    try {
        const products = await Product.find({});

        // Filter products with ratings greater than 4
        const popularProducts = products.filter(product => {
            return product.ratings.some(rating => rating.ratings > 3.5);
        });

        res.json(popularProducts);
        // Create an empty array to store popular products
        // const popularProducts = [];

        // for (const product of products) {
        //     // Check each product's ratings array for ratings greater than 4
        //     const ratings = product.ratings;

        //     for (const rating of ratings) {
        //         if (rating.ratings > 4) {
        //             // If the product has a rating greater than 4, add it to the popularProducts array
        //             popularProducts.push(product);
        //             break; // Break the inner loop since we already found a popular rating for this product
        //         }
        //     }
        // }

        // res.json(popularProducts);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
})
module.exports = userRouter;
