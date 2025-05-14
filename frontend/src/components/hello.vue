<!-- src/components/HelloPage.vue -->
<template>
  <div>
    <h1>テストページ</h1>
    <p v-if="message">{{ message }}</p>
    <button @click="fetchMessage">メッセージ取得</button>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { getHelloMessage } from '@/api/hello';

const message = ref<string | null>(null);

const fetchMessage = async () => {
  message.value = await getHelloMessage();
};
</script>
