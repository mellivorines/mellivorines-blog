<template>
  <div class="flex-shrink-0">
    <div class="rounded-full ring-gray-100 overflow-hidden shaodw-lg w-9 xl:w-10">
      <template v-if="url != null"> <img class="avatar-img" :src="url" alt="" /></template>
      <template v-else><img class="avatar-img" :src="default" alt="" /></template>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, toRefs } from 'vue'

export default defineComponent({
  name: 'Avatar',
  props: ['url'],
  setup(props) {
    return {
      url: toRefs(props).url,
      default: 'http://127.0.0.1:8080/local-plus/photos/656a9324a2f42ab815604db5.jpg'
    }
  }
})
</script>
<style lang="scss" scoped>
.avatar-img {
  transition-property: transform;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-duration: 800ms;
  transform: rotate(-360deg);
}
.avatar-img:hover {
  transform: rotate(360deg);
}
</style>
