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
			:style="{
				'--skill-color': skill.color,
				'--skill-color-hover': `color-mix(in srgb, var(--skill-color) 75%, black)`
			}"
			class="flex px-2 py-0.5 gap-2 border-3 rounded-2xl items-center
			border-[color:var(--skill-color)] transition-colors duration-300
			hover:border-[color:var(--skill-color-hover)]"
		>
			<div v-html="skill.icon"></div>
			<div class="font-semibold text-md">
				{{ skill.title }}
			</div>
		</div>
	</NuxtLink>
</template>
