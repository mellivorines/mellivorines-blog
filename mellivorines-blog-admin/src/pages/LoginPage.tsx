import {Helmet} from 'react-helmet-async';
import Login from '../sections/auth/Login';
import {useLocales} from "../i18n";


export default function LoginPage() {

    const {translate} = useLocales();
    return (
        <>
            <Helmet>
                <title>{`${translate('page.login.title')}`}</title>
            </Helmet>

            <Login/>
        </>
    );
}
