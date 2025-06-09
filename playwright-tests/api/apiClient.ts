export async function getUser(id: number): Promise<any> {
  const response = await fetch(`https://jsonplaceholder.typicode.com/users/${id}`);
  if (!response.ok) {
    throw new Error(`Failed to fetch user with id ${id}`);
  }
  return response.json();
}
