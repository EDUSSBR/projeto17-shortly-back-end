import Joi from 'joi';

const signInSchema = Joi.object({
	email: Joi.string().email({ minDomainSegments: 2 }).required(),
	password: Joi.string().min(3).required(),
});

export { signInSchema }