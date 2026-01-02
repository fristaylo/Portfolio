<script setup lang="ts">
import { useRoute } from 'vue-router'; // Nuxt provides useRoute as a composable
import { ref, watch } from 'vue';
import { projects, type Project } from '../../src/data/projects';
import Image from '../../src/components/Image.vue';
import PageTitle from '../../src/components/PageTitle.vue';
import SkillBubble from '../../src/components/SkillBubble.vue';

const route = useRoute();
const projectId = ref(route.params.id as string);
const projectData = ref<Project | null>(null);

const fetchProjectData = (id: string) => {
	projectData.value = projects.find((project) => project.id === id) || null;
	if (!projectData.value) {
		console.error('Проект с ID', id, 'не найден');
	}
};

fetchProjectData(projectId.value);

watch(
	() => route.params.id,
	(newProjectId) => {
		projectId.value = newProjectId as string;
		fetchProjectData(projectId.value);
	},
);
</script>

<template>
	<div v-if="projectData">
		<h1 class="text-3xl mb-5 font-bold">{{ projectData.title }}</h1>
		<p class="mb-3">{{ projectData.description }}</p>
		<p v-if="projectData.fullDescription" class="mb-3">
			{{ projectData.fullDescription }}
		</p>

		<Image
			:src="projectData.imageUrl"
			:alt="projectData.title"
			class="mb-3 max-w-full h-auto min-h-80 rounded-lg shadow-md"
		/>

		<h3 class="text-lg font-semibold mb-1">Используемые технологии</h3>
		<div class="flex gap-2 flex-wrap mb-3">
			<SkillBubble
				v-for="techId in projectData.technologies"
				:key="techId"
				:id="techId"
			/>
		</div>
		<a
			v-if="projectData.link"
			:href="projectData.link"
			target="_blank"
			class="text-md text-blue-500 font-semibold hover:text-blue-800 duration-200"
		>
			Перейти на сайт проекта
		</a>
	</div>
	<div v-else>
		<PageTitle icon="alert" title="Проект не найден" />
		<p>Запрошенный проект не существует.</p>
	</div>
</template>
