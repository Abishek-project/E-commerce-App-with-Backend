const mongoose = require("mongoose");
const { productSchema } = require("./product");

const userSchema = new mongoose.Schema({
    name: {
        required: true,
        trim: true,
        type: String,

    },
    email: {
        required: true,
        trim: true,
        type: String,
        validate: {
            validator: function (value) {
                // Regular expression to validate email format
                const emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                return emailRegex.test(value);
            },
            message: "Invalid email format",
        },
    },
    password: {
        required: true,
        trim: true,
        type: String,

    },
    address: {
        type: String,
        default: "",
    },
    type: {
        type: String,
        default: "user",
    },
    cart: [
        {
            product: productSchema,
            quantity: {
                type: Number,
                required: true,
            }
        }
    ]
});

const User = mongoose.model("User", userSchema);
module.exports = User;