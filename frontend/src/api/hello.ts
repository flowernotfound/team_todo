import axios from 'axios';

const API_BASE_URL = 'http://localhost:3000/api';

export const getHelloMessage = async (): Promise<string> => {
  const response = await axios.get<{ message: string }>(`${API_BASE_URL}/hello`);
  return response.data.message;
};
