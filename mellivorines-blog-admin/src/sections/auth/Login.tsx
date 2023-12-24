import {Alert, Box, Link, Stack, Tooltip, Typography} from '@mui/material';
import {useAuthContext} from '../../auth/useAuthContext';
import LoginLayout from '../../layouts/login';
import AuthLoginForm from './AuthLoginForm';
import AuthWithSocial from './AuthWithSocial';
import {useLocales} from "../../i18n";


export default function Login() {
    const {method} = useAuthContext();
    const {translate} = useLocales();
    return (
        <LoginLayout>
            <Stack spacing={2} sx={{mb: 5, position: 'relative'}}>
                <Typography variant="h4">{`${translate('page.login.description')}`}</Typography>

                <Stack direction="row" spacing={0.5}>
                    <Typography variant="body2">{`${translate('page.login.newUser')}`}</Typography>

                    <Link variant="subtitle2">{`${translate('page.login.createAccount')}`}</Link>
                </Stack>

                <Tooltip title={method} placement="left">
                    <Box
                        component="img"
                        alt={method}
                        src={`/assets/icons/auth/ic_${method}.png`}
                        sx={{width: 32, height: 32, position: 'absolute', right: 0}}
                    />
                </Tooltip>
            </Stack>

            <Alert severity="info" sx={{mb: 3}}>
                {`${translate('page.login.emailAddress')}`} : <strong>lilinxi015@163.com</strong> / {`${translate('page.login.password')}`} :<strong> 123456</strong>
            </Alert>

            <AuthLoginForm/>

            <AuthWithSocial/>
        </LoginLayout>
    );
}
