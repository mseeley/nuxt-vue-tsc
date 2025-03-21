<script setup lang="ts">
import All from "./components/All.vue";

const scientists = [
  { id: "0", name: "Albert Einstein" },
  { id: "1", name: "Marie Curie" },
  { id: "2", name: "Isaac Newton" },
];
</script>

<template>
  <ul>
    <All :items="scientists" :key-of="(item) => item.id">
      <template #item="{ item, key }">
        <li>{{ item.name }} ({{ key }})</li>
      </template>
    </All>
  </ul>
</template>
