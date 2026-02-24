import { Body, Controller, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { SignupDto } from './DTO/signup.dto';

@Controller('auth')
export class AuthController {
    constructor(private readonly authService: AuthService) {}

    @Post("signup")
      signUp(@Body() SignupDto: SignupDto) {
        return this.authService.signupUser(SignupDto);
      }
}
