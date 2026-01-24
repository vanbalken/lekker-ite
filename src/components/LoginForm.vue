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
/* Card */
.login-card {
  width: 100%;
  max-width: 400px;
  background: #2a2a2a;
  padding: 1.5rem;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

@media (min-width: 480px) {
  .login-card {
    padding: 2rem;
  }
}

.login-title {
  text-align: center;
  margin-bottom: 1.5rem;
  font-size: 1.5rem;
  color: #e0e0e0;
}

.login-form {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.login-input {
  padding: 0.75rem 1rem;
  border: 1px solid #444;
  border-radius: 8px;
  font-size: 1rem;
  background: #1a1a1a;
  color: #e0e0e0;
  transition: border 0.2s;
}

.login-input::placeholder {
  color: #888;
}

.login-input:focus {
  border-color: #2563eb;
  outline: none;
}

.login-button {
  padding: 0.75rem 1rem;
  background: #2563eb;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 1rem;
  cursor: pointer;
  transition: background 0.2s;
}

.login-button:hover {
  background: #1d4ed8;
}

.login-error {
  color: #ff6b6b;
  text-align: center;
  font-size: 0.9rem;
}
</style>
