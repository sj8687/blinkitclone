import { IsDecimal, IsNotEmpty, IsString, IsUrl, Min } from "class-validator";

export class AddCartDto {

    @IsString()
    @IsNotEmpty()
    productName: string;

    @IsString()
    @IsNotEmpty()
    @IsUrl()
    imageUrl: string;

    @IsNotEmpty()
    @IsDecimal({ decimal_digits: '2' })
    price: string;

    @IsNotEmpty()
    @Min(1)
    qty: number;
}