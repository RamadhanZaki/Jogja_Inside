<template>
  <div>
    <Sidebar :active-tab="activeTab" @navigate="handleNavigate" />
    <main class="main-content">
      <UserList
        v-if="activeTab === 'akunWeb' && !isEditing"
        @edit-user="handleEditUser"
      />
      <EditUser
        v-if="activeTab === 'akunWeb' && isEditing"
        :user="selectedUser"
        @cancel="cancelEdit"
        @update="updateUser"
      />
      <CrudTeam v-if="activeTab === 'tim'" />
      <CrudDestination v-if="activeTab === 'kontenDestinasi'" />
    </main>
  </div>
</template>

<script>
import Sidebar from '@/components/Admin/SideBarAdminPanel.vue'
import CrudTeam from '@/components/Admin/TeamList.vue'
import CrudDestination from '@/components/Admin/DestinationList.vue'
import UserList from '@/components/Admin/UserList.vue'
import EditUser from '@/components/Admin/EditUser.vue'

export default {
  components: {
    Sidebar,
    UserList,
    CrudTeam,
    CrudDestination,
    EditUser,
  },
  data() {
    return {
      activeTab: 'akunWeb',
      isEditing: false,
      selectedUser: null,
    }
  },
  methods: {
    handleNavigate(tab) {
      this.activeTab = tab
      this.isEditing = false
      this.selectedUser = null
    },
    handleEditUser(user) {
      this.selectedUser = user
      this.isEditing = true
    },
    cancelEdit() {
      this.isEditing = false
      this.selectedUser = null
    },
    updateUser(updatedUser) {
      console.log('User updated:', updatedUser)
      this.isEditing = false
      this.selectedUser = null
    },
  },
  mounted() {
    const token = localStorage.getItem('adminToken')
    if (!token || token === 'null' || token === '') {
      this.$router.push('/admin/login')
    }
  }
}
</script>

<style scoped>
/* Sidebar tetap di kiri */
.sidebar {
  position: fixed;
  left: 0;
  top: 0;
  bottom: 0;
  width: 240px;
  background-color: #2c3e50;
  color: #ecf0f1;
  padding: 20px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  z-index: 100;
}

/* Main content di sebelah kanan sidebar, dan scroll pakai body */
.main-content {
  margin-left: 240px;
  padding: 20px;
  background-color: #f4f6f8;
}
</style>
