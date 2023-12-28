import { Navigate, useRoutes } from 'react-router-dom';
import AuthGuard from '../auth/AuthGuard';
import GuestGuard from '../auth/GuestGuard';
import CompactLayout from '../layouts/compact';
import DashboardLayout from '../layouts/dashboard';
import { PATH_AFTER_LOGIN } from '../config-global';
import {
  Page404,
  PageOne,
  PageTwo,
  PageSix,
  PageFour,
  PageFive,
  LoginPage,
  PageThree, BlogNewPostPage,
} from './elements';


export default function Router() {
  return useRoutes([
    {
      path: '/',
      children: [
        { element: <Navigate to={PATH_AFTER_LOGIN} replace />, index: true },
        {
          path: 'login',
          element: (
            <GuestGuard>
              <LoginPage />
            </GuestGuard>
          ),
        },
      ],
    },
    {
      path: '/dashboard',
      element: (
        <AuthGuard>
          <DashboardLayout />
        </AuthGuard>
      ),
      children: [
        { element: <Navigate to={PATH_AFTER_LOGIN} replace />, index: true },
        { path: 'one', element: <PageOne /> },
        { path: 'two', element: <PageTwo /> },
        { path: 'three', element: <PageThree /> },
        {
          path: 'permissions',
          children: [
            { element: <Navigate to="/dashboard/permissions/seven" replace />, index: true },
            { path: 'seven', element: <PageFour /> },
            { path: 'eight', element: <PageFive /> },
            { path: 'nine', element: <PageSix /> },
          ],
        },
        {
          path: 'user',
          children: [
            { element: <Navigate to="/dashboard/user/four" replace />, index: true },
            { path: 'four', element: <PageFour /> },
            { path: 'five', element: <PageFive /> },
            { path: 'six', element: <PageSix /> },
          ],
        },
        {
          path: 'article',
          children: [
            { element: <Navigate to="/dashboard/article/one" replace />, index: true },
            { path: 'one', element: <BlogNewPostPage /> },
            { path: 'two', element: <PageFive /> },
            { path: 'three', element: <PageSix /> },
            { path: 'four', element: <PageFour /> },
          ],
        },
        {
          path: 'talk',
          children: [
            { element: <Navigate to="/dashboard/talk/one" replace />, index: true },
            { path: 'one', element: <PageFour /> },
            { path: 'two', element: <PageFive /> },
            { path: 'there', element: <PageSix /> },
          ],
        },
        {
          path: 'message',
          children: [
            { element: <Navigate to="/dashboard/message/one" replace />, index: true },
            { path: 'one', element: <PageFour /> },
            { path: 'two', element: <PageFive /> },
            { path: 'there', element: <PageSix /> },
          ],
        },
        {
          path: 'photo',
          children: [
            { element: <Navigate to="/dashboard/photo/one" replace />, index: true },
            { path: 'one', element: <PageFour /> },
            { path: 'two', element: <PageFive /> },
            { path: 'there', element: <PageSix /> },
          ],
        },
        {
          path: 'log',
          children: [
            { element: <Navigate to="/dashboard/log/one" replace />, index: true },
            { path: 'one', element: <PageFour /> },
            { path: 'two', element: <PageFive /> },
            { path: 'there', element: <PageSix /> },
          ],
        },
        {
          path: 'system',
          children: [
            { element: <Navigate to="/dashboard/system/one" replace />, index: true },
            { path: 'one', element: <PageFour /> },
            { path: 'two', element: <PageFive /> },
            { path: 'three', element: <PageSix /> },
            { path: 'four', element: <PageFour /> },
          ],
        },
      ],
    },
    {
      element: <CompactLayout />,
      children: [{ path: '404', element: <Page404 /> }],
    },
    { path: '*', element: <Navigate to="/404" replace /> },
  ]);
}
