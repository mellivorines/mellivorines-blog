import { Typography, Stack } from '@mui/material';
import Logo from '../../components/logo';
import Image from '../../components/image';
import { StyledRoot, StyledSectionBg, StyledSection, StyledContent } from './styles';
import {useLocales} from "../../i18n";


type Props = {
  title?: string;
  illustration?: string;
  children: React.ReactNode;
};

export default function LoginLayout({ children, illustration, title }: Props) {
    const {translate} = useLocales();
  return (
    <StyledRoot>
      <Logo
        sx={{
          zIndex: 9,
          position: 'absolute',
          mt: { xs: 1.5, md: 5 },
          ml: { xs: 2, md: 5 },
        }}
      />

      <StyledSection>
        <Typography variant="h3" sx={{ mb: 10, maxWidth: 480, textAlign: 'center' }}>
          {title || `${translate('page.login.hi')}`}
        </Typography>

        <Image
          disabledEffect
          visibleByDefault
          alt="auth"
          src={illustration || '/assets/illustrations/illustration_dashboard.png'}
          sx={{ maxWidth: 720 }}
        />

        <StyledSectionBg />
      </StyledSection>

      <StyledContent>
        <Stack sx={{ width: 1 }}> {children} </Stack>
      </StyledContent>
    </StyledRoot>
  );
}
