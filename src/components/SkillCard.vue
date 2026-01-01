<script setup lang="ts">
import Block from './Block.vue';
import type { Skill } from '../data/skill';

const props = defineProps<{
	skill: Skill;
}>();
</script>

<template>
	<NuxtLink :to="{ name: 'skills-id', params: { id: props.skill.id } }">
		<Block :isLink="true" class="flex gap-5 flex-col">
			<div class="flex items-center gap-3">
				<div
					v-html="props.skill.icon"
					:style="{ width: '23px', height: '23px' }"
				></div>

				<h3 class="!font-bold text-gray-600 !text-2xl">
					{{ props.skill.title }}
				</h3>
			</div>
			<p>{{ props.skill.description }}</p>
			<div class="flex items-center gap-2">
				<p class="font-medium">Навык</p>
				<div class="w-full h-2 bg-gray-200 rounded-md mt-1">
					<div
						class="h-full rounded-md"
						:style="{
							width: props.skill.level + '%',
							backgroundColor: props.skill.color,
						}"
					></div>
				</div>
				<p
					class="font-medium text-shadow-md"
					:style="{ color: props.skill.color }"
				>
					{{ props.skill.level }}%
				</p>
			</div>
		</Block>
	</NuxtLink>
</template>
