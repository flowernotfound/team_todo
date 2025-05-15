<template>
  <div v-if="team">
    <h1>チーム詳細（ID：{{ team.id }}）</h1>
    <p>チーム名：{{ team.name }}</p>
    <p>オーナーID：{{ team.owner_id }}</p>
    <p>作成日時：{{ team.created_at }}</p>
    <p>更新日時：{{ team.updated_at }}</p>
    <router-link :to="`/teams/${team.id}/edit`">編集</router-link>
    <button @click="confirmDelete">削除</button>
  </div>
  <div v-else>
    <p>読み込み中...</p>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { getTeamDetail } from '@/api/teams';
import type { Team } from '@/api/teams';

const route = useRoute();
const router = useRouter();
const team = ref<Team | null>(null);

const fetchTeam = async () => {
  const id = Number(route.params.id);
  try {
    team.value = await getTeamDetail(id);
  } catch (error) {
    console.error('チームの取得に失敗', error);
  }
};

const confirmDelete = () => {
  const result = confirm('本当に削除しますか？');
  if (result) {
    alert('削除が完了しました てきな');
    // TODO: delete用のAPIとそれ呼び出すやつ実装
    // そんで一覧に遷移
  }
};

onMounted(fetchTeam);
</script>
