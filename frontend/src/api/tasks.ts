import axios from 'axios';

const API_BASE_URL = 'http://localhost:3000/api';

export interface Task {
  id: number;
  title: string;
  body: string;
  status: number;
  assignee_id: number | null;
  assignee_name: string | null;
  created_at: string;
  updated_at: string;
}

export const getTasksForTeam = async (teamId: number): Promise<Task[]> => {
  const response = await axios.get<Task[]>(`${API_BASE_URL}/teams/${teamId}/tasks`);
  return response.data;
};
