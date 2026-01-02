<script setup lang="ts">
import { skills } from '../../src/data/skill.ts';
import { useRoute } from 'vue-router';
import PageTitle from '../../src/components/PageTitle.vue';

const route = useRoute();
const skillId = route.params.id as string;

const skillData = skills.find((skill) => skill.id === skillId);
</script>

<template>
	<div v-if="skillData">
		<PageTitle :title="skillData.title" />
		<p>{{ skillData.description }}</p>
	</div>
	<div v-else>
		<PageTitle title="Навык не найден" />
		<p>Запрошенный навык не существует.</p>
	</div>
</template>
