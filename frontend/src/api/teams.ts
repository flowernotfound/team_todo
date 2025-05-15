import axios from 'axios';

const API_BASE_URL = 'http://localhost:3000/api';

export interface Team {
  id: number;
  name: string;
  owner_id: number;
  created_at: string;
  updated_at: string;
}

export const getTeams = async (): Promise<Team[]> => {
  const response = await axios.get<Team[]>(`${API_BASE_URL}/teams`);
  return response.data;
};

export const createTeam = async (team: { name: string; owner_id: number }): Promise<Team> => {
  const response = await axios.post<Team>(`${API_BASE_URL}/teams`, {
    team,
  });
  return response.data;
};

export const getTeamDetail = async (id: number): Promise<Team> => {
  const response = await axios.get<Team>(`${API_BASE_URL}/teams/${id}`);
  return response.data;
};

export const deleteTeam = async (id: number): Promise<void> => {
  await axios.delete(`${API_BASE_URL}/teams/${id}`);
};
