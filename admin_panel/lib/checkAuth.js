import { useRouter } from 'next/router';
import { clearStorage, getStorage } from './storage';

export default () => {
    const router = useRouter();
    const auth = getStorage('auth');
    if (!auth || auth == undefined || auth.length == 0) {
        router.replace("/admin/login");
    }
}

export const logout = () => {
    clearStorage();
    const router = useRouter();
    router.replace("/admin/login");
}