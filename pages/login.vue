<script setup lang="ts">
import { ReloadIcon } from '@radix-icons/vue';
import { z } from 'zod';

const { t } = useI18n();
const supabase = useSupabaseClient();

definePageMeta({
    layout: false,
});

const loginSchema = z.object({
    email: z.string().email(),
    password: z.string(),
});

const { handleSubmit, defineField, isSubmitting, errorBag } = useForm({
    validationSchema: toTypedSchema(loginSchema),
});

const [email] = defineField('email');
const [password] = defineField('password');

const onSubmit = handleSubmit(async (values) => {
    const { error } = await supabase.auth.signInWithPassword({
        email: values.email,
        password: values.password,
    });

    if (error) {
        console.log(error);
    }
});
</script>

<template>
    <div class="w-screen h-screen bg-gray-50 flex justify-center items-center">
        <SCCard class="w-full max-w-sm">
            <SCCardHeader>
                <SCCardTitle class="text-2xl">
                    {{ t('pages.login.login') }}
                </SCCardTitle>
                <SCCardDescription>
                    {{ t('pages.login.content') }}
                </SCCardDescription>
            </SCCardHeader>
            <SCCardContent class="grid gap-4">
                <div class="grid gap-2">
                    <SCLabel for="email">
                        Email
                    </SCLabel>
                    <SCInput
                        v-model:model-value="email"
                        type="email"
                        placeholder="m@example.com"
                        required
                    />
                    <SCLabel class="text-[0.8rem] font-medium text-destructive">
                        {{ errorBag.email }}
                    </SCLabel>
                </div>
                <div class="grid gap-2">
                    <SCLabel for="password">
                        Password
                    </SCLabel>
                    <SCInput
                        v-model:model-value="password"
                        type="password"
                        required
                    />
                    <SCLabel class="text-[0.8rem] font-medium text-destructive">
                        {{ errorBag.password }}
                    </SCLabel>
                </div>
            </SCCardContent>
            <SCCardFooter>
                <SCButton
                    class="w-full"
                    :disabled="isSubmitting"
                    @click="onSubmit"
                >
                    <ReloadIcon
                        v-if="isSubmitting"
                        class="w-4 h-4 mr-2 animate-spin"
                    />
                    {{ t('pages.login.signin') }}
                </SCButton>
            </SCCardFooter>
        </SCCard>
    </div>
</template>
