<script setup>
import { ref } from 'vue';
import { useAuth } from '@/composables/useAuth';

const { loginWithEmail } = useAuth();

const email = ref('');
const password = ref('');
const errorMessage = ref('');

async function login() {
  errorMessage.value = '';
  try {
    await loginWithEmail(email.value, password.value);
  } catch (err) {
    errorMessage.value = err.message || 'Inloggen mislukt';
  }
}
</script>

<template>
  <div class="login-card">
    <h2 class="login-title">Inloggen</h2>
    <form @submit.prevent="login" class="login-form">
      <input v-model="email" type="email" placeholder="Email" class="login-input" required />
      <input
        v-model="password"
        type="password"
        placeholder="Wachtwoord"
        class="login-input"
        required
        @keyup.enter="login"
      />
      <button type="submit" class="login-button">Login</button>
      <p v-if="errorMessage" class="login-error">{{ errorMessage }}</p>
    </form>
  </div>
</template>

<style scoped>
.login-card {
  max-width: 400px;
  margin: 2rem auto;
  background: white;
  padding: 2rem;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.login-title {
  text-align: center;
  margin-bottom: 1.5rem;
  font-size: 1.5rem;
  color: #333;
}

.login-form {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.login-input {
  padding: 0.75rem 1rem;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-size: 1rem;
  transition: border 0.2s;
}

.login-input:focus {
  border-color: #0070f3;
  outline: none;
}

.login-button {
  padding: 0.75rem 1rem;
  background: #0070f3;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 1rem;
  cursor: pointer;
  transition: background 0.2s;
}

.login-button:hover {
  background: #005ac1;
}

.login-error {
  color: red;
  text-align: center;
  font-size: 0.9rem;
}
</style>
