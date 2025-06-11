// Path: playwright-tests/api/apiClient.ts
// Purpose: Provides utility function to fetch a user by ID from the JSONPlaceholder API.

/**
 * Fetches a user by ID from the JSONPlaceholder API.
 * @param id - The user ID to fetch.
 * @returns The user object as a Promise.
 * @throws Error if the user cannot be fetched.
 */
export async function getUser(id: number): Promise<any> {
  const response = await fetch(`https://jsonplaceholder.typicode.com/users/${id}`);
  if (!response.ok) {
    throw new Error(`Failed to fetch user with id ${id}`);
  }
  return response.json();
}
