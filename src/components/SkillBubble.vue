<script setup lang="ts">
import { skills } from '../data/skill';

const props = defineProps<{
	id: string;
}>();

const skill = skills.find((s) => s.id === props.id);
</script>

<template>
	<NuxtLink :to="{ name: 'skills-id', params: { id: props.id } }">
		<div
			v-if="skill"
			class="flex px-3 py-1 gap-2 border-3 rounded-2xl items-center"
			:style="{ borderColor: skill.color }"
		>
			<div v-html="skill.icon"></div>
			<div class="font-semibold text-lg">
				{{ skill.title }}
			</div>
		</div>
	</NuxtLink>
</template>
