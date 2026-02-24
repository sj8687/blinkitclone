import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { IsEmail } from "class-validator";
import { HydratedDocument } from "mongoose";

export type UserDocument = HydratedDocument<UserSchemaModel>;

@Schema()
export class UserSchemaModel {
    @Prop({
        required: true,
        unique: true,
        lowercase: true,
        trim: true
    })
    email: string;

    @Prop({ required: true })
    password: string;

}

export const UserSchema = SchemaFactory.createForClass(UserSchemaModel);