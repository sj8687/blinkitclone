export const jwtConstants = {
 secret: process.env.NODE_ENV == "development" ? "Local_JWT_TOKEN" :`${process.env.JWT_SECRET}`,
};