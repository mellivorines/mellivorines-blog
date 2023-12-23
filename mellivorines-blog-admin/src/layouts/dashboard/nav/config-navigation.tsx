import { PATH_DASHBOARD } from '../../../routes/paths';
import SvgColor from '../../../components/svg-color';


const icon = (name: string) => (
  <SvgColor src={`/assets/icons/navbar/${name}.svg`} sx={{ width: 1, height: 1 }} />
);

const icons = {
  blog: icon('ic_blog'),
  cart: icon('ic_cart'),
  chat: icon('ic_chat'),
  mail: icon('ic_mail'),
  user: icon('ic_user'),
  file: icon('ic_file'),
  lock: icon('ic_lock'),
  label: icon('ic_label'),
  blank: icon('ic_blank'),
  kanban: icon('ic_kanban'),
  folder: icon('ic_folder'),
  banking: icon('ic_banking'),
  booking: icon('ic_booking'),
  invoice: icon('ic_invoice'),
  calendar: icon('ic_calendar'),
  disabled: icon('ic_disabled'),
  external: icon('ic_external'),
  menuItem: icon('ic_menu_item'),
  ecommerce: icon('ic_ecommerce'),
  analytics: icon('ic_analytics'),
  dashboard: icon('ic_dashboard'),
};

const navConfig = [
  // GENERAL
  {
    subheader: 'nav.app',
    items: [
      { title: 'menu.dashboard', path: PATH_DASHBOARD.one, icon: icons.dashboard },
      { title: 'menu.log', path: PATH_DASHBOARD.three, icon: icons.analytics },
    ],
  },

  // MANAGEMENT
  {
    subheader: 'nav.userManagement',
    items: [
      {
        title: 'menu.permissionsManagement',
        path: PATH_DASHBOARD.permissions.root,
        icon: icons.blank,
        children: [
          { title: 'menu.menuManagement', path: PATH_DASHBOARD.permissions.eight },
          { title: 'menu.apiManagement', path: PATH_DASHBOARD.permissions.nine },
          { title: 'menu.roleManagement', path: PATH_DASHBOARD.permissions.seven },
        ],
      },
      {
        title: 'menu.userManagement',
        path: PATH_DASHBOARD.user.root,
        icon: icons.user,
        children: [
          { title: 'menu.userList', path: PATH_DASHBOARD.user.four },
          { title: 'menu.onlineUser', path: PATH_DASHBOARD.user.five },
        ],
      },
    ],
  },
  // MANAGEMENT
  {
    subheader: 'nav.articleManagement',
    items: [
      {
        title: 'menu.articleManagement',
        path: PATH_DASHBOARD.article.root,
        icon: icons.blog,
        children: [
          { title: 'menu.publishArticle', path: PATH_DASHBOARD.article.one },
          { title: 'menu.articleList', path: PATH_DASHBOARD.article.two },
          { title: 'menu.tagsManagement', path: PATH_DASHBOARD.article.three },
          { title: 'menu.categoriesManagement', path: PATH_DASHBOARD.article.four },
        ],
      },
      {
        title: 'menu.talkManagement',
        path: PATH_DASHBOARD.talk.root,
        icon: icons.file,
        children: [
          { title: 'menu.talkList', path: PATH_DASHBOARD.talk.one },
          { title: 'menu.publishTalk', path: PATH_DASHBOARD.talk.two },
        ],
      },
      {
        title: 'menu.messageManagement',
        path: PATH_DASHBOARD.message.root,
        icon: icons.external,
        children: [
          { title: 'menu.messageList', path: PATH_DASHBOARD.message.one },
          { title: 'menu.commentManagement', path: PATH_DASHBOARD.message.two },
        ],
      },
    ],
  },
  // MANAGEMENT
  {
    subheader: 'nav.resourcesManagement',
    items: [
      {
        title: 'menu.albumManagement',
        path: PATH_DASHBOARD.photo.root,
        icon: icons.analytics,
        children: [
          { title: 'menu.albumList', path: PATH_DASHBOARD.photo.one },
        ],
      },
      {
        title: 'menu.logManagement',
        path: PATH_DASHBOARD.log.root,
        icon: icons.label,
        children: [
          { title: 'menu.errorLog', path: PATH_DASHBOARD.log.one },
          { title: 'menu.operationLog', path: PATH_DASHBOARD.log.two },
        ],
      },
    ],
  },
  // MANAGEMENT
  {
    subheader: 'nav.systemManagement',
    items: [
      {
        title: 'menu.systemManagement',
        path: PATH_DASHBOARD.system.root,
        icon: icons.lock,
        children: [
          { title: 'menu.websiteSetting', path: PATH_DASHBOARD.system.one },
          { title: 'menu.scheduledTask', path: PATH_DASHBOARD.system.two },
          { title: 'menu.friendLink', path: PATH_DASHBOARD.system.three },
          { title: 'menu.aboutUs', path: PATH_DASHBOARD.system.four },
        ],
      },
    ],
  },
];

export default navConfig;
