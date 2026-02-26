import { Module } from '@nestjs/common';
import { CartController } from './cart.controller';
import { CartService } from './cart.service';
import { MongooseModule } from '@nestjs/mongoose';
import { CartSchema, CartSchemaModel } from './schema/add.cart.schema';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: CartSchemaModel.name, schema: CartSchema },
    ]),
  ],
  controllers: [CartController],
  providers: [CartService]
})
export class CartModule { }
