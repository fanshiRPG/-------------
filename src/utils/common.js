import { useAuthStore } from "@/stores";

const getToken = () => {
  const userAuth = useAuthStore();
  return userAuth.authToken;
};

const getUserInfo = () => {
  const userAuth = useAuthStore();
  return userAuth.authInfo;
}

export { getToken, getUserInfo }
