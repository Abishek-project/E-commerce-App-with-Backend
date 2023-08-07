const mongoose = require("mongoose");
const { productSchema } = require("./product");

const orderSchema = new mongoose.Schema({
    products: [
        {
            product: productSchema,
            quantity: {
                type: Number,
                required: true,
            },
        },
    ],
    totalPrice: {
        type: Number,
        required: true,
    },
    UserId: {
        type: String,
        required: true,
    },
    address: {
        type: String,
        required: true,
    },
    orderdAt: {
        type: Number,
        required: true,
    },
    status: {
        type: Number,
        default: 0,
    },
});
const Order = mongoose.model("Order", orderSchema)
module.exports = Order;