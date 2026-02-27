import { IsInt, IsNotEmpty, IsString, Max, Min } from "class-validator";

export class updateCartDto {

    @IsString()
    @IsNotEmpty()
    productName: string;

    @Min(1)
    @Max(10)
    @IsInt()
    qty?: number;
}
