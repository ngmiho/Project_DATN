import axios from "./customized-axios";

export const fetchGetAddressById = (id) => axios.get(`/api/addresses/${id}`);
