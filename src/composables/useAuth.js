import { ref, onMounted, onUnmounted } from 'vue';
import { supabase } from '@/lib/supabase';

const session = ref(null);

export function useAuth() {
  let authListener = null;

  onMounted(async () => {
    const { data } = await supabase.auth.getSession();
    session.value = data.session;

    authListener = supabase.auth.onAuthStateChange((_event, _session) => {
      session.value = _session;
    });
  });

  onUnmounted(() => {
    authListener?.data?.subscription?.unsubscribe();
  });

  async function loginWithEmail(email, password) {
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password,
    });

    if (error) throw error;

    session.value = data.session;
    return data.user;
  }

  async function logout() {
    await supabase.auth.signOut();
  }

  return {
    session,
    loginWithEmail,
    logout,
  };
}
