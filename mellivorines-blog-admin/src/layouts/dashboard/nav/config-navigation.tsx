import { PATH_DASHBOARD } from '../../../routes/paths';
import SvgColor from '../../../components/svg-color';


const icon = (name: string) => (
  <SvgColor src={`/assets/icons/navbar/${name}.svg`} sx={{ width: 1, height: 1 }} />
);

const icons = {
  user: icon('ic_user'),
  ecommerce: icon('ic_ecommerce'),
  analytics: icon('ic_analytics'),
  dashboard: icon('ic_dashboard'),
};

const navConfig = [
  // GENERAL
  {
    subheader: '应用',
    items: [
      { title: '看板', path: PATH_DASHBOARD.one, icon: icons.dashboard },
      { title: '日志', path: PATH_DASHBOARD.three, icon: icons.analytics },
    ],
  },

  // MANAGEMENT
  {
    subheader: '用户管理',
    items: [
      {
        title: '权限管理',
        path: PATH_DASHBOARD.permissions.root,
        icon: icons.user,
        children: [
          { title: '菜单管理', path: PATH_DASHBOARD.permissions.eight },
          { title: '接口管理', path: PATH_DASHBOARD.permissions.nine },
          { title: '角色管理', path: PATH_DASHBOARD.permissions.seven },
        ],
      },
      {
        title: '用户管理',
        path: PATH_DASHBOARD.user.root,
        icon: icons.user,
        children: [
          { title: '用户列表', path: PATH_DASHBOARD.user.four },
          { title: '在线用户', path: PATH_DASHBOARD.user.five },
        ],
      },
    ],
  },
  // MANAGEMENT
  {
    subheader: '文章管理',
    items: [
      {
        title: '文章管理',
        path: PATH_DASHBOARD.article.root,
        icon: icons.user,
        children: [
          { title: '发布文章', path: PATH_DASHBOARD.article.one },
          { title: '文章列表', path: PATH_DASHBOARD.article.two },
          { title: '分类管理', path: PATH_DASHBOARD.article.three },
          { title: '标签管理', path: PATH_DASHBOARD.article.four },
        ],
      },
      {
        title: '说说管理',
        path: PATH_DASHBOARD.talk.root,
        icon: icons.user,
        children: [
          { title: '说说列表', path: PATH_DASHBOARD.talk.one },
          { title: '发布说说', path: PATH_DASHBOARD.talk.two },
        ],
      },
      {
        title: '消息管理',
        path: PATH_DASHBOARD.message.root,
        icon: icons.user,
        children: [
          { title: '评论管理', path: PATH_DASHBOARD.message.one },
        ],
      },
    ],
  },
  // MANAGEMENT
  {
    subheader: '资源管理',
    items: [
      {
        title: '相册管理',
        path: PATH_DASHBOARD.photo.root,
        icon: icons.user,
        children: [
          { title: '相册列表', path: PATH_DASHBOARD.photo.one },
        ],
      },
      {
        title: '日志管理',
        path: PATH_DASHBOARD.log.root,
        icon: icons.user,
        children: [
          { title: '异常日志', path: PATH_DASHBOARD.log.one },
          { title: '操作日志', path: PATH_DASHBOARD.log.two },
        ],
      },
    ],
  },
  // MANAGEMENT
  {
    subheader: '系统管理',
    items: [
      {
        title: '系统管理',
        path: PATH_DASHBOARD.system.root,
        icon: icons.user,
        children: [
          { title: '网站管理', path: PATH_DASHBOARD.system.one },
          { title: '定时任务', path: PATH_DASHBOARD.system.two },
          { title: '友链管理', path: PATH_DASHBOARD.system.three },
          { title: '关于我', path: PATH_DASHBOARD.system.four },
        ],
      },
    ],
  },
];

export default navConfig;
