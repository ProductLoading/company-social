import { InputType, Field } from '@nestjs/graphql';

@InputType()
export class CreateUserInput {
  @Field()
  email: string;

  @Field()
  password: string;

  @Field()
  first_name: string;

  @Field()
  last_name: string;

  @Field({ nullable: true })
  office_id?: number;

  @Field({ nullable: true, defaultValue: 'active' })
  status?: string;

  @Field({ nullable: true })
  profile_picture_url?: string;
}
