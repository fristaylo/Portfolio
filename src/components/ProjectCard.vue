<script setup lang="ts">
import { type Project } from '../data/projects';
import Image from '../components/Image.vue';
import Block from '../components/Block.vue';
import SkillBubble from './SkillBubble.vue';

const props = defineProps<{
	project: Project;
}>();
</script>

<template>
	<NuxtLink :to="{ name: 'projects-id', params: { id: project.id } }">
		<Block :isLink="true" class="h-full flex flex-col">
			<h3 class="mb-5">{{ project.title }}</h3>

			<Image
				:src="project.imageUrl"
				:alt="project.title"
				class="mb-3 max-w-full h-auto min-h-80 rounded-lg shadow-md"
			/>

			<p class="mb-3">{{ project.description }}</p>
			<div class="flex gap-2 flex-wrap mt-auto">
				<SkillBubble
					v-for="techId in project.technologies"
					:key="techId"
					:id="techId"
				/>
			</div>
		</Block>
	</NuxtLink>
</template>
