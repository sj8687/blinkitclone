import { Body, Controller, Post, UseGuards } from '@nestjs/common';
import { CartService } from './cart.service';
import { JwtService } from '@nestjs/jwt';
import { Model } from 'mongoose';
import { CartSchemaModel } from './schema/add.cart.schema';
import { InjectModel } from '@nestjs/mongoose';
import { AddCartDto } from './DTO/add.cart.dto';
import { AuthGuard } from 'src/auth/Guards/auth.guard';

@Controller('cart')
export class CartController {    
    constructor(private readonly CartService:CartService,@InjectModel(CartSchemaModel.name) private CartModel: Model<CartSchemaModel>) {}

    @Post('add')
    @UseGuards(AuthGuard)
    addCart(@Body() AddCartDto: AddCartDto){
        return this.CartService.addCart(AddCartDto);
    }
}
