import {useState} from 'react';
import * as Yup from 'yup';
import {useForm} from 'react-hook-form';
import {yupResolver} from '@hookform/resolvers/yup';
import {Alert, IconButton, InputAdornment, Link, Stack} from '@mui/material';
import {LoadingButton} from '@mui/lab';
import {useAuthContext} from '../../auth/useAuthContext';
import Iconify from '../../components/iconify';
import FormProvider, {RHFTextField} from '../../components/hook-form';
import {useLocales} from "../../i18n";


type FormValuesProps = {
    email: string;
    password: string;
    afterSubmit?: string;
};

export default function AuthLoginForm() {
    const {login} = useAuthContext();
    const {translate} = useLocales();
    const [showPassword, setShowPassword] = useState(false);

    const LoginSchema = Yup.object().shape({
        email: Yup.string().required('Email is required').email('Email must be a valid email address'),
        password: Yup.string().required('Password is required'),
    });

    const defaultValues = {
        email: 'lilinxi015@163.com',
        password: '123456',
    };

    const methods = useForm<FormValuesProps>({
        resolver: yupResolver(LoginSchema),
        defaultValues,
    });

    const {
        reset,
        setError,
        handleSubmit,
        formState: {errors, isSubmitting, isSubmitSuccessful},
    } = methods;

    const onSubmit = async (data: FormValuesProps) => {
        try {
            await login(data.email, data.password);
        } catch (error) {
            console.error(error);

            reset();

            setError('afterSubmit', {
                ...error,
                message: error.message,
            });
        }
    };

    return (
        <FormProvider methods={methods} onSubmit={handleSubmit(onSubmit)}>
            <Stack spacing={3}>
                {!!errors.afterSubmit && <Alert severity="error">{errors.afterSubmit.message}</Alert>}

                <RHFTextField name="email" label={`${translate('page.login.emailAddress')}`}/>

                <RHFTextField
                    name="password"
                    label={`${translate('page.login.password')}`}
                    type={showPassword ? 'text' : 'password'}
                    InputProps={{
                        endAdornment: (
                            <InputAdornment position="end">
                                <IconButton onClick={() => setShowPassword(!showPassword)} edge="end">
                                    <Iconify icon={showPassword ? 'eva:eye-fill' : 'eva:eye-off-fill'}/>
                                </IconButton>
                            </InputAdornment>
                        ),
                    }}
                />
            </Stack>

            <Stack alignItems="flex-end" sx={{my: 2}}>
                <Link variant="body2" color="inherit" underline="always">
                    {`${translate('page.login.forgotPassword')}`}
                </Link>
            </Stack>

            <LoadingButton
                fullWidth
                color="inherit"
                size="large"
                type="submit"
                variant="contained"
                loading={isSubmitSuccessful || isSubmitting}
                sx={{
                    bgcolor: 'text.primary',
                    color: (theme) => (theme.palette.mode === 'light' ? 'common.white' : 'grey.800'),
                    '&:hover': {
                        bgcolor: 'text.primary',
                        color: (theme) => (theme.palette.mode === 'light' ? 'common.white' : 'grey.800'),
                    },
                }}
            >
                {`${translate('page.login.login')}`}
            </LoadingButton>
        </FormProvider>
    );
}
