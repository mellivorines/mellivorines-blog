// ----------------------------------------------------------------------

function path(root: string, sublink: string) {
    return `${root}${sublink}`;
}

const ROOTS_DASHBOARD = '/dashboard';


export const PATH_AUTH = {
    login: '/login',
};

export const PATH_DASHBOARD = {
    root: ROOTS_DASHBOARD,
    one: path(ROOTS_DASHBOARD, '/one'),
    two: path(ROOTS_DASHBOARD, '/two'),
    three: path(ROOTS_DASHBOARD, '/three'),
    permissions: {
        root: path(ROOTS_DASHBOARD, '/permissions'),
        seven: path(ROOTS_DASHBOARD, '/permissions/seven'),
        eight: path(ROOTS_DASHBOARD, '/permissions/eight'),
        nine: path(ROOTS_DASHBOARD, '/permissions/nine'),
    },
    user: {
        root: path(ROOTS_DASHBOARD, '/user'),
        four: path(ROOTS_DASHBOARD, '/user/four'),
        five: path(ROOTS_DASHBOARD, '/user/five'),
        six: path(ROOTS_DASHBOARD, '/user/six'),
    },
    article: {
        root: path(ROOTS_DASHBOARD, '/article'),
        one: path(ROOTS_DASHBOARD, '/article/one'),
        two: path(ROOTS_DASHBOARD, '/article/two'),
        three: path(ROOTS_DASHBOARD, '/article/three'),
        four: path(ROOTS_DASHBOARD, '/article/four'),
        five: path(ROOTS_DASHBOARD, '/article/five'),
        six: path(ROOTS_DASHBOARD, '/article/six'),
    },
    talk: {
        root: path(ROOTS_DASHBOARD, '/talk'),
        one: path(ROOTS_DASHBOARD, '/talk/one'),
        two: path(ROOTS_DASHBOARD, '/talk/two'),
        three: path(ROOTS_DASHBOARD, '/talk/three'),
        four: path(ROOTS_DASHBOARD, '/talk/four'),
        five: path(ROOTS_DASHBOARD, '/talk/five'),
        six: path(ROOTS_DASHBOARD, '/talk/six'),
    },
    message: {
        root: path(ROOTS_DASHBOARD, '/message'),
        one: path(ROOTS_DASHBOARD, '/message/one'),
        two: path(ROOTS_DASHBOARD, '/message/two'),
        three: path(ROOTS_DASHBOARD, '/message/three'),
    },
    photo: {
        root: path(ROOTS_DASHBOARD, '/photo'),
        one: path(ROOTS_DASHBOARD, '/photo/one'),
        two: path(ROOTS_DASHBOARD, '/photo/two'),
        three: path(ROOTS_DASHBOARD, '/photo/three'),
        four: path(ROOTS_DASHBOARD, '/photo/four'),
        five: path(ROOTS_DASHBOARD, '/photo/five'),
    },
    log: {
        root: path(ROOTS_DASHBOARD, '/log'),
        one: path(ROOTS_DASHBOARD, '/log/one'),
        two: path(ROOTS_DASHBOARD, '/log/two'),
        three: path(ROOTS_DASHBOARD, '/log/three'),
        four: path(ROOTS_DASHBOARD, '/log/four'),
        five: path(ROOTS_DASHBOARD, '/log/five'),
    },
    system: {
        root: path(ROOTS_DASHBOARD, '/system'),
        one: path(ROOTS_DASHBOARD, '/system/one'),
        two: path(ROOTS_DASHBOARD, '/system/two'),
        three: path(ROOTS_DASHBOARD, '/system/three'),
        four: path(ROOTS_DASHBOARD, '/system/four'),
        five: path(ROOTS_DASHBOARD, '/system/five'),
    }

};
