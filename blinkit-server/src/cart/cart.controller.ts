import { Body, Controller, Get, Patch, Post, Req, UseGuards } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { AuthGuard } from 'src/auth/Guards/auth.guard';
import { CartService } from './cart.service';
import { AddCartDto } from './DTO/add.cart.dto';
import { CartSchemaModel } from './schema/add.cart.schema';
import { updateCartDto } from './DTO/update.cart.qty';

@Controller('cart')
export class CartController {    
    constructor(private readonly CartService:CartService,@InjectModel(CartSchemaModel.name) private CartModel: Model<CartSchemaModel>) {}

    @Post('add')
    @UseGuards(AuthGuard)
    addCart(@Body() AddCartDto: AddCartDto,@Req() req:any){
        return this.CartService.addCart(AddCartDto,req.user.userId);
    }
    
    @Get()
    @UseGuards(AuthGuard)
    getCart(@Req() req:any){
        return this.CartService.getCart(req.user.userId);
    }

    @Patch("/updateqty")
    @UseGuards(AuthGuard)
    updateCartQty(@Body() updateCartDto:updateCartDto ,@Req() req:any){
        return this.CartService.updateQty(updateCartDto,req.user.userId);
    }
}
