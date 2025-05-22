<template>
  <div class="home">
    <Header/>
  </div>
</template>

<script>
// @ is an alias to /src
import Header from '@/components/Home/Header.vue'

export default {
  name: 'HomePage',
  components: {
    Header,
  }
}
</script>
