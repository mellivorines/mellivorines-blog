import { useTranslation } from 'react-i18next';
import localStorageAvailable from '../utils/localStorageAvailable';
import { useSettingsContext } from '../components/settings';
import { allLanguages, defaultLang } from './config-lang';


export default function useLocales() {
  const { i18n, t: translate } = useTranslation();

  const { onChangeDirectionByLang } = useSettingsContext();

  const storageAvailable = localStorageAvailable();

  const langStorage = storageAvailable ? localStorage.getItem('i18nextLng') : '';

  const currentLang = allLanguages.find((_lang) => _lang.value === langStorage) || defaultLang;

  const handleChangeLanguage = (newLanguage: string) => {
    i18n.changeLanguage(newLanguage);
    onChangeDirectionByLang(newLanguage);
  };

  return {
    onChangeLang: handleChangeLanguage,
    translate: (text: any, options?: any) => translate(text, options),
    currentLang,
    allLanguages: allLanguages,
  };
}
