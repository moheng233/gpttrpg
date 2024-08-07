// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    compatibilityDate: '2024-04-03',
    devtools: { enabled: true },
    modules: [
        '@nuxt/eslint',
        '@nuxtjs/i18n',
        '@nuxtjs/supabase',
        '@nuxtjs/tailwindcss',
        '@vee-validate/nuxt',
        'shadcn-nuxt',
    ],
    eslint: {
        config: {
            stylistic: {
                indent: 4,
                quotes: 'single',
                semi: true,
            },
        },
    },
    i18n: {
        lazy: true,
        langDir: 'lang',
        locales: [
            {
                code: 'zh-CN',
                file: 'zh-CN.json',
            },
            {
                code: 'en-US',
                file: 'en-US.json',
            },
        ],
        defaultLocale: 'zh-CN',
    },
    supabase: {
        redirectOptions: {
            login: '/login',
            callback: '/confirm',
        },
    },
    runtimeConfig: {
        hunyuan: {
            secretId: '',
            secretKey: '',
        },
    },
    shadcn: {
        prefix: 'SC',
    },
});
