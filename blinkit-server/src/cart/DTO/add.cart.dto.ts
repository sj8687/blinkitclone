import { IsDecimal, IsInt, IsNotEmpty, IsOptional, IsString, IsUrl, Min } from "class-validator";

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

    @IsOptional()
    @Min(1)
    @IsInt()
    qty?: number;
}