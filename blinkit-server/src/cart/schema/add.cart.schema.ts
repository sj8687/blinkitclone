import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import mongoose, { HydratedDocument } from "mongoose";

export type UserDocument = HydratedDocument<CartSchemaModel>;

@Schema()
export class CartSchemaModel {
    @Prop({
        required: true,
        unique: true,
        lowercase: true,
        trim: true
    })
    productName: string;

    @Prop({
        required: true
    })
    imageUrl: string;

    @Prop({
        required: true,
        type: mongoose.Schema.Types.Decimal128,
    })
    price: mongoose.Types.Decimal128;

     @Prop({
        required: true
    })
    qty: number;
}

export const CartSchema = SchemaFactory.createForClass(CartSchemaModel);