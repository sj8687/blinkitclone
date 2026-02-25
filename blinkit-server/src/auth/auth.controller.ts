import { Body, Controller, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { UserDto } from './DTO/user.dto';

@Controller('auth')
export class AuthController {
    constructor(private readonly authService: AuthService) {}

    @Post("signup")
      signUp(@Body() UserDto: UserDto) {
        return this.authService.signupUser(UserDto);
      }
    @Post("signin")  
      signIn(@Body() UserDto: UserDto) {
        return this.authService.signinUser(UserDto);
      }
}
