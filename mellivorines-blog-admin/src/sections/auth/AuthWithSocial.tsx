import {Divider, IconButton, Stack} from '@mui/material';
import {useAuthContext} from '../../auth/useAuthContext';
import Iconify from '../../components/iconify';
import {useLocales} from "../../i18n";


export default function AuthWithSocial() {
    const {loginWithQQ, loginWithWeChat, loginWithGithub, loginWithGitee} = useAuthContext();
    const {translate} = useLocales();
    const handleQQLogin = async () => {
        try {
            if (loginWithQQ) {
                loginWithQQ();
            }
            console.log('GOOGLE LOGIN');
        } catch (error) {
            console.error(error);
        }
    };

    const handleWeChatLogin = async () => {
        try {
            if (loginWithWeChat) {
                loginWithWeChat();
            }
            console.log('GOOGLE LOGIN');
        } catch (error) {
            console.error(error);
        }
    };

    const handleGithubLogin = async () => {
        try {
            if (loginWithGithub) {
                loginWithGithub();
            }
            console.log('GITHUB LOGIN');
        } catch (error) {
            console.error(error);
        }
    };

    const handleGiteeLogin = async () => {
        try {
            if (loginWithGitee) {
                loginWithGitee();
            }
            console.log('GITEE LOGIN');
        } catch (error) {
            console.error(error);
        }
    };

    return (
        <div>
            <Divider
                sx={{
                    my: 2.5,
                    typography: 'overline',
                    color: 'text.disabled',
                    '&::before, ::after': {
                        borderTopStyle: 'dashed',
                    },
                }}
            >
                {`${translate('page.login.or')}`}
            </Divider>

            <Stack direction="row" justifyContent="center" spacing={2}>
                <IconButton onClick={handleQQLogin}>
                    <Iconify icon="mingcute:qq-fill"/>
                </IconButton>
                <IconButton onClick={handleWeChatLogin}>
                    <Iconify icon="carbon:logo-wechat" color="#2E8B57"/>
                </IconButton>

                <IconButton color="inherit" onClick={handleGithubLogin}>
                    <Iconify icon="bytesize:github"/>
                </IconButton>

                <IconButton onClick={handleGiteeLogin}>
                    <Iconify icon="simple-icons:gitee" color="#DF3E30"/>
                </IconButton>
            </Stack>
        </div>
    );
}
