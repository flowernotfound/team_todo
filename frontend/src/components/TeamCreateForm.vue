<template>
  <div>
    <h1>新規チーム作成</h1>
    <form @submit.prevent="handleSubmit">
      <div>
        <label for="name">チーム名:</label>
        <input id="name" v-model="form.name" required />
      </div>
      <div>
        <!-- 今はオーナーIDをここで指定、ユーザーの管理をしていないため -->
        <label for="owner_id">オーナーID:</label>
        <input id="owner_id" type="number" v-model.number="form.owner_id" required />
      </div>
      <button type="submit">作成</button>
    </form>
    <router-link to="/teams">キャンセル</router-link>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { createTeam } from '@/api/teams';
import { useRouter } from 'vue-router';

const form = ref({
  name: '',
  owner_id: 1,
});

const router = useRouter();

const handleSubmit = async () => {
  try {
    const team = await createTeam(form.value);
    alert(`${team.name}を作成しました！`);
    router.push('/teams');
    // form.value.name = '';
    // form.value.owner_id = 1;
  } catch (error) {
    console.error(error);
    alert('チームの作成に失敗しました。');
  }
};
</script>
