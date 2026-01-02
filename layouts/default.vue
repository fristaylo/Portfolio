<script setup lang="ts">
import HeaderBlock from '../src/components/HeaderBlock.vue';
import FooterBlock from '../src/components/FooterBlock.vue';
</script>

<template>
	<div class="flex flex-col min-h-screen bg-gray-100">
		<HeaderBlock />
		<main class="container mx-auto p-3 flex-grow">
			<slot />
		</main>
		<FooterBlock />
	</div>
</template>
