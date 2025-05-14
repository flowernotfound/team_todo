<template>
  <div>
    <h1>チーム一覧</h1>
    <ul>
      <li v-for="team in teams" :key="team.id">
        <router-link :to="`/teams/${team.id}`">
          {{ team.name }}
        </router-link>
        （ID：{{ team.id }}, OwnerID：{{ team.owner_id }}）
      </li>
    </ul>
    <button @click="fetchTeams">更新</button>
    <router-link to="/teams/new" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-700 rounded">
      新規チーム作成
    </router-link>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { getTeams } from '@/api/teams';
import type { Team } from '@/api/teams';

const teams = ref<Team[]>([]);
const fetchTeams = async () => {
  teams.value = await getTeams();
};

onMounted(fetchTeams);
</script>
