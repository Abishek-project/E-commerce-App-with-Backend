const mongoose = require("mongoose");

const productSchema = new mongoose.Schema({
    name: {
        required: true,
        trim: true,
        type: String,
    },
    description: {
        required: true,
        trim: true,
        type: String,
    },
    images: [{
        type: String,
        required: true,
    }],
    quantity: {
        type: Number,
        required: true,
    },
    price: {
        type: Number,
        required: true,
    },
    category: {
        type: String,
        required: true,
    },

});

const Product = mongoose.model("Products", productSchema);
module.exports = Product;