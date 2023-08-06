const express = require("express");
const auth = require("../middleware/auth_middleware");
const { Product } = require("../models/product");
const User = require("../models/user");
const Order = require("../models/order");
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

userRouter.post("/add-to-cart", auth, async (req, res) => {
    try {
        const { id } = req.body;
        let product = await Product.findById(id);
        let user = await User.findById(req.user);
        if (user.cart.length == 0) {
            user.cart.push(
                {
                    product,
                    quantity: 1
                }
            )
        }
        else {
            let hasProduct = false;
            for (let i = 0; i < user.cart.length; i++) {
                if (user.cart[i].product._id.equals(product._id)) {
                    hasProduct = true;
                }

            }

            if (hasProduct) {
                let hasCartProduct = false;
                for (const cartItem of user.cart) {
                    if (cartItem.product._id.equals(product._id)) {
                        hasCartProduct = true;
                        cartItem.quantity += 1;
                        break;
                    }
                }

                if (!hasCartProduct) {
                    user.cart.push({
                        product,
                        quantity: 1
                    });
                }


            }
            else {
                user.cart.push(
                    {
                        product,
                        quantity: 1
                    }
                )
            }
        }
        user = await user.save();
        res.json(user);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
})
userRouter.delete("/remove-from-cart/:id", auth, async (req, res) => {
    try {
        const { id } = req.params;
        let product = await Product.findById(id);
        let user = await User.findById(req.user);



        for (let i = 0; i < user.cart.length; i++) {
            if (user.cart[i].product._id.equals(product._id)) {
                if (user.cart[i].quantity == 1) {
                    user.cart.splice(i, 1)
                }
                else {
                    user.cart[i].quantity -= 1;
                }
            }

        }

        user = await user.save();
        res.json(user);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
})


userRouter.post("/user-address", auth, async (req, res) => {
    try {
        const { address } = req.body;
        let user = await User.findById(req.user);
        user.address = address;
        user = await user.save();
        res.json(user);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
})

userRouter.post("/order", auth, async (req, res) => {
    try {
        const { cart, totalPrice, address } = req.body;
        let productList = [];
        for (let i = 0; i < cart.length; i++) {
            let product = await Product.findById(cart[i].product._id);
            if (product.quantity >= cart[i].quantity) {
                product.quantity -= cart[i].quantity
                productList.push(
                    {
                        product,
                        quantity: cart[i].quantity
                    }
                )
                console.log(productList);
                await product.save();
            }
            else {
                return res.status(400).json({ msg: `${product.name} is out of stock!` });
            }

        }
        let user = await User.findById(req.user);
        user.cart = [];
        await user.save();
        let order = new Order(
            {
                products: productList,
                totalPrice,
                UserId: req.user,
                address,
                orderdAt: new Date().getTime(),

            }
        )
        order = await order.save();
        res.json(order);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
})


userRouter.get("/order-me", auth, async (req, res) => {
    try {
        let order = await Order.find({ UserId: req.user });
        res.json(order);
    } catch (error) {
        return req.status(500).json({ error: error.message })
    }
})
module.exports = userRouter;
