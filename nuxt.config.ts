// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
	devtools: { enabled: true },
	modules: ['@nuxtjs/tailwindcss'],

	app: {
		head: {
			title: 'It project',
			meta: [{ name: 'charset', content: 'utf-8' }],
		},
	},

	css: ['./src/assets/index.css'],

	compatibilityDate: '2025-06-23',
});
