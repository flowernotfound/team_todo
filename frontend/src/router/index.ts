import { createRouter, createWebHistory } from 'vue-router';
import type { RouteRecordRaw } from 'vue-router';
import UserList from '@/components/UserList.vue';
import UserCreateForm from '@/components/UserCreateForm.vue';
import UserEditForm from '@/components/UserEditForm.vue';
import HelloPage from '@/components/hello.vue';
import TeamList from '@/components/TeamList.vue';
import TeamCreateForm from '@/components/TeamCreateForm.vue';
import TeamDetail from '@/components/TeamDetail.vue';

const routes: RouteRecordRaw[] = [
  {
    path: '/users',
    name: 'UserList',
    component: UserList,
  },
  {
    path: '/users/new',
    name: 'UserCreate',
    component: UserCreateForm,
  },
  {
    path: '/users/:id/edit',
    name: 'UserEdit',
    component: UserEditForm,
    props: true,
  },
  {
    path: '/hello',
    name: 'hello',
    component: HelloPage,
  },
  {
    path: '/teams',
    name: 'TeamList',
    component: TeamList,
  },
  {
    path: '/teams/new',
    name: 'TeamCreateForm',
    component: TeamCreateForm,
  },
  {
    path: '/teams/:id',
    name: 'TeamDetail',
    component: TeamDetail,
    props: true,
  },
  {
    path: '/',
    redirect: '/teams',
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
