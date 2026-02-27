import { Injectable, Req, Request } from '@nestjs/common';
import { AddCartDto } from './DTO/add.cart.dto';
import { CartSchemaModel } from './schema/add.cart.schema';
import { Model } from 'mongoose';
import { InjectModel } from '@nestjs/mongoose';
import { updateCartDto } from './DTO/update.cart.qty';
import { removeCartDto } from './DTO/remove.cart';

@Injectable()
export class CartService {
    constructor(@InjectModel(CartSchemaModel.name) private cartModel: Model<CartSchemaModel>) { }

    async addCart(AddCartDto: AddCartDto, userId: string) {
        try {
            const productAlreadyExist = await this.cartModel.findOne({
                productName: AddCartDto.productName,
            });
            if (productAlreadyExist) {
                return {
                    message: "Product Already Exist...",
                    statusCode: 409
                }
            } else {
                const product = await this.cartModel.create({
                    user: userId,
                    productName: AddCartDto.productName,
                    imageUrl: AddCartDto.imageUrl,
                    price: AddCartDto.price,
                    qty: AddCartDto.qty
                });
                if (product) {
                    return {
                        message: "cart added successfully...",
                        statusCode: 201
                    }
                }
            }
        } catch (error) {
            console.log(error)
        }
    };

    async getCart(userId: string) {
        try {
            const myCarts = await this.cartModel.find({
                user: userId,
            });
            if (myCarts) {
                return {
                    myCarts
                }
            }
        } catch (error) {
            console.log(error);
        }
    };
    async updateQty(updateCartDto: updateCartDto, userId: string) {
        try {
            const cartItem = await this.cartModel.findOne({
                productName: updateCartDto.productName,
                user: userId,
            });
            if (!cartItem) {
                return { message: "product not found in your cart...", statusCode: 404 }
            } else {
                if (cartItem.qty === updateCartDto.qty) {
                    return {
                        message: "Quantity already same. No update needed.",
                    };
                } else {
                    const updatedProduct = await this.cartModel.findOneAndUpdate(
                        {
                            productName: updateCartDto.productName,
                            user: userId,
                        },
                        {
                            $set: {
                                qty: updateCartDto.qty,
                            },
                        },
                        // { new: true } 
                    );
                    return { message: "your cart quantity updated...", statusCode: 200 }
                }
            }
        } catch (error) {
            console.log(error);
        }
    };

    async removeCart(removeCartDto: removeCartDto, userId: string) {
        try {
            const deleted = await this.cartModel.findOneAndDelete({
                productName:removeCartDto.productName,
                user: userId,
            });

            if (!deleted) {
                return {message: "cart item not found...", statusCode:404};
            }

            return {
                message: 'Cart item deleted successfully',
                statusCode:200
            };
        } catch (error) {

        }
    }

}
