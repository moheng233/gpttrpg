<script setup lang="ts">
import { Bird, Book, Bot, Code2, CornerDownLeft, LifeBuoy, Mic, Paperclip, Rabbit, Settings, Settings2, Share, SquareTerminal, SquareUser, Triangle, Turtle } from 'lucide-vue-next';
</script>

<template>
    <div class="grid h-screen w-full pl-[53px]">
        <aside class="inset-y fixed  left-0 z-20 flex h-full flex-col border-r">
            <div class="border-b p-2">
                <SCButton
                    variant="outline"
                    size="icon"
                    aria-label="Home"
                >
                    <Triangle class="size-5 fill-foreground" />
                </SCButton>
            </div>
            <nav class="grid gap-1 p-2">
                <SCTooltip>
                    <SCTooltipTrigger as-child>
                        <SCButton
                            variant="ghost"
                            size="icon"
                            class="rounded-lg bg-muted"
                            aria-label="Playground"
                        >
                            <SquareTerminal class="size-5" />
                        </SCButton>
                    </SCTooltipTrigger>
                    <SCTooltipContent
                        side="right"
                        :side-offset="5"
                    >
                        Playground
                    </SCTooltipContent>
                </SCTooltip>
                <SCTooltip>
                    <SCTooltipTrigger as-child>
                        <SCButton
                            variant="ghost"
                            size="icon"
                            class="rounded-lg"
                            aria-label="Models"
                        >
                            <Bot class="size-5" />
                        </SCButton>
                    </SCTooltipTrigger>
                    <SCTooltipContent
                        side="right"
                        :side-offset="5"
                    >
                        Models
                    </SCTooltipContent>
                </SCTooltip>
                <SCTooltip>
                    <SCTooltipTrigger as-child>
                        <SCButton
                            variant="ghost"
                            size="icon"
                            class="rounded-lg"
                            aria-label="API"
                        >
                            <Code2 class="size-5" />
                        </SCButton>
                    </SCTooltipTrigger>
                    <SCTooltipContent
                        side="right"
                        :side-offset="5"
                    >
                        API
                    </SCTooltipContent>
                </SCTooltip>
                <SCTooltip>
                    <SCTooltipTrigger as-child>
                        <SCButton
                            variant="ghost"
                            size="icon"
                            class="rounded-lg"
                            aria-label="Documentation"
                        >
                            <Book class="size-5" />
                        </SCButton>
                    </SCTooltipTrigger>
                    <SCTooltipContent
                        side="right"
                        :side-offset="5"
                    >
                        Documentation
                    </SCTooltipContent>
                </SCTooltip>
                <SCTooltip>
                    <SCTooltipTrigger as-child>
                        <SCButton
                            variant="ghost"
                            size="icon"
                            class="rounded-lg"
                            aria-label="Settings"
                        >
                            <Settings2 class="size-5" />
                        </SCButton>
                    </SCTooltipTrigger>
                    <SCTooltipContent
                        side="right"
                        :side-offset="5"
                    >
                        Settings
                    </SCTooltipContent>
                </SCTooltip>
            </nav>
            <nav class="mt-auto grid gap-1 p-2">
                <SCTooltip>
                    <SCTooltipTrigger as-child>
                        <SCButton
                            variant="ghost"
                            size="icon"
                            class="mt-auto rounded-lg"
                            aria-label="Help"
                        >
                            <LifeBuoy class="size-5" />
                        </SCButton>
                    </SCTooltipTrigger>
                    <SCTooltipContent
                        side="right"
                        :side-offset="5"
                    >
                        Help
                    </SCTooltipContent>
                </SCTooltip>
                <SCTooltip>
                    <SCTooltipTrigger as-child>
                        <SCButton
                            variant="ghost"
                            size="icon"
                            class="mt-auto rounded-lg"
                            aria-label="Account"
                        >
                            <SquareUser class="size-5" />
                        </SCButton>
                    </SCTooltipTrigger>
                    <SCTooltipContent
                        side="right"
                        :side-offset="5"
                    >
                        Account
                    </SCTooltipContent>
                </SCTooltip>
            </nav>
        </aside>
    </div>
</template>
