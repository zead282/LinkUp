import {systemRoles} from '../../utiles/systemroles.js';

export const endpointsroles={
    add_post:[systemRoles.USER,systemRoles.ADMIN],
    update:[systemRoles.USER],
    delete:[systemRoles.USER,systemRoles.ADMIN]
}

