<template>
  <div class="dashboard-container">
    <Sidebar :active-tab="activeTab" @navigate="handleNavigate" />
    <div class="content">
      <UserList 
        v-if="activeTab === 'akunWeb'" 
        @edit-user="handleEditUser" 
        @add-user="handleAddUser" 
      />
      <AddUser 
        v-if="activeTab === 'addUser'" 
        @cancel="handleCancelAddUser" 
        @saved="handleUserSaved" 
      />
      <TeamList v-if="activeTab === 'tim'" />
      <CrudDestination v-if="activeTab === 'kontenDestinasi'" />
      <EditUser 
        v-if="activeTab === 'editUser'" 
        :user="selectedUser" 
        @update="handleUserUpdate" 
      />
    </div>
  </div>
</template>

<script>
import Sidebar from '@/components/Admin/SideBarAdminPanel.vue';
import TeamList from '@/components/Admin/TeamList.vue';
import CrudDestination from '@/components/Admin/DestinationList.vue';
import UserList from '@/components/Admin/UserList.vue';
import EditUser from '@/components/Admin/EditUser.vue';
import AddUser from '@/components/Admin/AddUser.vue';

export default {
  components: {
    Sidebar,
    UserList,
    TeamList, 
    CrudDestination,
    EditUser,
    AddUser,
  },
  data() {
    return {
      activeTab: 'akunWeb',
      selectedUser: null,
    };
  },
  methods: {
    handleNavigate(tab) {
      this.activeTab = tab;
    },
    handleEditUser(user) {
      this.selectedUser = user;
      this.activeTab = 'editUser';
    },
    handleAddUser() {
      this.activeTab = 'addUser';
    },
    handleCancelAddUser() {
      this.activeTab = 'akunWeb';
    },
    handleUserSaved(newUser) {
      console.log('User added:', newUser);
      this.activeTab = 'akunWeb';
    },
    handleUserUpdate(updatedUser) {
      console.log('User updated:', updatedUser);
      this.activeTab = 'akunWeb';
    },
  },
};
</script>

<style scoped>
.dashboard-container {
  display: flex;
  min-height: 100vh;
}
.content {
  flex-grow: 1;
  padding: 20px;
  background-color: #f4f6f8;
}
</style>
