import { IsNotEmpty, IsString } from "class-validator";

export class removeCartDto {
    @IsString()
    @IsNotEmpty()
    productName: string;
}
