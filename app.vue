<script setup lang="ts">
import i18next from 'i18next';
import { z } from 'zod';
import { zodI18nMap } from 'zod-i18n-map';
import translation from 'zod-i18n-map/locales/zh-CN/zod.json';

i18next.init({
    lng: 'zh_CN',
    resources: {
        zh_CN: {
            zod: translation,
        },
    },
});

z.setErrorMap(zodI18nMap);
</script>

<template>
    <div>
        <NuxtLoadingIndicator />
        <NuxtRouteAnnouncer />

        <NuxtLayout>
            <NuxtPage />
        </NuxtLayout>
    </div>
</template>
