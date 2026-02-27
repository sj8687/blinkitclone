import { Injectable, Req, Request } from '@nestjs/common';
import { AddCartDto } from './DTO/add.cart.dto';
import { CartSchemaModel } from './schema/add.cart.schema';
import { Model } from 'mongoose';
import { InjectModel } from '@nestjs/mongoose';

@Injectable()
export class CartService {
    constructor(@InjectModel(CartSchemaModel.name) private cartModel: Model<CartSchemaModel>) { }
    async addCart(AddCartDto: AddCartDto,userId:string) {
        try {
          const productAlreadyExist = await this.cartModel.findOne({
                productName: AddCartDto.productName,
          });
          if(productAlreadyExist){
            return {
                message:"Product Already Exist...",
                statusCode:409
            }
          } else {
             const product = await this.cartModel.create({
                user:userId,
                productName: AddCartDto.productName,
                imageUrl: AddCartDto.imageUrl,
                price: AddCartDto.price,
                qty: AddCartDto.qty
            });
            if(product) {
                return {
                    message:"cart added successfully...",
                    statusCode:201
                }
            }
          } 
        } catch (error) {
            console.log(error)
        }
    };

    async getCart(userId:string){
        try {
            const myCarts = await this.cartModel.findOne({
                user:userId,
            });
            if(myCarts){
                return {
                    productName:myCarts.productName,
                    imageUrl:myCarts.imageUrl,
                    price:myCarts.price,
                    qty:myCarts.qty
                }
            }
        } catch (error) {
            console.log(error);
        }
    }
}
