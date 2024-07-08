import sys

def nearest_neighbor(graph):
    num_cities = len(graph)
    visited = [False] * num_cities
    path = []
    current_city = 0
    visited[current_city] = True
    path.append(current_city)
    
    for _ in range(num_cities - 1):
        nearest_city = None
        min_distance = sys.maxsize
        
        for next_city in range(num_cities):
            if not visited[next_city] and graph[current_city][next_city] < min_distance:
                nearest_city = next_city
                min_distance = graph[current_city][next_city]
        
        current_city = nearest_city
        visited[current_city] = True
        path.append(current_city)
    
    path.append(path[0]) 
    return path

def take_input():
    graph = []
    num_cities = int(input("Enter the number of cities: "))
    print("Enter the distance matrix (one row at a time):")
    
    for _ in range(num_cities):
        row = list(map(int, input().split()))
        graph.append(row)
    
    return graph

if __name__ == "__main__":
    graph = take_input()
    optimal_path = nearest_neighbor(graph)
    print("Optimal Path:", optimal_path)
