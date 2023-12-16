// 国际化
import './i18n/i18n';

// 滚动条
import 'simplebar/src/simplebar.css';

// 延时图片
import 'react-lazy-load-image-component/src/effects/blur.css';


import { BrowserRouter } from 'react-router-dom';
import { HelmetProvider } from 'react-helmet-async';
import Router from './routes';
import ThemeProvider from './theme';
import ThemeLocalization from './i18n';
import SnackbarProvider from './components/snackbar';
import ScrollToTop from './components/scroll-to-top';
import { MotionLazyContainer } from './components/animate';
import { ThemeSettings, SettingsProvider } from './components/settings';

import { AuthProvider } from './auth/JwtContext';


export default function App() {
    return (
        <AuthProvider>
            <HelmetProvider>
                <SettingsProvider>
                    <BrowserRouter>
                        <ScrollToTop />
                        <MotionLazyContainer>
                            <ThemeProvider>
                                <ThemeSettings>
                                    <ThemeLocalization>
                                        <SnackbarProvider>
                                            <Router />
                                        </SnackbarProvider>
                                    </ThemeLocalization>
                                </ThemeSettings>
                            </ThemeProvider>
                        </MotionLazyContainer>
                    </BrowserRouter>
                </SettingsProvider>
            </HelmetProvider>
        </AuthProvider>
    );
}
